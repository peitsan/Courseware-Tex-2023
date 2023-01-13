%计算损失函数
function out=loss_fun1(location,output,fly_item)
    [m,n]=size(location);
    loss=zeros(7,2);%除了两个发射机和中间的FY_0,无人机可以会在7个位置游走,存储对应的损失值和编号
    j=1;
    for i=1:m
        if sum(i==fly_item) ==0
            x1=[location(i,1)*sind(location(i,2)) location(i,1)*cosd(location(i,2))];
            x2=[output(1)*sind(output(2)) output(1)*cosd(output(2))];
            loss(j,1)=dist(x1,x2');
            loss(j,2)=fly_item(2);
            j=j+1;
        end
    end
    item=find(min(loss(:,1))==loss(:,1));%最小损失
    out=loss(item,:);
end
            