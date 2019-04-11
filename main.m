% Main script for the MATLAB / PSim Grid-Tie PV system and Faults
% Simulation.
%
% Change Configs 001 ~ 006, at the start of this file before run
% Configs:
%   001 - 1D Array with Cases to simulate, where: 1=Normal, 2=ShortCircuit, 3=Degradation, 4=OpenCircuit, 5=Shadow, 6=MPPTFault
%   002 - Int value of amount of data to be used per simulation run
%   003 - Int value of amount of lines from the Irradiance/Temperature
%   database to be used
%   004 - String with the database (.xlsx) file
%   005 - Array with the columns on the database where the Temperature and
%   Irradiance can be found [Temperature, Irradiance]
%   006 - Minimum Irradiance to be used
%
%   The Default's database used can be found at: http://www.gecad.isep.ipp.pt/Ies2/Weather%20Data/gecad-weather.xlsx
%   But any database can be used (Temperature must be in ºC and Irradiance in W/m²)


% Initialization

clear all; close all; warning off; clc 	% Clear all
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