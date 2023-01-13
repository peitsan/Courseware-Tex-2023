%% Principal component analysis PCA
clc;clear
load x.mat;
[m,n]=size(x);%M samples, n indicators
% Z-score Standardized treatment
X=zscore(x);
% Calculate the covariance matrix of the standardized matrix.
R=cov(X);
disp('Correlation coefficient matrix:')
disp(R)
% Calculate the eigenvector and eigenvalue of covariance matrix
[V,D]=eig(R);%V corresponds to the eigenvector, and D is the corresponding eigenvalue of diagonal matrix.
V=rot90(V)';
% Calculate the contribution rate of principal component and cumulative contribution rate.
cv=diag(D);%Get the diagonal element of D, that is, the eigenvalue.
cv=cv(end:-1:1);
p=cv/n;%Contribution rate of each index
sum_p=cumsum(p);%Get cumulative contribution rate
disp('Contribution rate:')
disp(p')
disp('Cumulative contribution rate')
disp(sum_p')
num=input('The number of principal components according to the cumulative contribution rate (reference value > 0.8)');
disp('The load of the obtained principal component is')
disp(V(:,1:num))
PCA_data=x*V(:,1:num);

figure()
hold on 
plot((1:562)+109,PCA_data(:,1),'b-','linewidth',1.5)
plot([110,141,150,671],PCA_data([110,141,150,671]-109,1),'ro','linewidth',1.5)
xlabel('Time')
ylabel('The first principal component')

process=zeros(671,2);
process(:,1)=1:671;
process_data=(PCA_data(:,1)-min(PCA_data(:,1)))/(max(PCA_data(:,1))-min(PCA_data(:,1)));
PCAsum=sum(process_data(:,1));
PCA_cumsum=cumsum(process_data(:,1));
process(110:end,2)=PCA_cumsum./PCAsum;
process(1:110,2)=linspace(0,process(110,2),110);
figure()
hold on 
plot(process(:,1),process(:,2),'b-','linewidth',1.5)
%plot(process(110:end,1),process(110:end,2)+randn(562,1)*0.02,'k--','linewidth',1)
plot([110,141,150,671],process([110,141,150,671],2),'ro','linewidth',1.5)
xlabel('Time')
ylabel('process')
title('Melting crystallization process curve')
