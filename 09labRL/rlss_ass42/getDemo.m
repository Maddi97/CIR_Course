function [D] = getDemo(MDP)
% function [D] = getDemo(M)
%
% This function generates a demo for the MDP M using a perturbed optimal 
% policy. M is a 
% structure with the following fields:
%
% . nS    : Corresponds to the number of states of the MDP;
% . nA    : Corresponds to the number of actions of the MDP;
% . P     : A nS x nS x nA matrix containing the transition probabilities 
% for the MDP;
% . r     : A nS x nA matrix defining the reward function.
% . Gamma : The discount factor
%
% (C) Francisco Melo, 2009 


init;

% Compute demo length

nD = 10 * MDP.nS * MDP.nA;

% Compute optimal Q-function

Q = VI(MDP);
Q = Q / max(max(Q));

% Compute perturbed policy

expQ = exp(CONF * Q);
sumQ = sum(expQ, 2);

Pol  = expQ ./ repmat(sumQ, 1, MDP.nA);

% Sample states

X = ceil(MDP.nS * rand(nD, 1));

% Sample actions

A = cumsum(Pol(X, :), 2);
A = (A >= repmat(rand(nD, 1), 1, MDP.nA));

[tmp, A] = max(A, [], 2);

% Return demo

D = [X, A];


