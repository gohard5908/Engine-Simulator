function MWS = CSharp_setup_Inputs(MWS,varargin)
%		T-MATS -- setup_Inputs.m
% *************************************************************************
% written by Jeffryes Chapman
% NASA Glenn Research Center, Cleveland, OH
% July 8th, 2014
%
% This function creates the properties of the Duct components for the JT9D.
% *************************************************************************

%%
MWS.Input.W = varargin{1};          %原来是674.22
MWS.Input.Fan_Rline = varargin{2};  %2.3706
MWS.Input.BPR = varargin{3};        %5.0408
MWS.Input.LPC_Rline = varargin{4};  %1.7664
MWS.Input.HPC_Rline = varargin{5};  %2.0424
MWS.Input.HPT_PR =varargin{6};      %2.670
MWS.Input.LPT_PR = varargin{7};      %4.886
MWS.Input.LP_Shaft = varargin{8};   %3667.6    1600
MWS.Input.HP_Shaft = varargin{9};  %7390.0    6527

MWS.Input.Altitude = varargin{10}; %25000
MWS.Input.DeltaTamb = varargin{11};    %0
MWS.Input.MachNumb = varargin{12};   %0.6
MWS.Input.Wfin =varargin{13};        %1.2  0.7552
%************%
%MWS.Input.FARin=0.0125;  %这4行是为了补偿修改发动机模型导致线性化缺失的必要入口参数
%MWS.Input.Tt=545.7;
%MWS.Input.Pt=14.7;
%MWS.Input.Pamb=14.7;

%%
% Set IC
MWS.Input.NRIC = [MWS.Input.W MWS.Input.Fan_Rline MWS.Input.BPR MWS.Input.LPC_Rline...
    MWS.Input.HPC_Rline MWS.Input.HPT_PR MWS.Input.LPT_PR MWS.Input.LP_Shaft MWS.Input.HP_Shaft];

MWS.Input.NRICDyn = [MWS.Input.W MWS.Input.Fan_Rline MWS.Input.BPR MWS.Input.LPC_Rline...
    MWS.Input.HPC_Rline MWS.Input.HPT_PR MWS.Input.LPT_PR];

% IDesign value
MWS.iDes = 2;

% Shaft Inertia
MWS.Shaft.Iner_lp = 100;    %100
MWS.Shaft.Iner_hp = 20;     %20
