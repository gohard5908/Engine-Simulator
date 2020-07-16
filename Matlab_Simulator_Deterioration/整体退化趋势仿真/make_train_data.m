%指定cycle情况下，训练特定模型，
%指定cycle FAN LPC 不变， HPC HPT变化[y1,y2]
%% 先产生全部退化趋势基础 
x=1:1:200;  %代表cycles
%FAN 线性模型（部件）
    FAN_flow_loss=(0.0164*x+0.3608)*-0.01*1;
    FAN_effi_loss=(0.0125*x+0.273)*-0.01*1;
%LPC 多项式模型
    LPC_flow_loss=(5e-5*x.^2+0.0054*x+0.9165)*-0.01*0.8;
    LPC_effi_loss=(2e-5*x.^2+0.0052*x+0.6276)*-0.01*0.8;
%HPC 指数模型
    %flow_loss
    a1=0.09+normrnd(0,0.01);
    b1=0.75+normrnd(0,0.01);
    delta_test1=1-exp(a1*x.^b1);
    delta_flow=-0.01*rand(1,1)+delta_test1*0.12/100;

    a2=0.09+normrnd(0,0.01);
    b2=0.75+normrnd(0,0.01);
    delta_test2=1-exp(a2*x.^b2);
    delta_effi=-0.01*rand(1,1)+delta_test2*0.08/100;
    HPC_flow_loss=-0.9013*exp(0.014*x)*0.01*0.8;
    HPC_effi_loss=-0.9299*exp(0.011*x)*0.01*0.8;
    %HPC_flow_loss=delta_flow;
    %HPC_effi_loss=delta_effi;
%HPT 线性模型（2000cycles外推至6000）
    HPT_flow_increase=(-5e-5*x.^2+0.0208*x+0.1492)*0.01*0.7;
    HPT_effi_loss=(-6e-5*x.^2+0.0254*x+0.6153)*-0.01*0.7;
    %HPT_effi_loss=(5e-7*x.^3-0.0002*x.^2+0.034*x+0.5081)*-0.01*0.71;
%%
fan=[1.5 1.5*ones(1,66) 1.5:-0.2/33:1.3 1.3:-0.1/19:1.2 1.2:-0.2/78:1];
FAN_flow_loss=FAN_flow_loss.*fan;
FAN_effi_loss=FAN_effi_loss.*fan;

%% 选定某一cycle  
  single_cycle=120;
  
  egt_his=-0.0012*single_cycle^2+0.4572*single_cycle + 38.383;
  tsfc_his=-9e-05*single_cycle^2 + 0.0391*single_cycle + 1.621;
  
  
  train_index=1;
  
  train_data=zeros(100,4);
  % y1,y2均变化
  for y1=0.8:0.05:1.2  %先测试2组
        for y2=0.8:0.05:1.1
               
           MWS = JT9D_setup_everything_Dyn(); %入口参数配置
           %退化量配置
           MWS.FAN.s_HP =[FAN_flow_loss(single_cycle);0;FAN_effi_loss(single_cycle)];
           MWS.LPC.s_HP =[LPC_flow_loss(single_cycle);0;LPC_effi_loss(single_cycle)];
           MWS.HPC.s_HP =[HPC_flow_loss(single_cycle);0;HPC_effi_loss(single_cycle)]*y1;
           MWS.HPT.s_HP =[HPT_flow_increase(single_cycle);HPT_effi_loss(single_cycle)]*y2; 


           open_system('O_CloseLoop_Dynmodel.slx');
           y=sim('O_CloseLoop_Dynmodel');


           %这里收集各类传感器数据并存放
           TSFC_out=(TSFC(length(TSFC))-0.3582)/0.3582*100;
           EGT_out=T48(length(T48))-2134;
           train_data(train_index,:)=[y1,y2,TSFC_out,EGT_out];
           
           train_index=train_index+1;%数据存放索引自加1
           
        end
 end
train_data(end,:)=[0 0 tsfc_his egt_his];
