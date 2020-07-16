%这部分生成各部件的退化量
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

    
save make_HealthPara_data.mat FAN_flow_loss FAN_effi_loss LPC_flow_loss LPC_effi_loss HPC_flow_loss ...
     HPC_effi_loss HPC_effi_loss HPT_flow_increase HPT_effi_loss
%HPT_flow_increase(1,117:200)=HPT_flow_increase(1,117)*ones(1,200-117+1);
%HPT_effi_loss(1,117:200)=HPT_effi_loss(1,117)*ones(1,200-117+1);



