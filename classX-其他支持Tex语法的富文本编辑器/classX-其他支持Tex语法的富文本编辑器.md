# 功能快捷键

Ctrl + N ：新建文件
Ctrl + shift + N ：新建窗口
Ctrl + O ：打开
Ctrl + P ： 快速打开（快速打开之前编辑过的历史文件）
Ctrl + S ：保存
Ctrl + shift + S：另存为
Typora 偏好设置：Ctrl + ;
Ctrl + W ：关闭

- 2.编辑操作

  Ctrl + Z : 撤销
  Ctrl + Y ：重做
  Ctrl + X : 剪切
  Ctrl + C : 复制
  Ctrl + V：粘贴
  Ctrl + shift +C ：复制为MarkDown格式
  Ctrl + shift + V：粘贴为纯文本格式（去除文本原本格式，很好用）
  Ctrl +A：全选
  Ctrl + L：选中当前行
  Ctrl + E：选中当前格式文本
  Ctrl + D：选中当前词
  Ctrl + Home：跳转到开头
  Ctrl + End：跳转到末尾
  Ctrl + J：跳转到所选内容
  Ctrl +shift+D：删除当前词

- 3.查找和替换
  - Ctrl + F：查找
    F3：查找下一个
    shift + F3：查找上一个
    Ctrl + H：替换

