# Import the relevant libraries
import pandas as pd
from matplotlib import pyplot as plt
# ----------------------------

def outlier(data):
    d = data.copy(deep=True)
    columns = d.columns
    out_index_ = []
    for col in columns:  # Each column is identified with a box plot
        Q1 = d[col].quantile(q=0.27)  # Lower quartile
        Q2 = d[col].quantile(q=0.7)  # Upper quartile
        low_whisker = Q1 - 1.5 * (Q2 - Q1)  # Lower edge section
        up_whisker = Q2 + 1.5 * (Q2 - Q1)  # Upper edge section

        # Look for abnormal value points, obtain outlier subscripts, and delete data
        r = (d[col] > up_whisker) | (d[col] < low_whisker)
        out = d[col].index[r]
        out_index_ += out.tolist()
    d.drop(out_index_, inplace=True)
    return d
# Import data
dir = "D:\\python\\AEBP\\DG\\1.xlsx"
data_frame = pd.read_excel(dir, sheet_name='Sheet1', usecols='A:D')
columns = data_frame.columns
data_need = data_frame[columns]
df = pd.DataFrame(data_need)
df = outlier(df)  # Handle exception data
# -----------------------------
# Drawing
f = df.boxplot(patch_artist=True,return_type='dict')
color = ['#FF0000','#800000','#FFA500','#6B8E23'] # Set the corresponding color
# -----------------------------------
for box, c in zip(f['boxes'],color):
    # Border color
    box.set(color=c, linewidth=4)
    # The color inside the box
    box.set(facecolor=c)
# Set the box properties
for whisker in f['whiskers']:
    whisker.set(color='black', linewidth=1.5)
for cap in f['caps']:
    cap.set(color='black', linewidth=2)
for median in f['medians']:
    median.set(color='black', linewidth=1.5)
for flier in f['fliers']:
    flier.set(marker='o', color='y', alpha=0.5)
# ---------------------------------------
# Set the x,y label
plt.rcParams['font.sans-serif'] = ['SimHei']
plt.ylabel("Wavelet features",labelpad=2)
plt.xlabel("Time")
plt.show()







