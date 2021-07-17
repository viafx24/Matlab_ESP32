clear all;
close all;

Succeed=0;
Failed=0;

t = tcpclient("192.168.0.19",52000,"Timeout",2)
B=0;

for i=1:10000


A=0;

while ~isempty(A)
    
   A=t.readline()
   if isempty(A)
       pause(0.5);
       disp("error")
       Failed=Failed+1;
       B

   else
       B=A
       Succeed=Succeed+1
       Failed
   end
 
end

end