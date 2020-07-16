load('train_data.txt');
train_data(:,1:8)=train_data(:,1:8)*-100;
train_data(:,7)=train_data(:,7)*-1;

%train_data N个训练数据,10维（8输入+2输出）

%BP神经网络尝试预测输出
%% TSFC的
%归一化
P=train_data(:,1:8)';
T1=train_data(:,9)';
[p1,minp,maxp,t1,mint1,maxt1]=premnmx(P,T1);

%建立网络
net1=newff(minmax(P),[8,6,1],{'tansig','tansig','purelin'},'trainlm');
net1.trainParam.epochs = 5000;
net1.trainParam.goal=0.0001;

%开始训练
[net1,tr1]=train(net1,p1,t1);

%% EGT的

T2=train_data(:,10)';
[t2,mint2,maxt2]=premnmx(T2);

%建立网络
net2=newff(minmax(P),[8,6,1],{'tansig','tansig','purelin'},'trainlm');
net2.trainParam.epochs = 5000;
net2.trainParam.goal=0.0001;

%开始训练
[net2,tr2]=train(net2,p1,t2);

