function FinalTable = Func_SepDays(File,Batch,Lines,Columns,Gmin)

% Load data
warning off
rng('Default')
Table=xlsread(File);

% Mount table with Temperature and Irradiance only

Count=1;
for i=1:size(Table,1)
    if Table(i,11)>=Gmin
        NewTable(Count,:)=[Table(i,Columns(1)) Table(i,Columns(2))];
        Count=Count+1;
    end
end

if Lines > size(NewTable,1)
    Lines = size(NewTable,1);
end

Count=1;
for i=1:floor(Lines/Batch)
    for j=1:Batch
        FinalTable(i,j,:)=NewTable(Count,:);
        Count=Count+1;
    end
end
		
		
	
