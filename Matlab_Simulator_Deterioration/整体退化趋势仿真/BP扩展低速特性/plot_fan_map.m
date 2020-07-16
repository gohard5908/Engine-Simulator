% figure(1);
% hold on;
% 
% for i=1:1:13
%   
%    plot(FAN.WcArray(i,:),FAN.EffArray(i,:));
%     
% end

%需要计算的低速点
x1=[0.3 0.4];
x2=FAN.RlineVec;

y=null(24,2);

for i=1:2
    for j=1:12
        
      a=[x1(i);x2(j)];
      a=tramnmx(a,minp1,maxp1);
      
      y_=sim(net1,a);
      y((i-1)*12+j,1)=postmnmx(y_,mint1,maxt1); 
      
      y_=sim(net2,a);
      y((i-1)*12+j,2)=postmnmx(y_,mint2,maxt2); 
        
    end
    
end

