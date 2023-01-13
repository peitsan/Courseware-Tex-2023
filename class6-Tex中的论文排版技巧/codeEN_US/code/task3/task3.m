%% task3
clc;clear;
load traindata.mat;
%trainThe first column is temperature 1, the second column is temperature 2, 
%the third column is time and the fourth column is process.
x_predict=traindata; %No prediction is required, only fitting is required, so the prediction set is the training set.
[m,n]=size(x_predict);
input_feature=[1,3,4];
x=traindata(:,input_feature(1:2));%Training set
y=traindata(:,input_feature(end));%Training set output
temp=randperm(size(x,1));%Random scrambling of known sample data
num=round(size(x,1)*0.8);
train_x=x(temp(1:num),:);%Take m*0.8 training samples
train_y=y(temp(1:num),:);%Output of training samples
test_x=x(temp(num+1:end),:);%Test sample
test_y=y(temp(num+1:end),:);%Test sample output

% normalized dimensionless
[train_x0,P1]=mapminmax(train_x',0,1);
train_x0=train_x0';
[train_y0,P2]=mapminmax(train_y',0,1);
train_y0=train_y0';
test_x0=mapminmax('apply',test_x',P1)';
test_y0=mapminmax('apply',test_y',P2)';
    % model training
    yi=train_y0;
    gprMdl = fitrgp(train_x0,yi,'Basis','pureQuadratic',...
      'FitMethod','exact','PredictMethod','exact');
    % test set inspection
    test_predict=predict(gprMdl,test_x0); 
    r0 =wc(test_predict,test_y0,n);%R_adjusted
    disp('After the training of the model is completed, the revised goodness of fit of the test set is:')
    disp([ 'R_adjusted='  num2str(r0)])

    % output forecast value
    out=predict(gprMdl,mapminmax('apply',x_predict(input_feature(1:2))',P1)');
    out1=mapminmax('reverse',out',P2)';
    y_predict=out1;






%% draw designs
x=x_predict(:,1);
y=x_predict(:,3);
[x,y]=meshgrid(x,y);
num=size(x,1);
z=zeros(size(x,1));
data=zeros(num*num,2);
for i=1:num
    for j=1:num
        data((i-1)*num+j,:)=[x(i,j),y(i,j)];
    end
end

new_data=predict(gprMdl,mapminmax('apply',data',P1)');
new_data=mapminmax('reverse',new_data',P2)';
for i=1:num
    for j=1:num
        z(i,j)=new_data((i-1)*num+j);
    end
end
mesh(x,y,z)
xlabel('Temperature')
ylabel('Time')
zlabel('Process')

%% computer simulation
temp_thaw=traindata(1:31,1);%It took 31 seconds for the sample to melt until it completely melted.
temp_crystal=traindata(40:end,1);%Crystallization from the 150th to the last.
time_thaw=traindata(1:31,3);
time_crystal=traindata(40:end,1);
data_thaw1=[temp_thaw,time_thaw];
data_thaw2=[temp_thaw,time_thaw+0.001];% The average speed for a very short time is equal to the current instantaneous speed.
data_crystal1=[temp_crystal,time_crystal];
data_crystal2=[temp_crystal,time_crystal+0.001];
predict_thaw_1=predict(gprMdl,mapminmax('apply',data_thaw1',P1)');
predict_thaw_2=predict(gprMdl,mapminmax('apply',data_thaw2',P1)');
predict_thaw_1=mapminmax('reverse',predict_thaw_1',P2)';
predict_thaw_2=mapminmax('reverse',predict_thaw_2',P2)';
thaw=[temp_thaw,(predict_thaw_2-predict_thaw_1)./0.001];%Temperature-melting rate characteristic data
predict_crystal_1=predict(gprMdl,mapminmax('apply',data_crystal1',P1)');
predict_crystal_2=predict(gprMdl,mapminmax('apply',data_crystal2',P1)');
predict_crystal_1=mapminmax('reverse',predict_crystal_1',P2)';
predict_crystal_2=mapminmax('reverse',predict_crystal_2',P2)';
crystal=[temp_crystal,(predict_crystal_2-predict_crystal_1)./0.001];%Temperature-crystallization rate characteristic data

figure()
plot(thaw(:,1),thaw(:,2),'bo')
figure()
plot(crystal(:,1),crystal(:,2),'bo')
%fit
Meltingdegree_rate=thaw(:,2);
Temperature=thaw(:,1);

Crystallizationdegree_rate=crystal(:,2);
Temperature=crystal(:,1);


