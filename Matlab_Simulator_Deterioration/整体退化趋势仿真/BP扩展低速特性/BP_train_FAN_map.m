
train_data=data(1:60,:);
%train_data N个训练数据,5维（2输入+3输出）

%BP神经网络尝试预测输出
%% WC的
%归一化
P1=train_data(:,1:2)';
T1=train_data(:,3)';
[p1,minp1,maxp1,t1,mint1,maxt1]=premnmx(P1,T1);

%建立网络
net1=newff(minmax(P1),[2,6,1],{'tansig','tansig','purelin'},'trainlm');
net1.trainParam.epochs = 10000;
net1.trainParam.goal=0.00001;

%开始训练
[net1,tr1]=train(net1,p1,t1);

%% PR的
%归一化
% P1=train_data(:,1:2)';
% T2=train_data(:,4)';
% [p1,minp1,maxp1,t2,mint2,maxt2]=premnmx(P1,T2);
% 
% %建立网络
% net2=newff(minmax(P1),[2,6,1],{'tansig','tansig','purelin'},'trainlm');
% net2.trainParam.epochs = 10000;
% net2.trainParam.goal=0.000001;
% 
% %开始训练
% [net2,tr2]=train(net2,p1,t2);
%% EGT的
% P2=train_data(:,3:4)';
% T2=train_data(:,5)';
% [p2,minp2,maxp2,t2,mint2,maxt2]=premnmx(P2,T2);
% 
% %建立网络
% net2=newff(minmax(P2),[2,6,1],{'tansig','tansig','purelin'},'trainlm');
% net2.trainParam.epochs = 5000;
% net2.trainParam.goal=0.0001;
% 
% %开始训练
% [net2,tr2]=train(net2,p2,t2);

