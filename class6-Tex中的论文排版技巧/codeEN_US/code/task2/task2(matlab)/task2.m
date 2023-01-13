%% task2 
clear;clc
%plot-GLCM_feature-imgs
load GLCM_data.mat
glcm_data=table2array(GLCM_data);
[m,n]=size(glcm_data);
GLCM_name=GLCM_data.Properties.VariableNames;
for i =1:n
    
    subplot(3,3,i);
    glcm_data(:,i)=cumsum(glcm_data(:,i))./(1:size(glcm_data,1))';%needsave
    %Moving average smoothing
    plot((1:size(glcm_data,1))+109,glcm_data(:,i),'b-')
    hold on
    plot([110,141,150,671],glcm_data([110,141,150,671]-109,i),'r.')
    title(GLCM_name{i})
    hold off

end
load Color_data.mat
color_data=table2array(Color_data);
[m,n]=size(color_data);
Color_name=Color_data.Properties.VariableNames;
for i =1:n
    
    subplot(3,3,i);
    color_data(:,i)=cumsum(color_data(:,i))./(1:size(color_data,1))';%needsave
    %Moving average smoothing
    plot((1:size(color_data,1))+109,color_data(:,i),'b-')
    hold on
    plot([110,141,150,671],color_data([110,141,150,671]-109,i),'r.')
    title(Color_name{i})
    hold off
end


load LBP_data.mat
lbp_data=table2array(LBP_data);
[m,n]=size(lbp_data);
LBP_name=LBP_data.Properties.VariableNames;
for i =1:n
    
    subplot(2,2,i);
    lbp_data(:,i)=cumsum(lbp_data(:,i))./(1:size(lbp_data,1))';%needsave
    %Moving average smoothing
    plot((1:size(lbp_data,1))+109,lbp_data(:,i),'b-')
    hold on
    plot([110,141,150,671],lbp_data([110,141,150,671]-109,i),'r.')
    title(LBP_name{i})
    hold off
end



load DB_data.mat
db_data=table2array(DB_data);
[m,n]=size(db_data);
DB_name=DB_data.Properties.VariableNames;
for i =1:n
    
    subplot(2,2,i);
    db_data(:,i)=cumsum(db_data(:,i))./(1:size(db_data,1))';%needsave
    %Moving average smoothing
    plot((1:size(db_data,1))+109,db_data(:,i),'b-')
    hold on
    plot([110,141,150,671],db_data([110,141,150,671]-109,i),'r.')
    title(DB_name{i})
    hold off
end


clc;clear
%Frequency domain characteristics
Frequency_data=zeros(562,1);
t=0;
location1=(558:758);
location2=(696:1096);
for i=1:562
    Img=double(rgb2gray(imread(['D:\Attachment 1\0' num2str(109+i) '.bmp'])));
    g = fft2(Img); % 2D Fast Fourier Transform  
    g = fftshift(g); % 中心化处理
    return_img = log(1+abs(g));
    return_img = uint8(mat2gray(return_img(location1,location2)) * 255);
    Frequency_data(i)=mean(mean(return_img));
    if find(i+109==[110:114 141:145 149 150:153 667:671])
        t=t+1;
        subplot(5,5,t)
        imshow(uint8(return_img));
        title(['第' num2str(i+109) '秒'])
    end
end
figure()
Frequency_data=cumsum(Frequency_data)./(1:562)';
plot((1:562)+109,Frequency_data,'b-')
hold on
plot([110,141,150,671],Frequency_data([110,141,150,671]-109,1),'r.')
title('Frequency-feature')