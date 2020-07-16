%�ⲿ�ֲ�����ͬcycleʱ�������ݣ��ۺ��˻��£�����ȫ�����������˻�
        d_i=15;
       % load make_HealthPara_data.mat
        load TSFC_history.txt
        load EGT_history.txt
       
        
        cycles_out=1:d_i:200; %cycles����
        numofdata=length(cycles_out);

        TSFC_out=zeros(numofdata,1);
        EGT_out=zeros(numofdata,1);
        
        Fnet_out=zeros(numofdata,1);
        %% �޸��˻����ã�������Щ�˻�������

        component_select=[1,1,1,1];
        %FAN ����ģ��
        if(component_select(1)==0)
            FAN_flow_loss=FAN_flow_loss*0;
            FAN_effi_loss=FAN_effi_loss*0;
        end
        %LPC ����ʽģ��
        if(component_select(2)==0)
            LPC_flow_loss=LPC_flow_loss*0;
            LPC_effi_loss=LPC_effi_loss*0;
        end

        %HPC ָ��ģ��
        if(component_select(3)==0)
            HPC_flow_loss=HPC_flow_loss*0;
            HPC_effi_loss=HPC_effi_loss*0;
        end
        %HPT ����ģ�ͣ�2000cycles������6000��
        if(component_select(4)==0)
            HPT_flow_increase=HPT_flow_increase*0;
            HPT_effi_loss=HPT_effi_loss*0;
        end

        %%
        for i=1:d_i:200   %�Ȳ���2��

           MWS = JT9D_setup_everything_Dyn(); %��ڲ�������
           %�˻�������
           MWS.FAN.s_HP =[FAN_flow_loss(i);0;FAN_effi_loss(i)];
           MWS.LPC.s_HP =[LPC_flow_loss(i);0;LPC_effi_loss(i)];
           MWS.HPC.s_HP =[HPC_flow_loss(i);0;HPC_effi_loss(i)];
           MWS.HPT.s_HP =[HPT_flow_increase(i);HPT_effi_loss(i)]; 


           open_system('O_CloseLoop_Dynmodel.slx');
           y=sim('O_CloseLoop_Dynmodel');


           %�����ռ����ഫ�������ݲ����
           TSFC_out((i-1+d_i)/d_i,1)=TSFC(length(TSFC));
           EGT_out((i-1+d_i)/d_i,1)=T48(length(T48)); 
           Fnet_out((i-1+d_i)/d_i,1)=Fnet(length(Fnet)); 
        end
        
        %��������
        TSFC_out=(TSFC_out-0.3582)/0.3582*100;
        EGT_out=EGT_out-2134;
        figure(1)
        subplot(2,1,1)
        plot(cycles_out,TSFC_out);hold on;
        plot(TSFC_history(:,1),TSFC_history(:,2));
        axis([-inf,inf,0,10]);
        subplot(2,1,2)
        plot(cycles_out,EGT_out);hold on;
        plot(EGT_history(:,1),EGT_history(:,2));
        axis([-inf,inf,-20,120]);
        
       data_for_train_8_2=[FAN_flow_loss(1:d_i:200); FAN_effi_loss(1:d_i:200);
                           LPC_flow_loss(1:d_i:200) ;LPC_effi_loss(1:d_i:200); 
                           HPC_flow_loss(1:d_i:200) ;HPC_effi_loss(1:d_i:200); 
                           HPT_flow_increase(1:d_i:200) ;HPT_effi_loss(1:d_i:200);
                           ]';
       data_for_train_8_2=[data_for_train_8_2 TSFC_out EGT_out];
       data_for_train_8_2(:,7:8)= data_for_train_8_2(:,7:8); 
       
       