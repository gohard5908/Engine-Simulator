function MWS = setup_Inputs(MWS)
%		T-MATS -- setup_Inputs.m
% *************************************************************************
% written by Jeffryes Chapman
% NASA Glenn Research Center, Cleveland, OH
% July 8th, 2014
%
% This function creates the properties of the Duct components for the JT9D.
% *************************************************************************

MWS.Input.W = 611.5;          %Ô­À´ÊÇ1539
MWS.Input.Fan_Rline = 1.492;  %2.0
MWS.Input.BPR =5.931;        %5.275
MWS.Input.LPC_Rline = 2.141;  %1.769
MWS.Input.HPC_Rline = 2.298;  %2.081
MWS.Input.HPT_PR = 2.818;      %2.694
MWS.Input.LPT_PR = 1.74;      %4.558
MWS.Input.LP_Shaft = 1600;   %3750  %15
MWS.Input.HP_Shaft = 6560 ;  %8000.0

MWS.Input.Altitude = 0;
MWS.Input.DeltaTamb = 27;
MWS.Input.MachNumb = 0;
MWS.Input.Wfin =0.7546;

% Set IC
MWS.Input.NRIC = [MWS.Input.W MWS.Input.Fan_Rline MWS.Input.BPR MWS.Input.LPC_Rline...
    MWS.Input.HPC_Rline MWS.Input.HPT_PR MWS.Input.LPT_PR MWS.Input.LP_Shaft MWS.Input.HP_Shaft];

MWS.Input.NRICDyn = [MWS.Input.W MWS.Input.Fan_Rline MWS.Input.BPR MWS.Input.LPC_Rline...
    MWS.Input.HPC_Rline MWS.Input.HPT_PR MWS.Input.LPT_PR];

% IDesign value
MWS.iDes = 2;

% Shaft Inertia
MWS.Shaft.Iner_lp = 100;
MWS.Shaft.Iner_hp = 20;
