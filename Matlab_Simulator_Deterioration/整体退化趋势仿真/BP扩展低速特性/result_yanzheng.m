y=null(4,length(T1));


for i=1:length(T1)
    
    a=P(:,i);
    a=tramnmx(a,minp,maxp);

    y_=sim(net1,a);
    y(1,i)=postmnmx(y_,mint1,maxt1);
    
    y_2=sim(net2,a);
    y(3,i)=postmnmx(y_2,mint2,maxt2);
end

y(2,:)=T1;
y(4,:)=T2;