% originally posted code
figure
x1 = (164:1:182)';
y1 = [-11.95; -11.66; -11.29; -11.08; -11.00; -11.00; -10.99; -11.08; ...
      -11.27; -11.29; -11.68; -11.61; -11.80; -11.77; -11.78; -11.69; ...
      -11.48; -11.04; -10.81];
p  = polyfit(x1, y1, 3); % Fit 3rd degree polynomial to orginal data
x2 = (164:0.5:182)';     % New X2 scale is twice as dense
y2 = polyval(p, x2);     % Evaluate polynomial curve to new X2 scale
% Plot the original data and the fitted curve
plot(x1, y1, 'bo-', x2, y2, 'ro-')
% Find the three places where the curve crosses the line y = -11.5
% Rewrite polyval(p, x) = -11.5 as
% polyval(p, x) - (-11.5) = 0 and find some solutions for x
desiredX(1) = fzero(@(x) polyval(p, x)-(-11.5), 170);
desiredX(2) = fzero(@(x) polyval(p, x)-(-11.5), 175);
desiredX(3) = fzero(@(x) polyval(p, x)-(-11.5), 180);
% Plot the intersections: X marks the spots
hold on
plot(desiredX, repmat(-11.5, size(desiredX)), 'gx-')