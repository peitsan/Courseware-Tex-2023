%% 第一问
%第一小问
%定位模型
clc;clear
load location.mat 
%location 记录了极坐标系下各个飞机按顺序的位置

disp('本模型规定除了FY_00之外的两架发射机编号为FY_i,FY_j（其中j的编号大于i），接收机的编号为FY_k')
disp('坐标系为极坐标系，正方向规定为逆方向')
disp('规定FY_00与FY_i发射线的夹角为a1，FY_00与FY_j发射线的夹角为a2,FY_i与FY_j发射线的夹角为a3')
angle=input('请依次按行输入a1，a2，a3。（以角度值输入例如:[12 30 40]）');
fly_item=input('请依次按行输入FY_i和FY_j的编号(例如：[1 3])');
output=main_fun(angle,fly_item);

%模拟与验证模型精度
epoch=10000;%需要验证的样本量
recall_mat=zeros(epoch,6);
for i=1:epoch
    r=randperm(9);
    [a1,a2,a3]=arg(r(1:3));%r(3)为发射机的编号)
    recall_mat(i,1)=r(3);%接收机编号
    recall_mat(i,2:4)=[a1 a2 a3];%接收机接受的信息
    recall_mat(i,5)=40*(r(3)-1);%接收机的真实极坐标角
    F_i_item=min(r(1:2));
    F_j_item=max(r(1:2));
    fly_item=[F_i_item,F_j_item];
    out_arg=main_fun(recall_mat(i,2:4),fly_item);
    recall_mat(i,6)=out_arg(2);%模型定位获得的极坐标角
end
count=sum(recall_mat(:,5)-recall_mat(:,6)<=1e-4);
disp(['模型的精度为' num2str(count/epoch*100) '%'])
    