%%
single_cycle=20;
  
  egt_his=-0.0012*single_cycle^2+0.4572*single_cycle + 38.383;
  tsfc_his=-9e-05*single_cycle^2 + 0.0391*single_cycle + 1.621;
  
  y1=1.5;y2=1.2;y3=1.2;y4=1.5;
  
%% model仿真
              
           MWS = JT9D_setup_everything_Dyn(); %入口参数配置
           %退化量配置
           MWS.FAN.s_HP =[FAN_flow_loss(single_cycle);0;FAN_effi_loss(single_cycle)]*y1;
           MWS.LPC.s_HP =[LPC_flow_loss(single_cycle);0;LPC_effi_loss(single_cycle)]*y2;
           MWS.HPC.s_HP =[HPC_flow_loss(single_cycle);0;HPC_effi_loss(single_cycle)]*y3;
           MWS.HPT.s_HP =[HPT_flow_increase(single_cycle);HPT_effi_loss(single_cycle)]*y4; 


           open_system('O_CloseLoop_Dynmodel.slx');
           y=sim('O_CloseLoop_Dynmodel');


           %这里收集各类传感器数据并存放
           TSFC_out=(TSFC(length(TSFC))-0.3582)/0.3582*100;
           EGT_out=T48(length(T48))-2134;

%% BP仿真
y=null(6);
deter_data=[FAN_flow_loss(single_cycle);FAN_effi_loss(single_cycle);
        LPC_flow_loss(single_cycle); LPC_effi_loss(single_cycle);
        HPC_flow_loss(single_cycle);HPC_effi_loss(single_cycle);
        HPT_flow_increase(single_cycle);HPT_effi_loss(single_cycle)]';
deter_data(:,1:2)=deter_data(:,1:2)*y1;
deter_data(:,3:4)=deter_data(:,3:4)*y2;
deter_data(:,5:6)=deter_data(:,5:6)*y3;
deter_data(:,7:8)=deter_data(:,7:8)*y4;

deter_data(:,1:8)=deter_data(:,1:8)*-100;
deter_data(:,7)=deter_data(:,7)*-1;
deter_data=deter_data';

    a=deter_data;
    a=tramnmx(a,minp,maxp);

    y_=sim(net1,a);
    y(1)=postmnmx(y_,mint1,maxt1);
    
    y_2=sim(net2,a);
    y(4)=postmnmx(y_2,mint2,maxt2);
%%
y(2)=TSFC_out;
y(3)=tsfc_his;
y(5)=EGT_out;
y(6)=egt_his;

