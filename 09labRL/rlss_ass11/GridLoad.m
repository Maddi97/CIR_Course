function [M] = GridLoad()
% function [M] = GridLoad()
%
% This functions loads the MDP model for the simple grid world.
%
% To define the MDP model, replace the "???" all over the file by the 
% proper values.
%
% (C) Francisco Melo, 2009 

init;

% Number of states of the robot:

nS = ???;

% Number of actions available to the robot:

nA = ???;

% Transition probabilities matrix. Unlike the notation used in the notes, 
% where the transition probabilities are denoted as P(x,a,y), for
% practical purposes we will code them as P(x,y,a). Therefore, for each of
% the 5 actions fill in the corresponding transition probability matrix.
% For example, P(2, 1, N) represents the probability of moving to state 1
% from state 2 when choosing action N. 

% Transition probabilities for action N. Lines correspond to the "initial"
% state and columns to the "final" state.

% Final state:  1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16             

P(:, :, N) = [1.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0;... % Initial state:  1
              1.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0;... % Initial state:  2
              0.0 1.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0;... % Initial state:  3
              0.0 0.0 1.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0;... % Initial state:  4
              0.0 0.0 0.0 0.0 1.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0;... % Initial state:  5
              0.0 0.0 0.0 0.0 1.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0;... % Initial state:  6
              0.0 0.0 0.0 0.0 0.0 1.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0;... % Initial state:  7
              0.0 0.0 0.0 0.0 0.0 0.0 1.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0;... % Initial state:  8
              0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 1.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0;... % Initial state:  9
              0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 1.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0;... % Initial state: 10
              0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 1.0 0.0 0.0 0.0 0.0 0.0 0.0;... % Initial state: 11
              0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 1.0 0.0 0.0 0.0 0.0 0.0;... % Initial state: 12
              0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 1.0 0.0 0.0 0.0;... % Initial state: 13
              0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 1.0 0.0 0.0 0.0;... % Initial state: 14
              0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 1.0 0.0 0.0;... % Initial state: 15
              0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 1.0 0.0];   % Initial state: 16

% Transition probabilities for action S. Lines correspond to the "initial"
% state and columns to the "final" state.

% Final state:  1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16             

P(:, :, S) = [??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state:  1
              ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state:  2
              ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state:  3
              ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state:  4
              ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state:  5
              ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state:  6
              ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state:  7
              ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state:  8
              ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state:  9
              ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state: 10
              ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state: 11
              ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state: 12
              ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state: 13
              ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state: 14
              ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state: 15
              ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???];   % Initial state: 16

% Transition probabilities for action E. Lines correspond to the "initial"
% state and columns to the "final" state.

% Final state:  1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16             

P(:, :, E) = [??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state:  1
              ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state:  2
              ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state:  3
              ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state:  4
              ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state:  5
              ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state:  6
              ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state:  7
              ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state:  8
              ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state:  9
              ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state: 10
              ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state: 11
              ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state: 12
              ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state: 13
              ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state: 14
              ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state: 15
              ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???];   % Initial state: 16
          
% Transition probabilities for action W. Lines correspond to the "initial"
% state and columns to the "final" state.

% Final state:  1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16             

P(:, :, W) = [??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state:  1
              ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state:  2
              ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state:  3
              ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state:  4
              ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state:  5
              ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state:  6
              ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state:  7
              ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state:  8
              ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state:  9
              ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state: 10
              ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state: 11
              ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state: 12
              ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state: 13
              ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state: 14
              ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state: 15
              ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???];   % Initial state: 16

% Transition probabilities for action Noop. Lines correspond to the "initial"
% state and columns to the "final" state.

% Final state:     1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16             

P(:, :, Noop) = [??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state:  1
                 ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state:  2
                 ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state:  3
                 ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state:  4
                 ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state:  5
                 ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state:  6
                 ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state:  7
                 ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state:  8
                 ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state:  9
                 ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state: 10
                 ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state: 11
                 ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state: 12
                 ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state: 13
                 ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state: 14
                 ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???;... % Initial state: 15
                 ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???];   % Initial state: 16
             
% Reward matrix. Recall that the reward function is a mapping r(x,a), that
% can be represented as a matrix. Therefore r(2, 1) represents the reward
% of choosing action 1 in state 2.

% Action:   N    S    E    W  Noop

r(:, :) = [???  ???  ???  ???  ???;... % State:  1
           ???  ???  ???  ???  ???;... % State:  2
           ???  ???  ???  ???  ???;... % State:  3
           ???  ???  ???  ???  ???;... % State:  4
           ???  ???  ???  ???  ???;... % State:  5
           ???  ???  ???  ???  ???;... % State:  6
           ???  ???  ???  ???  ???;... % State:  7
           ???  ???  ???  ???  ???;... % State:  8
           ???  ???  ???  ???  ???;... % State:  9
           ???  ???  ???  ???  ???;... % State: 10
           ???  ???  ???  ???  ???;... % State: 11
           ???  ???  ???  ???  ???;... % State: 12
           ???  ???  ???  ???  ???;... % State: 13
           ???  ???  ???  ???  ???;... % State: 14
           ???  ???  ???  ???  ???;... % State: 15
           ???  ???  ???  ???  ???];   % State: 16

% Discount factor. We will take it always to be 0.95.
       
gmm = 0.95;

% We now create a structure that stores all the elements of the MDP

M = struct('nS', nS, 'nA', nA, 'P', P, 'r', r, 'Gamma', gmm, 'Model', 1);