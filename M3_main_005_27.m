function M3_main_005_27
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%replace this text with your program decription as a comment
%
% Function Call
%replace this text with a comment that states the function call
%
% Input Arguments
%replace this text with a commented list of the input arguments
%
% Output Arguments
%replace this text with a commented list of the output arguments
%
% Assignment Information
%   Assignment:     M3, Main Function
%   Team member:    Jun Kim, kim3273@purdue.edu [repeat for each person]
%   Team ID:        005-27
%   Academic Integrity:
%     [] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%     Peers we worked with: Name, login@purdue [repeat for each]
%did you complete the assignment information? delete this line if yes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION

data = readmatrix("Data_PGOX50_enzyme.csv");
S = data(2,2:11);
P = data(5:end,2:11);

%% ____________________
%% CALCULATIONS

[Vmax, Km, v0] = M3_Algorithm_005_27(S, P, P); % Using P twice since no P_duplicate

%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS

fprintf("Vo : \n");
disp(v0);
fprintf("Vmax : %.3f\n", Vmax);
fprintf("Km : %.3f\n", Km);

%% ____________________
%% COMMAND WINDOW OUTPUT


end

%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.



