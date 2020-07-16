load('BP_net_data_02.mat');

data_for_test_8_2=[FAN_flow_loss(1:d_i:200); FAN_effi_loss(1:d_i:200);
                    LPC_flow_loss(1:d_i:200) ;LPC_effi_loss(1:d_i:200); 
                    HPC_flow_loss(1:d_i:200) ;HPC_effi_loss(1:d_i:200); 
                    HPT_flow_increase(1:d_i:200) ;HPT_effi_loss(1:d_i:200);
                    ]';
                
data_for_test_8_2(:,1:8)=data_for_test_8_2(:,1:8)*-100;
data_for_test_8_2(:,7)=data_for_test_8_2(:,7)*-1;


data_for_test_8_2=data_for_test_8_2';

y=null(4,length(TSFC_out));

for i=1:length(data_for_test_8_2(1,:))
    
    a=data_for_test_8_2(:,i);
    a=tramnmx(a,minp,maxp);

    y_=sim(net1,a);
    y(1,i)=postmnmx(y_,mint1,maxt1);
    
    y_2=sim(net2,a);
    y(3,i)=postmnmx(y_2,mint2,maxt2);
    
end

y(2,:)=TSFC_out;
y(4,:)=EGT_out;