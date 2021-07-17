

% Data.ADC_ADS1115_0(230:473);
% 
% Data.ADC_GPIO34(230:473);


% figure
% hold on;
% plot(Data.ADC_ADS1115_0(230:473),'-+b');
% plot(Data.ADC_GPIO34(230:473),'-+r');

% figure
% hold on
% plot(Data.ADC_ADS1115_0(230:473)-Data.ADC_GPIO34(230:473),'-+g')
% plot(Data.ADC_ADS1115_1(230:473)-Data.ADC_GPIO33(230:473),'-+r')
% plot(Data.ADC_ADS1115_2(230:473)-Data.ADC_GPIO32(230:473),'-+b')
% plot(Data.ADC_ADS1115_3(230:473)-Data.ADC_GPIO35(230:473),'-+c')


Offset=mean(Data.ADC_ADS1115_3(230:230+194)-Data.ADC_GPIO35(230:230+194));

figure
hold on;
% plot(Data.ADC_ADS1115_0(230:473),'-+b');
% plot(Data.ADC_GPIO34(230:473)+ Offset,'-+r');

plot(Data.ADC_ADS1115_0(230:230+194)-(Data.ADC_GPIO34(230:230+194)+ Offset),'-+g');
