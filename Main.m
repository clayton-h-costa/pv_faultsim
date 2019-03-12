% Initialization

clear all; close all; warning off; clc 									% Clear all
save('Normal'); save('Short'); save('Degrad'); save('OpenCircuit'); save('Shadow'); save('MPPT')	% Create Fault Files
rng('default')												% Set RNG Seed

% Configure Faults and Simulation

% Config 001 - Choose which case(s) will be simulated
	Faults = [1, 2, 3, 4, 5, 6]; % 1=Normal, 2=ShortCircuit, 3=Degradation, 4=OpenCircuit, 5=Shadow, 6=MPPTFault

% Config 002 - Choose the amount of Data (temperature/irradiance) per simulation
	Batch = 10; 											% Amount of Data per simulation

% Config 003 - Choose the total amount of temperature/irradiances to be simulated
	Lines = 20000; 											% Amount of Lines to simulate

% Config 004 - Set the Temperature/Irradiance Data Set File's name
	File = 'gecad-weather.xlsx';

% Config 005 - Set which columns the Temperature and Irradiance, respectively, can be found in the file
	Columns = [2, 11];

% Config 006 - Set the minimum irradiance to be gathered
	% Specially useful when one knows how many your power inverter needs to be turned on
	MinIr = 150;


% Load Dataset
AmbInfo=Func_SepDays(File,Batch,Lines,Columns,MinIr);	% Load Irradiance and Temperature Database


% Simulate						
for SimCount=1:length(Faults)
    Case=Faults(SimCount);  				% Current Case being Simulated
    for i=1:size(AmbInfo)				
        G_in=[AmbInfo(i,5,2) AmbInfo(i,:,2)]';		% Set the irradiance's array
        T_in=[AmbInfo(i,5,1) AmbInfo(i,:,1)]';  	% Set the temperature's array
        Func_FaultGen(Case); 				% Set the file with the electrical parameters for the current case for PSim 
        sim('SimCases')					% Run the Simulation
        run('Script_RMS')				% Save the current iteration's data
    end
end