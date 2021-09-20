function [M] = MDPLoad(Goals)
% function [M] = MDPLoad(Goals)
%
% This functions automates the creation of the MDP model for any variations 
% of the simple grid world. The parameter "Goals" defines the goal of the
% model to be loaded. It takes the form of a row-vector that contains the 
% successive via-points for the robot to visit.
%
% Your goal is to automate the creation of an MDP structure, depending on 
% the via points provided by the user to the function. This structure 
% should be in all ways similar to the ones used in the previous
% assignment.
%
% You will find that the comments along the file should help you in 
% implementing this function.
%
% (C) Francisco Melo, 2009 

init;

% We start by defining the parameters for the simple gridworld problem. You
% will be able to use these throughout the file. To this purpose, we create
% an auxiliary MDP model from the file you created in assignment 1.1.

Maux  = GridLoad;

nSaux = Maux.nS;
nAaux = Maux.nA;
Paux  = Maux.P;

clear Maux;

% STEP 1: Parse the "Goals" variable, ensuring that the provided vector of
% via-points is legal. Assume that the states of the original problem are
% numbered from 1 to nSaux, and that the via-points are provided according
% to this numbering.
%
% Suggestion: You may want to use the Matlab function "any". To check the
% syntax and purpose of this function, type "help any" in the main Matlab
% window.
%
% Also, for future reference, here is a short list of Matlab operators:
%
%  Relational operators:
%     Equal                             ==     
%     Not equal                         ~=     
%     Less than                          <      
%     Greater than                       >      
%     Less than or equal                <=     
%     Greater than or equal             >=     
%  
%   Logical operators:
%     Element-wise logical AND           &      
%     Element-wise logical OR            |      
%     Logical NOT                        ~      
%
% Note that these operators work in an element-wise manner.

% -- REPLACE THIS LINE WITH YOUR CODE -- %

% STEP 2: Given that all via-points correspond to legal states, you can now
% proceed by defining the augmented state-space for the problem at hand. To
% this, verify that n via-points roughly require the state-space to be
% "replicated" n times. Therefore, you will need to compute the dimension 
% of this augmented state-space. 
%
% For practical reasons, we will limit the number of via-points to 100. 
% Don't forget to ensure that the number of via-points is within this 
% limit.
%
% Suggestion: You may want to use the Matlab function "length". To check 
% the syntax and purpose of this function, type "help length" in the main 
% Matlab window.

% -- REPLACE THIS LINE WITH YOUR CODE -- %

% STEP 3: Compute the number of states in the augmented state-space.

% -- nS = ???;

% STEP 4: Compute the number of actions in the new MDP.

% -- nA = ???;

% STEP 5: Automate the creation of the transition matrix. This is the 
% critical step, so you may want to take your time. In the end, you should
% end up with a nS x nS x nA stochastic matrix (i.e., a matrix P in which
% each row P(i, :, j) adds to 1.
%
% For your reference, you may want to check the commands "floor" and "mod".

P = zeros(nS, nS, nA);

% -- REPLACE THIS LINE WITH YOUR CODE -- %

% STEP 6: Automate the creation of the reward matrix. Note that, in your
% augmented state-space, the robot only needs to reach the final state.

r = zeros(nS, nA);

% -- REPLACE THIS LINE WITH YOUR CODE -- %

% Discount factor. We will take it always to be 0.95.
       
gmm = 0.95;

% We now create a structure that stores all the elements of the MDP

M = struct('nS', nS, 'nA', nA, 'P', P, 'r', r, 'Gamma', gmm, 'Model', 5);