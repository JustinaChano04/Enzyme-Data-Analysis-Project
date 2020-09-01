 function [Vmax,Km,Vo]=M2_Algorithm_005_27(S)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This function finds the Vmax,Km, and Vo of a substrate with
% concentration of S
%
% Function Call
% [Vmax,Km,Vo] = dataset1a
%
% Input Arguments
% [S] = the initial substrate concentration
%
% Output Arguments
% Vmax = the maximum observable rate
% Km = Michaelis constant
% Vo = reaction rate at a specific substrate concentration

% Assignment Information
%   Assignment:     M2, Problem N/A
%   Author:         Sam Agarwal, agarw190@purdue.edu
%   Team ID:        27
%   Academic Integrity:
%     [] I worked with one or more peers but our collaboration
%        maintained academic integrity.
%     Peers I worked with: 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Initialization
data = readmatrix('Data_nextGen_KEtesting_allresults.csv');
column = find(data(1,:)==S); %finds data sets with specified substrate concentration

time = data(3:end,1);
substrateinitial = data(4:end,column);
answers = zeros(size(substrateinitial,2),3);
counter1 = 1;
while counter1<=size(substrateinitial,2) %Finds the Vmax, Vo, and Km of each test 
    substratedata = substrateinitial(:,counter1);

    substrate = substratedata(any(~isnan(substratedata),2),:); %removes NAN values
    substrate(isnan(substrate))=0; %converts residual NAN values to zero

    time1a = time(1:size(substrate)); %creates array of time to match length of test
    vmat = zeros(size(substrate)); %initializes array for slopes

    %% Generating the line
    poly = polyfit(time1a,substrate,6); % generates the coefficients for a line of degree 5
    f1 = polyval(poly,time1a); % generates points along the 'poly' line


    %% Finding each velocity
    counter = 2;
    while counter <= numel(f1)
      v = (f1(counter)-f1(counter-1))./(time1a(counter)-time1a(counter-1));
      vmat(counter-1,1)= v;
      counter = counter + 1;
    end
    vmat(vmat<=0)=[]; %removes all negative values


    %% FINDING VO, Vmax, and Km
    Vmax = max(vmat); %finds Vmax
    answers(counter1) = Vmax;
    
    Km = 0.5 .* find(vmat==Vmax); %finds Km
    answers(counter1 + 10) = Km;
    
    %% MICHAELIS-MENTEN EQUATION
    Vo = (Vmax .* S)./(Km + S); %Michaelis-Menten equation
    answers(counter1 + 20) = Vo;
    counter1 = counter1 + 1;
    
end    


%% COMBINING THE TESTS
meanvalues = mean(answers);
Vmax = meanvalues(1);
Km = meanvalues(2);
Vo = meanvalues(3);

