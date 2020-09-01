function [SST,SSE,r2] = M4_Regression_005_27(Price_Data);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This subfunction takes in pricing data and returns linearized SST, SSE,
% and r^2 values while displaying the general model and linearized model. 
%
% Function Call
% [SST,SSE,r2] = M4_Regression_005_27(Price_Data);
%
% Input Arguments
% Price_Data
%
% Output Arguments
% 1. SST
% 2. SSE
% 3. r^2
%
% Assignment Information
%   Assignment:     M4, Regression Function
%   Team membr:     Sam Agarwal, agarw190@purdue.edu
%                   Justin Chan, chan278@purdue.edu
%                   Kerem Cengiz, mcengiz@purdue.edu
%                   Jun Kim, kim3273@purdue.edu
%   Team ID:        005-27
%   Academic Integrity:
%     [] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%     Peers we worked with: Name, login@purdue [repeat for each]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION
% Takes imported data and splits the values into specific vectors
Km = Price_Data(:,1);
Price = Price_Data(:,2);

%% ____________________
%% CALCULATIONS
%Calculates the regression line of the linearized data
xlin = log10(Km);
ylin = log10(Price);
a1 = (((mean(Km)*mean(ylin))-mean(Km.*ylin))/((mean(Km)^2)-mean(Km.^2))); % slope
b1 = mean(ylin) - (a1*mean(Km));

% Conducts error analysis between the data and the linear model
SSE = sum((ylin-((a1 .* Km) + b1)).^2);
SST = sum((ylin-mean(ylin)).^2);
r2 = 1-(SSE/SST);

% Determines parameters for the general model
ye = (a1 .* Km) + b1;
b = 10^b1;
x_values = linspace(min(Km), max(Km), 1000);
yexponential = b .*(10 .^ (a1.*x_values));
%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS
%Displays the linearized data with the regression line 
figure(4)
hold on
scatter(Km,ylin,20, 'k*');
plot(Km, ye,'b');
title('Linearized Exponential Function', 'fontsize', 13);
xlabel('Log10 Km');
ylabel('Log10 Price');
xlim([min(Km) max(Km)]);
caption0 = 'y = -0.0045x + 3.290';
text(200,2.6, caption0, 'FontSize', 10, 'Color', 'k');
grid on
hold off

%Displays the raw data with general model exponential function
figure(5)
hold on
scatter(Km,Price,20,'b*');
xlabel('Michaelis Constant (uM)');
ylabel('Price (USD($)/lb)');
xlim([min(Km) max(Km)]);
title('Figure 2: Price as a Function as Enzyme Performance', 'fontsize', 13);
caption = 'y = 1950.92 * 10^{-0.0045x}';
text(180,380, caption, 'FontSize', 10, 'Color', 'k');
plot(x_values, yexponential,'r');
grid on
hold off
%% ____________________
%% COMMAND WINDOW OUTPUT
%Displays the values found in the command window
fprintf("General Model Equation: y = %0.2f * 10^%0.4fx\n", b,a1);
fprintf("Linearized Exponential Function y = %0.4fx + %0.3f\n", a1,b1);
fprintf("SSElin: %0.4f\nSSTlin: %0.4f\n", SSE, SST);
fprintf("r^2: %0.4f\n",r2);

%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.



