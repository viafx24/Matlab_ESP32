close all;
%load(Data_Rampe_Before_Interp.mat);

Indices=find(Data.Iteration==1);
Begin=Indices(1); %1;
End=Indices(2)-8;%249;

Choice_Limit=3984;% interp cross the end with 16-1 value.

Data.ADC_ADS1115_0_Interp= uint16(interp(Data.ADC_ADS1115_0(Begin:End),16));
Data.ADC_GPIO34_Interp=uint16(interp(Data.ADC_GPIO34(Begin:End),16));
Data.Voltage_Bridge_ADS_Interp=interp(Data.Voltage_Bridge_ADS(Begin:End),16);
Data.Voltage_Bridge_GPIO34_Interp=interp(Data.Voltage_Bridge_GPIO34(Begin:End),16);
Data.Voltage_Corrected_ADS_Interp= interp(Data.Voltage_Corrected_ADS(Begin:End),16);
Data.Voltage_Corrected_GPIO34_Interp=interp(Data.Voltage_Corrected_GPIO34(Begin:End),16);


length(Data.ADC_GPIO34(Begin:End))
length(Data.ADC_GPIO34_Interp)
length(Data.Voltage_Bridge_ADS(Begin:End))
length(Data.Voltage_Bridge_ADS_Interp)

fileID = fopen('Data.txt','w');

formatSpec = '%d, %2.4f,\r\n';

for i=1: Choice_Limit % length(Data.ADC_GPIO34_Interp)
    
    if Data.ADC_GPIO34_Interp(i)==0
    fprintf(fileID,formatSpec,Data.ADC_GPIO34_Interp(i),220);% aime of 220 is to signal a problem
    
    while(Data.ADC_GPIO34_Interp(i)==0)
            Data.ADC_GPIO34_Interp(1)=[];
            Data.Voltage_Bridge_ADS_Interp(1)=[];
    end
    end
    
    if Data.ADC_GPIO34_Interp(i)==i
       
        if i < (Choice_Limit-1) && (Data.ADC_GPIO34_Interp(i)>=Data.ADC_GPIO34_Interp(i+1)  )
            
            
            fprintf(fileID,formatSpec,Data.ADC_GPIO34_Interp(i),(Data.Voltage_Bridge_ADS_Interp(i)+ Data.Voltage_Bridge_ADS_Interp(i+1))/2);
            
            while(Data.ADC_GPIO34_Interp(i)  >=  Data.ADC_GPIO34_Interp(i+1))
                Data.ADC_GPIO34_Interp(i+1)=[];
                Data.Voltage_Bridge_ADS_Interp(i+1)=[];
            end
            
           

            
        else
            
            fprintf(fileID,formatSpec,Data.ADC_GPIO34_Interp(i),Data.Voltage_Bridge_ADS_Interp(i));
        end
        
        
    elseif  Data.ADC_GPIO34_Interp(i)>i
        
        fprintf(fileID,formatSpec,i,(Data.Voltage_Bridge_ADS_Interp(i-1) + Data.Voltage_Bridge_ADS_Interp(i))/2);
        Data.ADC_GPIO34_Interp=[Data.ADC_GPIO34_Interp(1:i-1) i Data.ADC_GPIO34_Interp(i:end)];
        Data.Voltage_Bridge_ADS_Interp=[Data.Voltage_Bridge_ADS_Interp(1:i-1) (Data.Voltage_Bridge_ADS_Interp(i-1) + Data.Voltage_Bridge_ADS_Interp(i))/2 ...
            Data.Voltage_Bridge_ADS_Interp(i:end)];
      

    end
    length(Data.Voltage_Bridge_ADS_Interp)
end




fclose(fileID);


 %plot(1:length(Data.ADC_ADS1115_0_Interp),Data.ADC_ADS1115_0_Interp,'-+r')
 plot(1:length(Data.ADC_GPIO34_Interp),Data.ADC_GPIO34_Interp,'-+b')
 plot(1:Choice_Limit,Data.ADC_GPIO34_Interp(1:Choice_Limit),'-+r')

figure
hold on
%plot(1:length(Data.Voltage_Bridge_ADS_Interp),Data.Voltage_Bridge_ADS_Interp,'-+r')
plot(1:length(Data.Voltage_Bridge_ADS_Interp),Data.Voltage_Bridge_ADS_Interp,'-+b')
plot(1:Choice_Limit,Data.Voltage_Bridge_ADS_Interp(1:Choice_Limit),'-+r')

figure
hold on
plot(Data.Voltage_Bridge_ADS(Begin:End),'-+c')

figure
hold on
plot(Data.ADC_GPIO34(Begin:End),'-+m')


figure
hold on
plot(Data.Voltage_Bridge_ADS_Interp,'-+b')

figure
hold on
plot(Data.ADC_GPIO34_Interp,'-+r')
%
% figure
% hold on
% plot(1:length(Data.Voltage_Corrected_ADS_Interp),Data.Voltage_Corrected_ADS_Interp,'-+r')
% plot(1:length(Data.Voltage_Corrected_GPIO34_Interp),Data.Voltage_Corrected_GPIO34_Interp,'-+b')


