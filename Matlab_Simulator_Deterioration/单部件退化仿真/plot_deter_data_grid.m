% Wc_loss=-(0:0.01:0.07);
% Effi_loss=-(0:0.01:0.05);
Wc_loss=-0.06:0.01:0.06;
Effi_loss=-(0:0.01:0.05);

Deter_data4HPC=Deter_data4HPT;
Deter_data4HPC_pct=Deter_data4HPC;

health_idx=find(Wc_loss==0);
health_idx=(health_idx-1)*length(Effi_loss)+1;
  for i=3:9
     
      Deter_data4HPC_pct(:,i)=(Deter_data4HPC_pct(:,i)-Deter_data4HPC(health_idx,i))/Deter_data4HPC(health_idx,i);
      
  end
 
 figure; hold on;
 sensor_idx=7; %这里选择要绘制的传感器
  for i=1:6
     
    index=find(Deter_data4HPC_pct(:,2)==Effi_loss(i));
    plot(-Deter_data4HPC_pct(index,1),Deter_data4HPC_pct(index,sensor_idx));
      
  end