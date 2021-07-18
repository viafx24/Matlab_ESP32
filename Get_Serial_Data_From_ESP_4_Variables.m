instrreset % maybe my friend

clear all;
close all;

if isequal(exist('s','var'),0)% ouvre serial si pas encore fait.
    s=serial('COM6','BaudRate',115200);
end

fopen(s);

Length_Data=60000;

[Data.Iteration, Data.Voltage_Bridge_ADS, Data.Voltage_Bridge_GPIO34, Data.Voltage_Bridge_GPIO34_Corrected]=deal(zeros(1,Length_Data));

f=figure;
hold on;
h1=plot(NaN,NaN,'-+b');
h2=plot(NaN,NaN,'-+r');
h3=plot(NaN,NaN,'-+g');
% h4=plot(NaN,NaN,'-r');
% h5=plot(NaN,NaN,'-+b');
% h6=plot(NaN,NaN,'-b');
ylim([0 3.3]);
% ylabel('ADC')
% xlabel('Iteration DAC')

% flushoutput(s)
% flushinput(s)
% pause(2)

for i=1:Length_Data
    
    RetrieveData=fscanf(s);
    
    commas = strfind(RetrieveData,',');
    while length(commas) ~= 3
        commas = strfind(RetrieveData,',');
    end
    if length(commas)==3
        
        Data.Iteration(i) = str2double(RetrieveData(1:commas(1)-1));
        Data.Voltage_Bridge_ADS(i)= str2double(RetrieveData(commas(1):commas(2)-1));
        Data.Voltage_Bridge_GPIO34(i)  = str2double(RetrieveData(commas(2):commas(3)-1));
        Data.Voltage_Bridge_GPIO34_Corrected(i) = str2double(RetrieveData(commas(3):end));
        %         Data.Voltage_Bridge_GPIO34(i) = str2double(RetrieveData(commas(4):commas(5)-1));
        %         Data.Voltage_Corrected_ADS(i) = str2double(RetrieveData(commas(5):commas(6)-1));
        %         Data.Voltage_Corrected_GPIO34(i)= str2double(RetrieveData(commas(6):end));
        
    end
    
    
    h1.XData=1:i;
    h1.YData=Data.Voltage_Bridge_ADS(1:i);
    h2.XData=1:i;
    h2.YData=Data.Voltage_Bridge_GPIO34(1:i);
    h3.XData=1:i;
    h3.YData=Data.Voltage_Bridge_GPIO34_Corrected(1:i);
%     h4.XData=1:i;
%     h4.YData=Data.Voltage_Bridge_GPIO34(1:i);
%     h5.XData=1:i;
%     h5.YData=Data.Voltage_Corrected_ADS(1:i);
%     h6.XData=1:i;
%     h6.YData=Data.Voltage_Corrected_GPIO34(1:i);
    
    drawnow;
    % formatSpec = 'X is %4.2f meters or %8.3f mm\n';
    % nbytes = fprintf(fileID,'%5d %5d %5d %5d\n',A)
    
%    save('Data_Rampe_Before_Interp.mat','Data');
end