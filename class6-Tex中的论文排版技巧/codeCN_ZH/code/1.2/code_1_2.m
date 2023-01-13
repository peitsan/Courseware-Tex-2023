%% 第二问求解
%% 三发射机代码
%已知FY_00和FY_01发射机之间的夹角为a1
%三架发射机其中一架未知编号求解代码
%因算法特性会有多种loss值较小的情况无法精准定位，故三架发射机不可行
% clc;clear
% load location.mat
% disp('假设不知道编码的飞机为FY_X')
% angle=input('请依次输入接收机得到的信息<FY_00,FY_01> <FY_00,FY_X> <FY_01_X>（例如[20 20 40]）');
% loss_list=[];%存储每个循环总损失
% 
% for i=2:9
%     fly_item=[1 i];
%     out=main_fun(angle,fly_item);
%     loss=loss_fun1(location,out,fly_item);
%     loss_list=cat(1,loss_list,loss);
% end
%     item=find(min(loss_list(:,1))==loss_list(:,1));%最小损失
%     disp(['未知无人机的标号为' num2str(loss_list(item,2))])
%     disp(['其损失loss=' num2str(loss_list(item,1))])

%% 四发射机代码
clc;clear
load location.mat
disp('假设不知道编码的飞机为FY_X1,FY_X2')
angle1=input('请依次输入接收机得到的关于FY_X1的信息<FY_00,FY_01> <FY_00,FY_X1> <FY_01，FY_X1>（例如[20 20 40]）');
angle2=input('请依次输入接收机得到的关于FY_X2的信息<FY_00,FY_01> <FY_00,FY_X2> <FY_01,FY_X2>（例如[20 20 40]）');
loss_list=[];%存储每个循环总损失

for i=2:9
    for j=i+1:9
        if i~=j
            fly_item=[1 i j];
            out1=main_fun(angle1,fly_item(1:2));
            out2=main_fun(angle2,fly_item(1:2:3));
            loss=loss_fun2(location,out1,out2,fly_item);
            loss_list=cat(1,loss_list,loss);
        end
    end
end
    item=find(min(loss_list(:,1))==loss_list(:,1));%最小损失
    disp(['未知无人机的标号分别为' '  FY_0' num2str(loss_list(item,2)) ', FY_0' num2str(loss_list(item,3))])
    disp(['其损失loss=' num2str(loss_list(item,1))])
    %至此已知全部发射机的编号，此后可用第一问模型进行求解定位
    