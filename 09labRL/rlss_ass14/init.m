% 
% Initialization file for the Matlab routines used in the different
% assignments.
%
% (C) Francisco Melo, 2009 

% Action encoding

N = 1;
S = 2;
E = 3;
W = 4;
Noop = 5;

ACTMAT = {'North','South','East','West','Noop'};

ACTVEC = [ 0  1;
           0 -1;
           1  0;
          -1  0;
           0  0];
       
% Observation encoding

None = 1;
Goal = 2;

% Stoping condition for VI)

ERR = 1e-5;

% Number of trials for MC averaging

NTRIALS = 1e3;

% Environmental variable: echo

ECHO = 0;
           