
train_data=data(1:60,:);
%train_data N��ѵ������,5ά��2����+3�����

%BP�����糢��Ԥ�����
%% WC��
%��һ��
P1=train_data(:,1:2)';
T1=train_data(:,3)';
[p1,minp1,maxp1,t1,mint1,maxt1]=premnmx(P1,T1);

%��������
net1=newff(minmax(P1),[2,6,1],{'tansig','tansig','purelin'},'trainlm');
net1.trainParam.epochs = 10000;
net1.trainParam.goal=0.00001;

%��ʼѵ��
[net1,tr1]=train(net1,p1,t1);

%% PR��
%��һ��
% P1=train_data(:,1:2)';
% T2=train_data(:,4)';
% [p1,minp1,maxp1,t2,mint2,maxt2]=premnmx(P1,T2);
% 
% %��������
% net2=newff(minmax(P1),[2,6,1],{'tansig','tansig','purelin'},'trainlm');
% net2.trainParam.epochs = 10000;
% net2.trainParam.goal=0.000001;
% 
% %��ʼѵ��
% [net2,tr2]=train(net2,p1,t2);
%% EGT��
% P2=train_data(:,3:4)';
% T2=train_data(:,5)';
% [p2,minp2,maxp2,t2,mint2,maxt2]=premnmx(P2,T2);
% 
% %��������
% net2=newff(minmax(P2),[2,6,1],{'tansig','tansig','purelin'},'trainlm');
% net2.trainParam.epochs = 5000;
% net2.trainParam.goal=0.0001;
% 
% %��ʼѵ��
% [net2,tr2]=train(net2,p2,t2);

