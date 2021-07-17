close all;
figure
hold on;

Indices=find(Data.Iteration==1);


Indices=find(Data.Iteration==1);
Begin=Indices(1); %1;
End=Indices(2)-5;%252;



Data.ADC_GPIO34_Interp=interp(Data.ADC_GPIO34(Begin:End),16);
Data.Voltage_Bridge_ADS_Interp=interp(Data.Voltage_Bridge_ADS(Begin:End),16);

plot(Data.ADC_GPIO34_Interp,Data.Voltage_Bridge_ADS_Interp,'+b')
plot(Data.ADC_GPIO34(Begin:End),Data.Voltage_Bridge_ADS(Begin:End),'+r');


%plot(Data.Voltage_Bridge_ADS(Begin:End),Data.ADC_GPIO34(Begin:End),'+r')


% plot(Data.Voltage_Bridge_ADS(Begin:End)

% Data.ADC_ADS1115_0_Interp= uint16(interp(Data.ADC_ADS1115_0(Begin:End),16));
 Data.ADC_GPIO34_Interp=uint16(interp(Data.ADC_GPIO34(Begin:End),16));
% Data.Voltage_Bridge_ADS_Interp=interp(Data.Voltage_Bridge_ADS(Begin:End),16);
% plot(Data.ADC_GPIO34(257:512),'+g')
% plot(Data.ADC_GPIO34(513:768),'+m')
% plot(Data.ADC_GPIO34(769:1024),'+b')