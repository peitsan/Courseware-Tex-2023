from cnocr import CnOcr
import pandas as pd
import re
ocr=CnOcr()
import pandas as pd
from PIL import Image
import os
class ReadIMG():
    def __init__(self,root_dir):
        self.rootdir=root_dir
        self.listdir=os.listdir(root_dir)
        self.lenth=len(self.listdir)
    def __getitem__(self, item):
        path_oldname=self.listdir[item]
        path=os.path.join(self.rootdir,path_oldname)
        img=Image.open(path)
        name=path_oldname.split('.')[0]
        return img,name
    def __len__(self):
        return self.lenth
rootdir=r'D:\Attachment 1'
rootimgs=ReadIMG(rootdir)

text_list=[]
name_list=[]
for img,name in rootimgs:
    text=[]
    name_list.append(name)
    res=ocr.ocr(img.crop((0,0,200,200)))
    for words in res:
        text.append(words['text'])
    text_list.append(text)

for i in range(len(text_list)):
    a=text_list[i]

    for j in range(len(a)):
        b=a[j]
        if ''==b:
           continue
        text_list[i][j]=re.findall('\d+',b)[-1]
print(text_list)
for i in range(len(text_list)):
    a=text_list[i]
    true_list=[]
    for j in a:
        if j == '':
            continue
        elif eval(j)<100 :
            continue
        elif eval(j)>2000 :
            true_list.append(str(eval(j)/10))
        else:
            true_list.append(j)
    text_list[i]=true_list

temp1=[]
temp2=[]
for temp in text_list:
    temp1.append(temp[1])
    temp2.append(temp[2])

df=pd.DataFrame({'NO':range(1,563),
                 'Time':range(110,672),
                 '1# Temperature':temp1,
                 '2# Temperature':temp2})
df.to_excel('Attachment 2.xlsx',index=False)
