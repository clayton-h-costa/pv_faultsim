# The project
* 1 - What is this project?
	* This project was created with the purpose of allow the simulation of several faults (and a non-fault situation) on a grid-connected photovoltaic system.
* 2 - Which faults can be simulated?
	* Short-Circuit
	* Degradation
	* Open Circuit
	* Shading 
	* MPPT Fault
* 3 - Which software was used to develop and use this project?
	* Matlab R2018a / Simulink
	* PSim 9.0
* 4 - What is the PV System's description?
	* 2 Arrays of eight 330W PV Modules [Datasheet available at:(https://www.canadiansolar.com/upload/83b21fe2080dc7c1/1952d42e21351e39.pdf)] - Last visit: 12-March-2019
	* 2 Stages Power Inverter (DC/DC MPPT* Controled Power Converter -- Grid Connected DC/AC Power Converter)
  	* MPPT's Algorithm: Perturb & Observ
* 5 - Can i use other PV Modules or Topolgy?
	* The electrical circuit can be easily changed with PSim 9.0 (.psimsch files)
	* The PV Module's parameters, can be changed at the 'P_SIM_PVMODULE' file.
* 6 - Can i use other parameters for the Faults?
	* These can be changed at the function 'Func_FaultGen.m'
  
# How to run:
  * 1 - Open 'SimCases.slx' with MATLAB/Simulink, double click the SimCoupler box and set the path for the project's folder / P_SIM_MAIN.psimsch file.
* 2 - Copy your Dataset's file (with irradiance and temperature values) to the project's folder.
* 3 - Open 'Main.m' with MATLAB, set the configurations at the "Configuration" Section.
* 4 - Run the 'Main.m' script.

** You may need to setup the SimCoupler, which is a tool to set a Co-Simulation between Matlab and PSIM (Refer to https://powersimtech.com/products/psim/simcoupler/)

** It may be easier if you put the PsimDialog.m and PSimDialog.fig inside the same folder as this project.

** Note that these file's names are case sensitive.

# Files:
* 1 - Main.m
  * This MATLAB Script controls all other files
  *	1.1 - The simulations will run in batches. If you set to run 2000 lines of data with batches = 10, for instance, it will run 200 simulations with 10 data each.
  *	1.2 - When you run this file, a ".mat" file will be created for each fault. Whenever a simulation finished, it will update the file correspondent to the current case with the features.
  *	1.3 - The features save in each file are: VS1 (Voltage at String1), VS2 (Voltage at String2), IS1 (Current at String1), IS2 (Current at String2), VP1 (AC Voltage [Grid]), IP1 (AC Current), G (Irradiance) and T (Temperature)
  *	1.4 - The matrices will be  AxB, where A is the simulation number and B is iteration within A
  *	1.5 - At the start of this file, there is a "Configurations Section", where one can set the Dataset file's name, the irradiance and temperature columns within this file, as well as which cases and how many lines will be simulated and the "batches".
  * The Dataset file must be saved in the same folder as the 'Main.m' 
  * The Dataset originaly used for this project was the 'gecad-weather.xlsx', which contains data colected every 5 minutes in the city of Porto, Portugal. This Dataset is available at:

* 2 - SimCases.slx
  *	This is the simulink model that controls and runs the Simulation.

* 3 - Func_SepDays.m
  *	It's the MATLAB function that setup de dataset into the right format for it to be used in this project.

* 4 - Func_FaultGen.m
  *	This MATLAB function will properly generate the "Config.txt" file use by the PSim's simulation. This file have the values for: Short-Circuit Resistors, Degradation Resistors, Open Circuit Switches, MPPT Gain and Shadow Gain.
	
* 5 - Script_RMS.m
  *	This MATLAB Script will save the features from the case being simulated within the correct file.

* 6 - Every ".psimsch" file refers to a PSim's simulation file:
  *	6.1 - P_SIM_MAIN.psimsch - Is the main file, containing every other "psimsch" file within.
  *	6.2 - P_SIM_MPPT.psimsch - Contains the Perturb and Observe MPPT algorithm used on the Power Converter.
  *	6.3 - P_SIM_PVMODULE.psimsch - Contains the PV module circuit with the correspondent Degradation and Short-Circuit Resistors, The Shadow Gain and a bit of noise added at both the Temperature and Irradiance inputs.
  *	6.4 - P_SIM_DCDC.psimsch - Contains the DC/DC Converter with the MPPT algorithm (P_SIM_MPPT.psimsch).
  *	6.5 - P_SIM_DCAC.psimsch - Contains the DC/AC Converter.
  
  
 # Questions & Suggestions
  * For any questions and/or suggestions, please feel free to e-mail us at: clayton_hdc@hotmail.com
