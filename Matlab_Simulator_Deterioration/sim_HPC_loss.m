%


% Wc_loss=-(0:0.01:0.07);
% Effi_loss=-(0:0.01:0.05);

Wc_loss=-0.06:0.01:0.06;
Effi_loss=-(0:0.01:0.05);

%Deter_data4HPC=zeros(length(Wc_loss)*length(Effi_loss),2+5); %5ΪҪ�����Ĵ�����������Ŀ
Deter_data4HPT=zeros(length(Wc_loss)*length(Effi_loss),2+7); %5ΪҪ�����Ĵ�����������Ŀ

for i=1:length(Wc_loss)
    for j=1:length(Effi_loss)
      
        fprintf('���ڷ���(%i,%i)����............\n',i,j);
        
        MWS = JT9D_setup_everything_Dyn(); %��ڲ�������
           %�˻�������
        %MWS.HPC.s_HP =[Wc_loss(i);0;Effi_loss(j)];
        MWS.HPT.s_HP =[Wc_loss(i);Effi_loss(j)];
        y=sim('O_CloseLoop_Dynmodel',11);
        
        %�ռ��˻����ݣ�ת��Ϊ �� ��׼���ݵİٷֱ�ƫ��;
        % N2 T3 T4 T48(EGT) TSFC 
        N2=NcR(length(NcR));
        P30=P30(length(P30));
        T2=T2(length(T2));
        T3=T30(length(T30));
        T4=T40(length(T40));
        EGT=T48(length(T48));
        TSFC=TSFC(length(TSFC));
        
        %Deter_data4HPC((i-1)*length(Effi_loss)+j,:)=[Wc_loss(i) Effi_loss(j) N2 P30 T2 T3 T4 EGT TSFC];
        Deter_data4HPT((i-1)*length(Effi_loss)+j,:)=[Wc_loss(i) Effi_loss(j) N2 P30 T2 T3 T4 EGT TSFC];
   
    end
end