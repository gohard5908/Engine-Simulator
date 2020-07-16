load('train_data.txt');
train_data(:,1:8)=train_data(:,1:8)*-100;
train_data(:,7)=train_data(:,7)*-1;

%train_data N��ѵ������,10ά��8����+2�����

%BP�����糢��Ԥ�����
%% TSFC��
%��һ��
P=train_data(:,1:8)';
T1=train_data(:,9)';
[p1,minp,maxp,t1,mint1,maxt1]=premnmx(P,T1);

%��������
net1=newff(minmax(P),[8,6,1],{'tansig','tansig','purelin'},'trainlm');
net1.trainParam.epochs = 5000;
net1.trainParam.goal=0.0001;

%��ʼѵ��
[net1,tr1]=train(net1,p1,t1);

%% EGT��

T2=train_data(:,10)';
[t2,mint2,maxt2]=premnmx(T2);

%��������
net2=newff(minmax(P),[8,6,1],{'tansig','tansig','purelin'},'trainlm');
net2.trainParam.epochs = 5000;
net2.trainParam.goal=0.0001;

%��ʼѵ��
[net2,tr2]=train(net2,p1,t2);

