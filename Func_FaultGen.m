function FaultGen(Case)

save=fopen('Config.txt','w'); % Open PSim's Simulation File


FaultyModule=randi(16); %Choose a random module to apply the fault (For Short-Circuit, Degradation and Shadow only)

% Short Circuit

for FaultyMod=1:16
    if FaultyMod==FaultyModule 
        if Case==2 % Short Circuit
            if randi(2)==1 				% Chose randomly between Low and High Resistance Short Circuit
                fprintf(save,'C%d=1e-2;',FaultyMod); 	%Low Resistance Short Circuit
            else
                fprintf(save,'C%d=6;',FaultyMod); 	%High Resistance Short Circuit
            end
            fprintf(save,'\r\n');
        else
            fprintf(save,'C%d=1e20;',FaultyMod);
            fprintf(save,'\r\n');
        end    
    else
        fprintf(save,'C%d=1e20;',FaultyMod);
        fprintf(save,'\r\n');
    end
end      
 
% Degradation

for FaultyMod=1:16
    if FaultyMod==FaultyModule 
        if Case==3 % Degradation
            fprintf(save,'D%d=%f;',FaultyMod,2+4*rand);   
        else
            fprintf(save,'D%d=1e-9;',FaultyMod);
        end
        fprintf(save,'\r\n');
    else
        fprintf(save,'D%d=1e-9;',FaultyMod);
        fprintf(save,'\r\n');
    end           
end


%Open Circuit
if Case==4 				% OpenCircuit
    if randi(2)==1			% Chose a random string to be Opened
        fprintf(save,'OC1=0;');
        fprintf(save,'\r\n');
        fprintf(save,'OC2=1;');
    else
        fprintf(save,'OC1=1;');
        fprintf(save,'\r\n');
        fprintf(save,'OC2=0;');
    end
else
        fprintf(save,'OC1=1;');
        fprintf(save,'\r\n');
        fprintf(save,'OC2=1;');
end

fprintf(save,'\r\n');
   

% Shadow
for FaultyMod=1:16
    if FaultyMod==FaultyModule 
        if Case==5
            fprintf(save,'Sh%d=%f;',FaultyMod,0.25 + rand*0.3);  % Chose a random amount of Shadow 
        else
            fprintf(save,'Sh%d=1;',FaultyMod);
        end
        fprintf(save,'\r\n');
    else
        fprintf(save,'Sh%d=1;',FaultyMod);
        fprintf(save,'\r\n');
    end           
end

% MPPT
if Case==6 % MPPT Fault
    fprintf(save,'FI=0;');
else
    fprintf(save,'FI=1;');
end


fclose(save);
