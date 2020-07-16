
data=null(60,5);

for i=3:1:7
    for j=1:1:12
        
     data((i-3)*12+j,1)=FAN.NcVec(i);   
     data((i-3)*12+j,2)=FAN.RlineVec(j);     
     data((i-3)*12+j,3)=FAN.WcArray(i,j); 
     data((i-3)*12+j,4)=FAN.PRArray(i,j);
     data((i-3)*12+j,5)=FAN.EffArray(i,j); 
    
     
    end
end