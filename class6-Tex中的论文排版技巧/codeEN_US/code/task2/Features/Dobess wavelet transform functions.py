# Import the relevant libraries
import os
import pandas as pd
import pywt
import cv2
import numpy as np

if __name__ == '__main__':
    image = "D:\\2022 APMCM Problems\\2022 APMCM Problem A\\Attachment 1"
    image_path = os.listdir(image)
    s = []
    for i in range(len(image_path)):
        image0 = image + '\\' + image_path[i]
        p = []
        img = cv2.imread(image0, 0)
        cA, (cH, cV, cD) = pywt.dwt2(img, "db2")
        cA = np.mean(cA)  # Low frequency mean
        p.append(cA)
        cH = np.mean(cH)  # Horizontal high-frequency mean
        p.append(cH)
        cV = np.mean(cV)  #Vertical high-frequency mean
        p.append(cV)
        cD = np.mean(cD)  # Diagonal high-frequency mean
        p.append(cD)
        s.append(p)
        print(s)
    # Transform the list matrix and put the data into a CSV file
    s = np.array(s)
    list1 = s[:, 0]
    list2 = s[:, 1]
    list3 = s[:, 2]
    list4 = s[:, 3]
    df = pd.DataFrame(
        {'cA': list1, 'cH': list2,
         'cV': list3, 'cD': list4})
    df.to_csv('s_data_3.csv', index=False)
    # -------------------------------
