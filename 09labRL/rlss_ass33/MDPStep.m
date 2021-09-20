function [Xnew, Rnew] = MDPStep(MDP, X, A)
% function [Xnew, Rnew] = MDPStep(M, X, A)
% 
% This function executes a step on the MDP M given current state X and
% action A. M is a structure with the following fields:
%
% . nS    : Corresponds to the number of states of the MDP;
% . nA    : Corresponds to the number of actions of the MDP;
% . P     : A nS x nS x nA matrix containing the transition probabilities 
% for the MDP;
% . r     : A nS x nA matrix defining the reward function.
% . Gamma : The discount factor
%
% (C) Francisco Melo, 2009 

nI = length(X);

% Batch processing of reward vector

Idx = sub2ind([MDP.nS, MDP.nA], X, A);              % Index computation

Rnew = MDP.r(Idx);                                  % Reward computation

% Batch processing of new states

X = reshape(repmat(X', MDP.nS, 1), nI * MDP.nS, 1);
A = reshape(repmat(A', MDP.nS, 1), nI * MDP.nS, 1);
Y = repmat((1:16)', nI, 1);

Idx = sub2ind([MDP.nS, MDP.nS, MDP.nA], X, Y, A);   % Index computation

P = cumsum(reshape(MDP.P(Idx), MDP.nS, nI)', 2);    % Trans. matrix comp.

[V, Xnew] = max(P >= repmat(rand(nI, 1), 1, MDP.nS), [], 2);    % New state
