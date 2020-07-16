function MWS = JT9D_setup_everything_Dyn(varargin)
%		T-MATS -- JT9D_setup_everything_Dyn.m
% *************************************************************************
% written by Jeffryes Chapman based on work by Ryan May,Jeff Csank, and Dean K. Fredrick
% NASA Glenn Research Center, Cleveland, OH
% Feb 14th, 2014
%
% This file is run as part of setup_everything. 
% It adds all necessary paths and then calls the required variable setup scripts.
% *************************************************************************

 if(nargin == 0)  % if engName argument is not passed into setup_MWS
    MWS.engName = 'engine1';
    inputs = [];
 elseif(nargin == 1)
    inputs = varargin{1};
    MWS.engName = 'engine1';
 elseif(nargin == 2)
    inputs = varargin{1};
    MWS.engName = varargin{2};
 end
%--------- get name of starting directory ----
MWS.top_level = pwd;
POp = filesep;

%--------- add necessary subdirectories to current MATLAB path
cd Simsetup

%------ run various setup files to get tables & constants ---------
MWS = setup_Fan_Extend(MWS);        % develops variables for FAN
MWS = setup_LPC(MWS);               % sets up input vectors
MWS = setup_HPC(MWS);               % develops variables for HPC
MWS = setup_HPT(MWS);               % develops variables for HPT
MWS = setup_LPT(MWS);               % develops variables for LPT
MWS = setup_Noz(MWS);               % develops variables for core Noz
MWS = setup_Noz_byp(MWS);           % develops variables for bypass Noz
MWS = setup_Burner(MWS);            % develops variables for Burner
MWS = setup_Duct(MWS);              % develops variables for Duct
MWS = setup_Inlet(MWS);             % develops variables for Inlet
MWS = setup_Inputs(MWS);



%MWS = dyn_control_set_00(MWS);
%MWS = dyn_control_set_for_test(MWS);
%MWS = input_set_0_01(MWS);

%MWS = input_set_0_0(MWS);
%MWS = input_set_for_test(MWS);
%MWS = input_set_0_025(MWS);
%MWS = Dyn_inputset_Idle(MWS);
%MWS =Dyn_inputset_Idle_NfR1600(MWS);
%MWS =Dyn_inputset_Idle_NfR1600_HPCchanged(MWS);
%MWS = input_set_0_0_15(MWS);
%MWS = input_set_0_0_20(MWS);
MWS = input_set_0_0_100(MWS);

%MWS = input_set_34000_8(MWS);
%% 这部分是用于和TTECTrA集成所需的设定，其实应放于上面setup脚本中，此处为了测试修改方便
MWS.Ts=0.01;         % model sampling time    
MWS.IC.Wf_0=0.7546;    % initial fuel flow     %这部分注意新旧发动机  %1.37 
MWS.IC.Nc_0=6560;   %6634是用AGT30 Fan % initial core speed
MWS.IC.P2_0=14.5784;    % initial P2, used for correction
MWS.IC.T2_0=545.67;    % initial T2, used for correction

MWS.C_TSTD = 518.67;        % degR     %用于校正的量？该用标准大气参数还是具体飞行条件大气参数？
MWS.C_PSTD = 14.695951;     % psia

MWS.HP_in.t=[0 100];
MWS.HP_in.scaled=[1 1];
%%

cd .. 
% if no output is specified, then just assign MWS to the workspace
if(nargout == 0)
    assignin('base','MWS',MWS);
end

% open template
%open_system('JT9D_Model_Dyn.slx');
%open_system('JT9D_Model_SS_test_with_alti.slx');
%open_system('JT9D_Model_Dyn_control_schedule.slx');
%open_system('JT9D_Model_Dyn_no_control_schedule.slx');
%open_system('TTECTrA_JT9D_SS_example.slx');
%open_system('TTECTrA_JT9D_example.slx');

% loading complete
%disp('******* JT9D_Dyn example ready to execute *******')
%disp('** JT9D_SS example ready to execute **')
%disp('** This JT9D-like model was created using publically available data only **')
%disp('** The model is meant for educational purposes only, as such the developers make no specific claims of model accuracy. **')
%disp('** See NASA/TM-2014-218409 for more information on model development **')



