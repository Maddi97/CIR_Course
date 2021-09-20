function [R] = MLIRL(MDP, D)
% function [R] = MLIRL(M, D)
%
% This function recovers a reward function given the MDP M and a
% demonstration D. This reward function R is such that Pol is the optimal 
% policy for R. The algorithm implemented here is a Maximum Likelihood 
% approach to IRL. M is a structure with the following fields:
%
% . nS    : Corresponds to the number of states of the MDP;
% . nA    : Corresponds to the number of actions of the MDP;
% . P     : A nS x nS x nA matrix containing the transition probabilities 
% for the MDP;
% . r     : A nS x nA matrix defining the reward function.
% . Gamma : The discount factor
%
% The demonstration D is a matrix with as many lines as samples and two
% columns. Each line is a demonstrated state-action pair.
%
% (C) Francisco Melo, 2009 

init;

% Given the demonstration vector D, compute the maximum likelihood estimate
% for the policy Pol.

% -- REPLACE THIS LINE WITH YOUR CODE -- %

% Compute the Q-function whose Boltzmann policy is the maximum likelihood 
% policy computed above. There are many such Q-functions, pick one of your
% liking.

% -- REPLACE THIS LINE WITH YOUR CODE -- %

% Given the Q-function estimated above, use the MDP information available
% in the model M to compute the reward function R. 

% -- REPLACE THIS LINE WITH YOUR CODE -- %