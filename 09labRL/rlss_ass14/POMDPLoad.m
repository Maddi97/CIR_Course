function [M] = POMDPLoad()
% function [M] = POMDPLoad(Goals)
%
% This functions loads the POMDP model for the grid world with partial 
% observability. 
% 
% Your goal is to implement the observation model for this scenario.You 
% will find that the comments along the file should help you in 
% implementing this function.
%
% (C) Francisco Melo, 2009 


init;

% We start by defining the MDP parameters for the grid world problem. You
% will be able to use these throughout the file. To this purpose, we use
% the MDP model created in assignment 1.2.

Maux  = MDPLoad(2);

nS = Maux.nS;
nA = Maux.nA;
P  = Maux.P;
r  = Maux.r;

clear Maux;

% Number of observations available to the robot:

nZ = ???;

% Observation probabilities matrix. Unlike the notation used in the notes, 
% where the transition probabilities are denoted as O(x,a,z), for
% practical purposes we will code them as O(x,z,a). Therefore, for each of
% the 5 actions fill in the corresponding observation probability matrix.
% For example, O(2, None, N) represents the probability of observing "None"
% in state 2 after choosing action N. 

% Observation probabilities for action N. Lines correspond to the current
% state and columns to the observation. Recall that we are assuming a very
% simple observation model with only two observations: "None" and "Goal".

% Observation: None Goal

O(:, :, N)   = [??? ???;... % State:  1
                ??? ???;... % State:  2
                ??? ???;... % State:  3
                ??? ???;... % State:  4
                ??? ???;... % State:  5
                ??? ???;... % State:  6
                ??? ???;... % State:  7
                ??? ???;... % State:  8
                ??? ???;... % State:  9
                ??? ???;... % State: 10
                ??? ???;... % State: 11
                ??? ???;... % State: 12
                ??? ???;... % State: 13
                ??? ???;... % State: 14
                ??? ???;... % State: 15
                ??? ???];   % State: 16

% Observation probabilities for action S. Lines correspond to the current
% state and columns to the observation. 

% Observation: None Goal

O(:, :, S)   = [??? ???;... % State:  1
                ??? ???;... % State:  2
                ??? ???;... % State:  3
                ??? ???;... % State:  4
                ??? ???;... % State:  5
                ??? ???;... % State:  6
                ??? ???;... % State:  7
                ??? ???;... % State:  8
                ??? ???;... % State:  9
                ??? ???;... % State: 10
                ??? ???;... % State: 11
                ??? ???;... % State: 12
                ??? ???;... % State: 13
                ??? ???;... % State: 14
                ??? ???;... % State: 15
                ??? ???];   % State: 16

% Observation probabilities for action E. Lines correspond to the current
% state and columns to the observation. 

% Observation: None Goal

O(:, :, E)   = [??? ???;... % State:  1
                ??? ???;... % State:  2
                ??? ???;... % State:  3
                ??? ???;... % State:  4
                ??? ???;... % State:  5
                ??? ???;... % State:  6
                ??? ???;... % State:  7
                ??? ???;... % State:  8
                ??? ???;... % State:  9
                ??? ???;... % State: 10
                ??? ???;... % State: 11
                ??? ???;... % State: 12
                ??? ???;... % State: 13
                ??? ???;... % State: 14
                ??? ???;... % State: 15
                ??? ???];   % State: 16

% Observation probabilities for action W. Lines correspond to the current
% state and columns to the observation. 

% Observation: None Goal

O(:, :, W)   = [??? ???;... % State:  1
                ??? ???;... % State:  2
                ??? ???;... % State:  3
                ??? ???;... % State:  4
                ??? ???;... % State:  5
                ??? ???;... % State:  6
                ??? ???;... % State:  7
                ??? ???;... % State:  8
                ??? ???;... % State:  9
                ??? ???;... % State: 10
                ??? ???;... % State: 11
                ??? ???;... % State: 12
                ??? ???;... % State: 13
                ??? ???;... % State: 14
                ??? ???;... % State: 15
                ??? ???];   % State: 16

% Observation probabilities for action Noop. Lines correspond to the 
% current state and columns to the observation. 

% Observation: None Goal

O(:, :, Noop) = [??? ???;... % State:  1
                 ??? ???;... % State:  2
                 ??? ???;... % State:  3
                 ??? ???;... % State:  4
                 ??? ???;... % State:  5
                 ??? ???;... % State:  6
                 ??? ???;... % State:  7
                 ??? ???;... % State:  8
                 ??? ???;... % State:  9
                 ??? ???;... % State: 10
                 ??? ???;... % State: 11
                 ??? ???;... % State: 12
                 ??? ???;... % State: 13
                 ??? ???;... % State: 14
                 ??? ???;... % State: 15
                 ??? ???];   % State: 16

% Discount factor. We will take it always to be 0.95.
       
gmm = 0.95;

% We now create a structure that stores all the elements of the POMDP

M = struct('nS', nS, 'nA', nA, 'nZ', nZ, 'P', P, 'O', O, 'r', r, 'Gamma', gmm, 'Model', 2);