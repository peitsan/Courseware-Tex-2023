# Import the relevant libraries
import pandas as pd
from PIL import Image
import numpy as np
import os

"""
# The first-order color moment of the r channel
rd_1 = rd.mean()

# The second-order color moment of the r channel
rd_2 = rd.std()
"""


# A function that defines a third-order color moment
def var(x=None):
    mid = np.mean(((x - x.mean()) ** 3))
    return np.sign(mid) * abs(mid) ** (1 / 3)


# Find the color moments of each order of all pictures in a folder in batches
def GetData(path):
    file_path = os.listdir(path)  # Get all the files under the path
    n_len = len(file_path)
    data = np.zeros([n_len, 9])  # Set up an empty data space
    for i in range(n_len):
        img = Image.open(path + '\\' + file_path[i])  # Open the image under the path
        r, g, b = img.split()  # Get data for three channels
        rd = np.asarray(r, dtype=None, order=None)
        gd = np.asarray(g, dtype=None, order=None)
        bd = np.asarray(b, dtype=None, order=None)
        data[i, 0] = rd.mean()  # Get a first-order color moment
        data[i, 1] = gd.mean()
        data[i, 2] = bd.mean()
        data[i, 3] = rd.std()  # The second-order color moment is obtained
        data[i, 4] = gd.std()
        data[i, 5] = bd.std()
        data[i, 6] = var(rd)  # The third-order color moment is obtained
        data[i, 7] = var(gd)
        data[i, 8] = var(bd)
    return data


if __name__ == '__main__':
    a = GetData(path="D:\\2022 APMCM Problems\\2022 APMCM Problem A\\Attachment 1")
    p = []  # Receive the list
    print(a) #View
    # ----------------------------------
    # Put the feature into the csv file
    list1 = a[:, 0]
    list2 = a[:, 3]
    list3 = a[:, 6]
    list4 = a[:, 1]
    list5 = a[:, 4]
    list6 = a[:, 7]
    list7 = a[:, 2]
    list8 = a[:, 5]
    list9 = a[:, 8]
    # Import nine-dimensional color features
    df = pd.DataFrame({'R1': list1, 'R2': list2, 'R3': list3, 'G1': list4,
                       'G2': list5, 'G3': list6, 'B1': list7, 'B2': list8, 'B3': list9})
    df.to_csv('s_data.csv', index=False)
