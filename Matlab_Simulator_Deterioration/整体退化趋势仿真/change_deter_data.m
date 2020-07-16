x=1:1:200;   
FAN_flow_loss=(0.0164*x+0.3608)*-0.01*1;
FAN_effi_loss=(0.0125*x+0.273)*-0.01*1;

HPC_flow_loss=-0.9013*exp(0.014*x)*0.01*0.8;
HPC_effi_loss=-0.9299*exp(0.011*x)*0.01*0.8;

%HPT_flow_increase=(-5e-5*x.^2+0.0208*x+0.1492)*0.01*0.7;
%HPT_effi_loss=(-6e-5*x.^2+0.0254*x+0.6153)*-0.01*0.7;
%%
%HPT_flow_increase = (5e-7*x.^3 -0.0002*x.^2+0.0255*x+0.1519)*0.01;
HPT_flow_increase = ( 4e-7*x.^3- 0.000146*x.^2 + 0.020806*x  + 0.2607)*0.01;
%HPT_effi_loss=(7e-7*x.^3 -0.0002*x.^2 + 0.0296*x + 0.6725)*-0.01;

HPT_effi_loss=( -5.234575E-09*x.^4 + 2.576472E-06*x.^3 - 4.665229E-04*x.^2 + 3.812822E-02*x + 0.60442)*-0.01;

%%
fan=[1.5 1.5*ones(1,66) 1.5:-0.1/33:1.4 1.4*ones(1,99)];
%hpt=[1.7 1.7*ones(1,33) 1.7:-0.4/32:1.3 1.3:-0.3/33:1 1:-0.2/19:0.8 0.8*ones(1,79)];

%hpc=[1.3*ones(1,66) 1.3:-0.3/33:1 1:-0.2/19:0.8 0.8*ones(1,80)];

FAN_flow_loss=FAN_flow_loss.*fan;
FAN_effi_loss=FAN_effi_loss.*fan;

hpc=[1.2*ones(1,33) 1.2:-0.1/33:1.1 1.1:-0.1/33:1 1:-0.2/49:0.8 0.8*ones(1,49)];
HPC_flow_loss=HPC_flow_loss.*hpc;
HPC_effi_loss=HPC_effi_loss.*hpc;

%hpt=[1.5 1.5*ones(1,33) 1.5:-0.3/32:1.2 1.2:-0.2/33:1 1:-0.2/98:0.8];
hpt=[1*ones(1,100) 1:-0.1/99:0.9];

HPT_flow_increase=HPT_flow_increase.*hpt;
HPT_effi_loss=HPT_effi_loss.*hpt;