% create a polynommial
close all;
figure
hold on;
y1 = [-1 8 17 19 10 -2 -7 -1 7 9];
x1 = 1:10;
p = polyfit(x1,y1,5);
y2 = polyval(p,x1);
plot(x1,y1,'+-b');
plot(x1,y2,'-r');

% find values of x where polyval(p,x) = 5
y = 5; x0 = 1;
f = @(x) polyval(p,x) - y;
x = fzero(f,x0)


% try with other starting points:
% x0 = 2;
% x = fzero(f,x0)
% 
% x0 = 5;
% x = fzero(f,x0)
% 
% x0 = 8;
% x = fzero(f,x0)