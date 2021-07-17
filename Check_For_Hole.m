count=0
for i=1:4082
    x=find(Data.ADC_GPIO34_Interp==i);
    
    if isempty(x)
        i
        count=count+1
    end
end