- 4.[MarkDown语法](https://so.csdn.net/so/search?q=MarkDown语法&spm=1001.2101.3001.7020)快捷键
  - Ctrl + 数字键1~6：对应一到六级标题
    Ctrl +数字键0：段落
    Ctrl + =：提升标题等级
    Ctrl + -：降低标题等级
    Ctrl + T ：插入表格
    Ctrl +shift+K：插入代码块
    Ctrl +shift+M：插入公式
    Ctrl +shift+I：插入图片
    Ctrl +shift+Q：引用
    Ctrl +shift+[：有序列表
    Ctrl +shift+]：无序列表
    Ctrl + [：列表减少缩进
    Ctrl +]：列表增加缩进

- 5.格式
  - Ctrl +B：加粗
    Ctrl + I：斜体
    Ctrl + U：下划线
    Alt + shift + 5 : 删除线
    Ctrl + K ：超链接
    Ctrl + ：清除样式

- 6.视图
  - Ctrl +shift+L：显示/隐藏侧边栏
    Ctrl +shift+1：大纲
    Ctrl +shift+2：文档列表
    Ctrl +shift+3：文件树
    Ctrl +shift+F：搜索
    Ctrl +/：源代码模式
    F11：全屏
    Ctrl +shift+9：实际大小
    Ctrl +shift+ -：缩小
    Ctrl +shift+ =：放大
    Ctrl + Tab：应用内部切换窗口
    shift+F12：开发者工具
  
# Markdown 语法手册

## Markdown 标题
**Markdown 标题有两种格式**

**1. 使用 = 和 - 标记一级和二级标题**

**注意：****由于分割线也是 “---”， 因此在使用分割线时，一定要空一行，不然会把上方的文字识别为第二级标题**

**（图中 ：左边为语法格式，右边为显示效果）**

![img](https://pics7.baidu.com/feed/5fdf8db1cb1349541b75774165d02351d0094ad7.jpeg@f_auto?token=072fff24deab7616ed4be0c74d463c5c)

2. **使用#号标记** 
    **在行首插入 1 到 6 个 # 再加空格，对应到标题 1 到 6级**
   **（注意：#号后面一定要有一个空格）**
   ![img](https://pics4.baidu.com/feed/c75c10385343fbf2973ec64088e07b8964388fee.jpeg@f_auto?token=23c526d1a6f5dc8c6e668bf1ea3206f0)

## Markdown 段落

![img](https://pics5.baidu.com/feed/d31b0ef41bd5ad6ea1a03ed1bb5588d2b7fd3cd3.jpeg@f_auto?token=37210b2592615a6d063a3d88137af598)


## 字体 

**Markdown 可以使用以下几种字体：**

![img](https://pics7.baidu.com/feed/5243fbf2b21193133a723d7056a6bdde90238d61.jpeg@f_auto?token=70de7a10db579fe52a592eef2c60f757)

## 分隔线

**你可以在一行中用三个以上的星号、减号、底线来建立一个分隔线，行内不能有其他东西。你也可以在星号或是减号中间插入空格。下面每种写法都可以建立分隔线：**

![img](https://pics6.baidu.com/feed/00e93901213fb80ed3b7b8120f4f9e27b838943d.jpeg@f_auto?token=02a29d87055bfda44d0d1f2e73efcd10)

## 删除线

**如果段落上的文字要添加删除线，只需要在文字的两端加上两个波浪线 ~~ 即可，实例如下：**

## 下划线

**下划线可以通过 HTML 的 <u> 标签来实现：**

## 脚注

**脚注是对文本的补充说明。**

**Markdown 脚注的格式如下:**


![img](https://pics0.baidu.com/feed/a50f4bfbfbedab64d0324586c4a81eca78311e5f.jpeg@f_auto?token=e624a166db148cf2f983a336c685e4e3)

## Markdown 列表

**Markdown 支持有序列表和无序列表。**

**无序列表使用星号(\*)、加号(+)或是减号(-)作为列表标记，这些标记后面要添加一个空格，然后再填写内容：**

![img](https://pics6.baidu.com/feed/2cf5e0fe9925bc3165e7427b64413cb8c91370c6.jpeg@f_auto?token=1ca4fd642a8cb8d0053490e9473ccb78)


**有序列表使用数字并加上 . 号来表示，如：**

![img](https://pics5.baidu.com/feed/d6ca7bcb0a46f21f78acf15bc5bada690d33ae42.jpeg@f_auto?token=6e93d7fe418e51f1681aaf173c0dad8c)


## 列表嵌套

**列表嵌套只需在子列表中的选项前面添加四个空格即可：**


![img](https://pics2.baidu.com/feed/c995d143ad4bd113badebb77603115064afb058f.jpeg@f_auto?token=0558c88b3960f80adaa3001544dfce7f)

## Markdown 区块


**Markdown 区块引用是在段落开头使用 > 符号 ，然后后面紧跟一个空格符号：**

**另外区块是可以嵌套的，一个 > 符号是最外层，两个 > 符号是第一层嵌套，以此类推：**

![img](https://pics3.baidu.com/feed/ca1349540923dd549a5b6022e29702d79d8248fc.jpeg@f_auto?token=de98f2c26b4a535e80134eecd151ce72)

### 区块中使用列表

### 列表中使用区块

**如果要在列表项目内放进区块，那么就需要在 > 前添加四个空格的缩进**

![img](https://pics7.baidu.com/feed/1c950a7b02087bf426d971d7c14de62511dfcf7a.jpeg@f_auto?token=461825183d6ae72f9f0286d798cd5081)

快捷键 > +Tab

> ​	
>
> 

## Markdown 代码

**1. 如果是段落上的一个函数或片段的代码可以用反引号把它包起来（`）**

**2. 代码区块使用 4 个空格或者一个制表符（Tab 键）**

**3. 也可以用 ``` 包裹一段代码，并指定一种语言(也可以不指定)**

![img](https://pics5.baidu.com/feed/242dd42a2834349bd146c524fa74a4c737d3be73.jpeg@f_auto?token=9a30b090c7fc16582a3439eb3ffb6a9f)

```matlab
kk=2;[mdd,ndd]=size(dd);
while ~isempty(V)
[tmpd,j]=min(W(i,V));tmpj=V(j);
for k=2:ndd
[tmp1,jj]=min(dd(1,k)+W(dd(2,k),V));
tmp2=V(jj);tt(k-1,:)=[tmp1,tmp2,jj];
end
tmp=[tmpd,tmpj,j;tt];[tmp3,tmp4]=min(tmp(:,1));
if tmp3==tmpd, ss(1:2,kk)=[i;tmp(tmp4,2)];
else,tmp5=find(ss(:,tmp4)~=0);tmp6=length(tmp5);
if dd(2,tmp4)==ss(tmp6,tmp4)
ss(1:tmp6+1,kk)=[ss(tmp5,tmp4);tmp(tmp4,2)];
else, ss(1:3,kk)=[i;dd(2,tmp4);tmp(tmp4,2)];
end;end
dd=[dd,[tmp3;tmp(tmp4,2)]];V(tmp(tmp4,3))=[];
[mdd,ndd]=size(dd);kk=kk+1;
end; S=ss; D=dd(1,:);
```

快捷键 ctrl+shift+K

## Markdown 链接

### 普通链接

**链接使用方法如下：**

```
[链接名](网站地址/文件地址)
```

[百度一下,你就知道！](http://www.baidu.com)

### 高级链接

**通过变量来设置一个链接，变量赋值在文档末尾进行：**

![img](https://pics4.baidu.com/feed/a8ec8a13632762d072aa52859372b9f3503dc698.jpeg@f_auto?token=d6c43684422872eca72bc6a7f9a884b3)

## Markdown 图片

**Markdown 图片语法格式如下：**

```
![图片名称](图片路径)
```

**1. 开头一个感叹号 !**

**2. 接着一个方括号，里面放上图片的替代文字**

**3. 接着一个普通括号，里面放上图片的网址，最后还可以用引号包住并加上选择性的 'title' 属性的文字。**

**利用markdown在编写文档时插入图片是默认靠左，有些时候**

**将图片设置为居中时可以更加的美观，这时就需要在图片的信息****前边添加如下语句：**

```
  <div align=center>![Alt pic] (http:...)
  
  如果想将图片位于右侧，只需要将center改为right
```

**设置图片大小**
 ```
  <img src="http:..." width = "100" height = "100" div align=right />
 ```

**如上格式，在图片的最后添加 width = “100” height = “100”，就可以设置图片的大小。也可以在后边输入百分比为多少，如 width = 20% height = 20%**

![img](https://pics5.baidu.com/feed/023b5bb5c9ea15ceaa1406dc8e9e8bfa3887b291.jpeg@f_auto?token=fb36dc59a25964bcaf4f4866545f5504)

- ***\*也可以像网址那样对图片网址使用变量:\****

![img](https://pics5.baidu.com/feed/4d086e061d950a7b169859ab304fd3d0f3d3c953.jpeg@f_auto?token=83b58ef4a2c8ff12d65c73cc5bb0fabf)

## Markdown 表格

**Markdown 制作表格使用 | 来分隔不同的单元格，使用 - 来分隔表头和其他行。**

### **对齐方式**

**我们可以设置表格的对齐方式：**

**1. -: 设置内容和标题栏居右对齐**

**2. :- 设置内容和标题栏居左对齐**

**3. :-: 设置内容和标题栏居中对齐**

![img](https://pics0.baidu.com/feed/241f95cad1c8a7864ddc2e5d5397783471cf5012.jpeg@f_auto?token=452dffaa9b76dd49a9b6b11e6502bac4)

```markdown
|表头|表头|
|---|---|
|11|12|
|21|22|

|左对齐|右对齐|居中|
|:---|---:|:---:|
|11|12|13|
|21|22|23|
```

| 表头 | 表头 |
| ---- | ---- |
| 11   | 12   |
| 21   | 22   |

| 左对齐 | 右对齐 | 居中 |
| :----- | -----: | :--: |
| 11     |     12 |  13  |
| 21     |     22 |  23  |



## Markdown 高级技巧

### 支持的 HTML 元素

**不在 Markdown 涵盖范围之内的标签，都可以直接在文档里面用 HTML 撰写。**

**目前支持的 HTML 元素有：****`<kbd> <b> <i> <em> <sup> <sub> <br>`等**

### 转义

 **Markdown 使用了很多特殊符号来表示特定的意义，如果需要显示特定的符号则需要使用转义字符，Markdown 使用反斜杠转义特殊字符：**
 Markdown 支持以下这些符号前面加上反斜杠来帮助插入普通的符号：

```
\   反斜线`   反引号
*   星号
_   下划线
{}  花括号
[]  方括号
()  小括号
#   井字号
+   加号
-   减号
.   英文句点
!   感叹号*   星号
_   下划线
{}  花括号
[]  方括号
()  小括号
#   井字号
+   加号
-   减号
.   英文句点
!   感叹号
```
### 公式符号

** 当你需要在编辑器中插入数学公式时，可以使用两个美元符 $$ 包裹 TeX 或 LaTeX 格式的数学公式来实现。提交后，问答和文章页会根据需要加载 Mathjax 对数学公式进行渲染 **

![img](https://pics7.baidu.com/feed/b2de9c82d158ccbfdcd995b72a460d37b0354179.jpeg@f_auto?token=50b7201c7bf946fc3a52ad1e308d05cb)

- 1. 更改字体、大小、颜色 
- 2. 为文字添加背景色
- 3. 设置文字居中
- 4. 加入上下标
![img](https://pics3.baidu.com/feed/cdbf6c81800a19d8439b73ef09643382a41e46ec.jpeg@f_auto?token=d5a58e193fd6bccc26b57e4c9678ec02)

# 支持Markdown语法的网站

- [知乎](https://www.zhihu.com/)
- [简书](https://www.jianshu.com/p/ce803975824c)
- [CSDN](https://blog.csdn.ne)
- [B站博客](https://www.bilibili.com/)

- [github](https://github.com/)

- [掘金](https://juejin.cn/)
- [语雀](https://www.yuque.com/)

# 支持Tex语法的网站

- [在线编辑tex公式](https://www.latexlive.com/)
- [texpage](https://www.texpage.com/)
- [Overleaf](https://cn.overleaf.com/)