load data.mat
%Original data drawing
figure
plot(data(:,1),data(:,2),'b-','linewidth',1.5)
hold on 
grid on 
plot(data(:,1),data(:,3),'r-','linewidth',1.5)
legend('1# Temperature','2# Temperature')
xlabel('Time(s)')
ylabel(' Temperature(℃)')

%average drawing
figure
plot(data(:,1),(data(:,2)+data(:,3))/2,'b-','linewidth',1.5)
hold on 
grid on 
legend('AVERAGE# Temperature')
xlabel('Time(s)')
ylabel(' Temperature(℃)')

%Moving average drawing
new_data=data;
new_data(:,2)=new_data(:,2)+new_data(:,3)/2;
new_data(:,2)=cumsum(new_data(:,2))./(1:size(new_data,1))';
figure
plot(new_data(:,1),new_data(:,2),'b-','linewidth',1.5)
hold on 
grid on 
legend('Moving average# Temperature')
xlabel('Time')
ylabel(' Temperature')