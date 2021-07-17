close all;


Indices=find(Data.Iteration==1);
offset_Begin=2;
offset_End=249;

Data.ADC_ADS1115_0_Interp= uint16(interp(Data.ADC_ADS1115_0(Indices(1) + offset_Begin:Indices(1) + offset_End),16));
Data.ADC_GPIO34_Interp=uint16(interp(Data.ADC_GPIO34(Indices(1) + offset_Begin:Indices(1) + offset_End),16));
Data.Voltage_Bridge_ADS_Interp=interp(Data.Voltage_Bridge_ADS(Indices(1) + offset_Begin:Indices(1) + offset_End),16);
Data.Voltage_Bridge_GPIO34_Interp=interp(Data.Voltage_Bridge_GPIO34(Indices(1) + offset_Begin:Indices(1) + offset_End),16);
Data.Voltage_Corrected_ADS_Interp= interp(Data.Voltage_Corrected_ADS(Indices(1) + offset_Begin:Indices(1) + offset_End),16);
Data.Voltage_Corrected_GPIO34_Interp=interp(Data.Voltage_Corrected_GPIO34(Indices(1) + offset_Begin:Indices(1) + offset_End),16);




fileID = fopen('Data.txt','w');

formatSpec = '%d, %d, %2.4f, %2.4f,%2.4f,%2.4f \r\n';   

for i=1:length(Data.ADC_ADS1115_0_Interp)
     
    fprintf(fileID,formatSpec,Data.ADC_ADS1115_0_Interp(i),Data.ADC_GPIO34_Interp(i),...
      Data.Voltage_Bridge_ADS_Interp(i),Data.Voltage_Bridge_GPIO34_Interp(i),...
      Data.Voltage_Corrected_ADS_Interp(i),Data.Voltage_Corrected_GPIO34_Interp(i));
    
end

fclose(fileID);

 figure
hold on
plot(1:length(Data.ADC_ADS1115_0_Interp),Data.ADC_ADS1115_0_Interp,'-+r')
 plot(1:length(Data.ADC_GPIO34_Interp),Data.ADC_GPIO34_Interp,'-+b')

figure
hold on
plot(1:length(Data.Voltage_Bridge_ADS_Interp),Data.Voltage_Bridge_ADS_Interp,'-+r')
plot(1:length(Data.Voltage_Bridge_GPIO34_Interp),Data.Voltage_Bridge_GPIO34_Interp,'-+b')

figure
hold on
plot(1:length(Data.Voltage_Corrected_ADS_Interp),Data.Voltage_Corrected_ADS_Interp,'-+r')
plot(1:length(Data.Voltage_Corrected_GPIO34_Interp),Data.Voltage_Corrected_GPIO34_Interp,'-+b')


