%此函数为根据输入参数进行定位的主要模型函数
%输入angle为n*3的矩阵第一列是FY_00与FY_i发射线的夹角a1，
%第二列是FY_00与FY_j发射线的夹角a2,第三列是FY_i与FY_j发射线的夹角a3
%fly_item是n*2的矩阵第一列为发射机FY_i的编号第二列为发射机FY_j的编号
%n为输入的样本数量
function output=main_fun(angle,fly_item)

need_angle=angle;
d_angle=40*(fly_item(:,2)-fly_item(:,1)); %两架发射机与FY_00连线的夹角
[m,n]=size(need_angle);
r=100;%半径
flag=zeros(m,1);
for i=1:m
    if d_angle(i)>180
        d_angle(i)=360-d_angle(i);
        temp=need_angle(i,2);
        need_angle(i,2)=need_angle(i,1);
        need_angle(i,1)=temp;
        flag(i)=1;%标记两发射机大于180角的样本
    end
end

output=zeros(m,2);
   for i=1:m
    solve_angle=need_angle(i,:);%取出一个样本的角度
    a1=solve_angle(1);
    a2=solve_angle(2);
    a3=solve_angle(3);
    d=d_angle(i);
if a2==a3+a1
        out=fsolve(@(p)model4(p,a1,a2,r,d),[100,100]);
        out=judge(out);
        output(i,1)=out(2);
        output(i,2)=trans(out(1),flag(i),fly_item(i,:));
elseif a1==a3+a2
        out=fsolve(@(p)model3(p,a1,a2,r,d),[-100,100]);        
        out=judge(out);
        output(i,1)=out(2);  
        output(i,2)=trans(out(1),flag(i),fly_item(i,:));
elseif a3<90
        out=fsolve(@(p)model2(p,a1,a2,r,d),[-100,100]);     
        out=judge(out);
        output(i,1)=out(2);
        output(i,2)=trans(out(1),flag(i),fly_item(i,:));
elseif a3>90
        out=fsolve(@(p)model1(p,a1,a2,r,d),[100,100]);      
        out=judge(out);
        output(i,1)=out(2);
        output(i,2)=trans(out(1),flag(i),fly_item(i,:));
end
    end
end
%  disp('模型计算完毕结果输出为output.mat每行对应每个样本输入的极坐标')
