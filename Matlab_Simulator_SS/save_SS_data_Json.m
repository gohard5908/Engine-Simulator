%这里将仿真好的数据组织一下转存为Json格式；
%工况数据
SS_simData.Altitude=MWS.Input.Altitude;
SS_simData.Mach=MWS.Input.MachNumb;
SS_simData.Delta=MWS.Input.DeltaTamb;

%传感器数据
length_ofsimdata=length(S15.Pt.data);
SS_simData.S15.P15=S15.Pt.data(length_ofsimdata);
SS_simData.S15.T15=S15.Tt.data(length_ofsimdata);

SS_simData.S2.P2=S2.Pt.data(length_ofsimdata);
SS_simData.S2.T2=S2.Tt.data(length_ofsimdata);

SS_simData.S21.P21=S21.Pt.data(length_ofsimdata);
SS_simData.S21.T21=S21.Tt.data(length_ofsimdata);

SS_simData.S25.P25=S25.Pt.data(length_ofsimdata);
SS_simData.S25.T25=S25.Tt.data(length_ofsimdata);

SS_simData.S3.P3=S3.Pt.data(length_ofsimdata);
SS_simData.S3.T3=S3.Tt.data(length_ofsimdata);

SS_simData.S3all.Ps3=S3all.Ps.data(length_ofsimdata);
SS_simData.S3all.Ts3=S3all.Ts.data(length_ofsimdata);

SS_simData.S4.P4=S4.Pt.data(length_ofsimdata);
SS_simData.S4.T4=S4.Tt.data(length_ofsimdata);

SS_simData.S45.P45=S45.Pt.data(length_ofsimdata);
SS_simData.S45.T45=S45.Tt.data(length_ofsimdata);

SS_simData.S5.P5=S5.Pt.data(length_ofsimdata);
SS_simData.S5.T5=S5.Tt.data(length_ofsimdata);

SS_simData.Thrust.Fgross=Fgross.data(length_ofsimdata);
SS_simData.Thrust.Fnet=Fnet.data(length_ofsimdata);

SS_simData.TSFC=TSFC.data(length_ofsimdata);


%特性图绘制数据  5个部件
SS_simData.FAN.Wc=FData.WcMap.data(length_ofsimdata);
SS_simData.FAN.PR=FData.PRMap.data(length_ofsimdata);

SS_simData.LPC.Wc=LPCData.WcMap.data(length_ofsimdata);
SS_simData.LPC.PR=LPCData.PRMap.data(length_ofsimdata);

SS_simData.HPC.Wc=HPCData.WcMap.data(length_ofsimdata);
SS_simData.HPC.PR=HPCData.PRMap.data(length_ofsimdata);

SS_simData.HPT.Wc=HPTData.WcMap.data(length_ofsimdata);
SS_simData.HPT.PR=HPTData.PRMap.data(length_ofsimdata);

SS_simData.LPT.Wc=LPTData.WcMap.data(length_ofsimdata);
SS_simData.LPT.PR=LPTData.PRMap.data(length_ofsimdata);

%cd SS_Sim_Data
savejson('SS_simData',SS_simData,'D:\Engine_Simulator\Matlab_Simulator_SS\SS_Sim_Data\SS_Sim_Data.json');

