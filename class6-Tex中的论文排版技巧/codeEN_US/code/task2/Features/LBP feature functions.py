# Import the relevant libraries
import pandas as pd
from PIL import Image
from pylab import *
import os

# Define the LBP instance class
class LBP:
    def __init__(self):
        # 旋转不变模式的36种特征值从小到大进行序列化编号
        self.revolve_map = {0: 0, 1: 1, 3: 2, 5: 3, 7: 4, 9: 5, 11: 6, 13: 7, 15: 8, 17: 9, 19: 10, 21: 11, 23: 12,
                            25: 13, 27: 14, 29: 15, 31: 16, 37: 17, 39: 18, 43: 19, 45: 20, 47: 21, 51: 22, 53: 23,
                            55: 24,
                            59: 25, 61: 26, 63: 27, 85: 28, 87: 29, 91: 30, 95: 31, 111: 32, 119: 33, 127: 34, 255: 35}
        # 等价模式的58种特征值从小到大进行序列化编号
        self.uniform_map = {0: 0, 1: 1, 2: 2, 3: 3, 4: 4, 6: 5, 7: 6, 8: 7, 12: 8,
                            14: 9, 15: 10, 16: 11, 24: 12, 28: 13, 30: 14, 31: 15, 32: 16,
                            48: 17, 56: 18, 60: 19, 62: 20, 63: 21, 64: 22, 96: 23, 112: 24,
                            120: 25, 124: 26, 126: 27, 127: 28, 128: 29, 129: 30, 131: 31, 135: 32,
                            143: 33, 159: 34, 191: 35, 192: 36, 193: 37, 195: 38, 199: 39, 207: 40,
                            223: 41, 224: 42, 225: 43, 227: 44, 231: 45, 239: 46, 240: 47, 241: 48,
                            243: 49, 247: 50, 248: 51, 249: 52, 251: 53, 252: 54, 253: 55, 254: 56,
                            255: 57}

    # Convert to grayscale map to obtain the pixel information of grayscale map
    def describe(self, image):
        image_array = np.array(Image.open(image).convert('L'))
        image_array = np.array(image_array).astype(np.float32)
        return image_array
    # ----------------------------------------------------------
    # LBP raw feature calculation algorithm: Compare the pixels at the specified location of the image with the surrounding 8 pixels
    # Points larger than the center pixel are assigned 1, and points smaller than the center pixel are assigned 0, returning the resulting binary sequence
    # ----------------------------------------------------------
    def calute_basic_lbp(self, d_array, i, j):
        sum = []
        if d_array[i - 1, j - 1] > d_array[i, j]:
            sum.append(1)
        else:
            sum.append(0)
        if d_array[i - 1, j] > d_array[i, j]:
            sum.append(1)
        else:
            sum.append(0)
        if d_array[i - 1, j + 1] > d_array[i, j]:
            sum.append(1)
        else:
            sum.append(0)
        if d_array[i, j - 1] > d_array[i, j]:
            sum.append(1)
        else:
            sum.append(0)
        if d_array[i, j + 1] > d_array[i, j]:
            sum.append(1)
        else:
            sum.append(0)
        if d_array[i + 1, j - 1] > d_array[i, j]:
            sum.append(1)
        else:
            sum.append(0)
        if d_array[i + 1, j] > d_array[i, j]:
            sum.append(1)
        else:
            sum.append(0)
        if d_array[i + 1, j + 1] > d_array[i, j]:
            sum.append(1)
        else:
            sum.append(0)
        return sum
    # ----------------------------------------------------------
    # The binary sequence rotates in a continuous loop to obtain the minimum decimal value of the new binary sequence
    def get_min_for_revolve(self, arr):
        values = []
        circle = arr
        circle.extend(arr)
        for i in range(0, 8):
            j = 0
            sum = 0
            bit_num = 0
            while j < 8:
                sum += circle[i + j] << bit_num
                bit_num += 1
                j += 1
            values.append(sum)
        return min(values)

    # Gets the number of bits in the binary of the value r
    def calc_sum(self, r):
        num = 0
        while (r):
            r &= (r - 1)
            num += 1
        return num

    # Acquire the LBP raw mode features of the image
    def lbp_basic(self, image_array):
        basic_array = np.zeros(image_array.shape, np.uint8)
        width = image_array.shape[0]
        height = image_array.shape[1]
        for i in range(1, width - 1):
            for j in range(1, height - 1):
                sum = self.calute_basic_lbp(image_array, i, j)
                bit_num = 0
                result = 0
                for s in sum:
                    result += s << bit_num
                    bit_num += 1
                basic_array[i, j] = result
        return basic_array

    # Acquire the LBP rotation invariant mode feature of the image
    def lbp_revolve(self, image_array):
        revolve_array = np.zeros(image_array.shape, np.uint8)
        width = image_array.shape[0]
        height = image_array.shape[1]
        for i in range(1, width - 1):
            for j in range(1, height - 1):
                sum = self.calute_basic_lbp(image_array, i, j)
                revolve_key = self.get_min_for_revolve(sum)
                revolve_array[i, j] = self.revolve_map[revolve_key]
        return revolve_array

    # Obtain the LBP equivalent mode features of the image
    def lbp_uniform(self, image_array):
        uniform_array = np.zeros(image_array.shape, np.uint8)
        basic_array = self.lbp_basic(image_array)
        width = image_array.shape[0]
        height = image_array.shape[1]
        for i in range(1, width - 1):
            for j in range(1, height - 1):
                k = basic_array[i, j] << 1
                if k > 255:
                    k = k - 255
                xor = basic_array[i, j] ^ k
                num = self.calc_sum(xor)
                if num <= 2:
                    uniform_array[i, j] = self.uniform_map[basic_array[i, j]]
                else:
                    uniform_array[i, j] = 58
        return uniform_array

    # Acquire the LBP rotation invariant equivalent mode feature of the image
    def lbp_revolve_uniform(self, d_array):
        uniform_revolve_array = np.zeros(d_array.shape, np.uint8)
        basic_array = self.lbp_basic(d_array)
        width = d_array.shape[0]
        height = d_array.shape[1]
        for i in range(1, width - 1):
            for j in range(1, height - 1):
                k = basic_array[i, j] << 1
                if k > 255:
                    k = k - 255
                xor = basic_array[i, j] ^ k
                num = self.calc_sum(xor)
                if num <= 2:
                    uniform_revolve_array[i, j] = self.calc_sum(basic_array[i, j])
                else:
                    uniform_revolve_array[i, j] = 9
        return uniform_revolve_array

