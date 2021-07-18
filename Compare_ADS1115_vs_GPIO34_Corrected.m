
figure;

Difference=Data.Voltage_Bridge_ADS(261:507)-Data.Voltage_Bridge_GPIO34_Corrected(261:507);
plot(Difference,'-+');

std(Difference)
mean(Difference)
max(Difference)
min(Difference)