# ----------------
# Import the relevant libraries
import os
import pandas as pd
from PIL import Image
import numpy as np
import cv2

#   ---------------------------------
#   Define a grayscale symbiotic matrix
def fast_glcm(img, vmin=0, vmax=255, nbit=8, kernel_size=5):
    mi, ma = vmin, vmax
    ks = kernel_size
    h, w = img.shape
    # digitize
    bins = np.linspace(mi, ma + 1, nbit + 1)
    gl1 = np.digitize(img, bins) - 1
    gl2 = np.append(gl1[:, 1:], gl1[:, -1:], axis=1)

    # make glcm
    glcm = np.zeros((nbit, nbit, h, w), dtype=np.uint8)
    for i in range(nbit):
        for j in range(nbit):
            mask = ((gl1 == i) & (gl2 == j))
            glcm[i, j, mask] = 1
    kernel = np.ones((ks, ks), dtype=np.uint8)
    for i in range(nbit):
        for j in range(nbit):
            glcm[i, j] = cv2.filter2D(glcm[i, j], -1, kernel)
    glcm = glcm.astype(np.float32)
    return glcm


#   ----------------------------------
#   mean
def fast_glcm_mean(img, vmin=0, vmax=255, nbit=8, ks=5):
    h, w = img.shape
    glcm = fast_glcm(img, vmin, vmax, nbit, ks)
    mean = np.zeros((h, w), dtype=np.float32)
    for i in range(nbit):
        for j in range(nbit):
            mean += glcm[i, j] * i / (nbit) ** 2
    return mean.mean()


#   --------------------------------------
#   standard deviation
def fast_glcm_std(img, vmin=0, vmax=255, nbit=8, ks=5):
    h, w = img.shape
    glcm = fast_glcm(img, vmin, vmax, nbit, ks)
    mean = np.zeros((h, w), dtype=np.float32)
    for i in range(nbit):
        for j in range(nbit):
            mean += glcm[i, j] * i / (nbit) ** 2
    std2 = np.zeros((h, w), dtype=np.float32)
    for i in range(nbit):
        for j in range(nbit):
            std2 += (glcm[i, j] * i - mean) ** 2
    std = np.sqrt(std2)
    std = np.std(std)
    return std


#   -----------------------------------------------
#   contrast
def fast_glcm_contrast(img, vmin=0, vmax=255, nbit=8, ks=5):
    h, w = img.shape
    glcm = fast_glcm(img, vmin, vmax, nbit, ks)
    cont = np.zeros((h, w), dtype=np.float32)
    for i in range(nbit):
        for j in range(nbit):
            cont += glcm[i, j] * (i - j) ** 2
    return cont.mean()


#   ---------------------------------------------------
#   Dissimilarity
def fast_glcm_dissimilarity(img, vmin=0, vmax=255, nbit=8, ks=5):
    h, w = img.shape
    glcm = fast_glcm(img, vmin, vmax, nbit, ks)
    diss = np.zeros((h, w), dtype=np.float32)
    for i in range(nbit):
        for j in range(nbit):
            diss += glcm[i, j] * np.abs(i - j)
    return diss.mean()


#   -------------------------------------------------------
#   Homogeneity/inverse gap
def fast_glcm_homogeneity(img, vmin=0, vmax=255, nbit=8, ks=5):
    h, w = img.shape
    glcm = fast_glcm(img, vmin, vmax, nbit, ks)
    homo = np.zeros((h, w), dtype=np.float32)
    for i in range(nbit):
        for j in range(nbit):
            homo += glcm[i, j] / (1. + (i - j) ** 2)
    return homo.mean()


#   ----------------------------------------------------
#   Angular second-order moment / energy
def fast_glcm_ASM(img, vmin=0, vmax=255, nbit=8, ks=5):
    h, w = img.shape
    glcm = fast_glcm(img, vmin, vmax, nbit, ks)
    asm = np.zeros((h, w), dtype=np.float32)
    for i in range(nbit):
        for j in range(nbit):
            asm += glcm[i, j] ** 2
    ene = np.sqrt(asm)
    ene = np.mean(ene)
    return asm.mean(), ene


#   -----------------------------------------------------
#   能量(Energy)
def fast_glcm_max(img, vmin=0, vmax=255, nbit=8, ks=5):
    glcm = fast_glcm(img, vmin, vmax, nbit, ks)
    max_ = np.max(glcm, axis=(0, 1))
    return max_.mean()


#   ---------------------------------------------------------
#   Entropy
def fast_glcm_entropy(img, vmin=0, vmax=255, nbit=8, ks=5):
    glcm = fast_glcm(img, vmin, vmax, nbit, ks)
    pnorm = glcm / np.sum(glcm, axis=(0, 1)) + 1. / ks ** 2
    ent = np.sum(-pnorm * np.log(pnorm), axis=(0, 1))
    return ent.mean()


# Function calls
if __name__ == '__main__':
    # --------------
    # Set the initial parameters
    nbit = 8
    ks = 5
    mi, ma = 0, 255
    # --------------------
    path = 'D:\\2022 APMCM Problems\\2022 APMCM Problem A\\Attachment 1'
    path1 = os.listdir(path)
    n_len = len(path1)
    key = np.zeros([n_len, 8])  # Define the receive zeros matrix
    s = []
    for i in range(n_len):
        p = []
        # print(p)
        # print(s)
        img = np.array(Image.open(path + '\\' + path1[i]).convert('L'))
        h, w = img.shape
        img = np.array(img).astype(np.float32)
        glcm_mean = fast_glcm_mean(img, mi, ma, nbit, ks)  # mean
        p.append(glcm_mean)
        glcm_std = fast_glcm_std(img)  # standard deviation
        p.append(glcm_std)
        glcm_cont = fast_glcm_contrast(img)  # contrast
        p.append(glcm_cont)
        glcm_diss = fast_glcm_dissimilarity(img)  # Dissimilarity
        p.append(glcm_diss)
        glcm_homo = fast_glcm_homogeneity(img)  # Homogeneity/inverse gap
        p.append(glcm_homo)
        glcm_asm, glcm_ene = fast_glcm_ASM(img)  # Angular 2nd Order Moment / Energy (ASM)
        p.append(glcm_asm)
        p.append(glcm_ene)
        glcm_max = fast_glcm_max(img)  # 能量(Energy)
        p.append(glcm_max)
        glcm_ent = fast_glcm_entropy(img)  # Entropy
        p.append(glcm_ent)
        s.append(p)
    s = np.array(s)
    list1 = s[:, 0]
    list2 = s[:, 1]
    list3 = s[:, 2]
    list4 = s[:, 3]
    list5 = s[:, 4]
    list6 = s[:, 5]
    list7 = s[:, 6]
    list8 = s[:, 7]
    list9 = s[:, 8]
    df = pd.DataFrame({'mean': list1, 'standard deviation': list2, 'contrast': list3,
                       'Dissimilarity': list4, 'Homogeneity/inverse gap': list5, 'Angular second-order moment': list6,
                       'Energy(ASM)': list7, '能量(Energy)': list8, 'Entropy': list9})
    df.to_csv('s_data_1.csv', index=False)