# Function calls
# -----------------------------------------------------
if __name__ == '__main__':
    image = "D:\\2022 APMCM Problems\\2022 APMCM Problem A\\Attachment 1"
    image_path = os.listdir(image)
    s = []
    for i in range(len(image_path)):
        image0 = image + '\\' + image_path[i]
        lbp = LBP()
        p = []
        image_array = lbp.describe(image=image0)
        # Original LBP features
        basic_array = lbp.lbp_basic(image_array)
        p.append(basic_array.mean())
        # Rotation does not change the LBP feature
        revolve_array = lbp.lbp_revolve(image_array)
        p.append(revolve_array.mean())
        # Equivalent mode LBP features
        uniform_array = lbp.lbp_uniform(image_array)
        p.append(uniform_array.mean())
        # Rotation invariant equivalence mode LBP feature
        resolve_uniform_array = lbp.lbp_revolve_uniform(image_array)
        p.append(resolve_uniform_array.mean())
        s.append(p)
    # ---------------------------------------------
    # Transform the list matrix and put the data into a CSV file
    s = np.array(s)
    list1 = s[:, 0]
    list2 = s[:, 1]
    list3 = s[:, 2]
    list4 = s[:, 3]
    df = pd.DataFrame(
        {'Original LBP features': list1, 'Rotation does not change the LBP feature': list2, 'Equivalent mode LBP features': list3, 'Rotation invariant equivalence mode LBP feature': list4})
    df.to_csv('s_data_2.csv', index=False)
    # -------------------------------
