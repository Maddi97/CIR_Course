function [R] = IRL(MDP, Pol)
% function [R] = IRL(M, Pol)
%
% This function recovers a reward function given the MDP M and a policy
% Pol. This reward function R is such that Pol is the optimal policy for R.
% The algorithm implemented here is based on the paper by Andrew Ng (Ng &
% Russel, 2000). M is a structure with the following fields:
%
% . nS    : Corresponds to the number of states of the MDP;
% . nA    : Corresponds to the number of actions of the MDP;
% . P     : A nS x nS x nA matrix containing the transition probabilities 
% for the MDP;
% . r     : A nS x nA matrix defining the reward function.
% . Gamma : The discount factor
%

% In this function we implement the IRL algorithm by Ng and Russel. You can 
% implement the algorithm by yourself or, if you feel less confident on
% your Matlab skills, you can follow the instructions below. In the overal
% formulation, we now take r to depend only on x.
%
% (C) Francisco Melo, 2009 

init;

% This first block ensures that the policy is written in the proper
% format. 

if (size(Pol, 2) == 1) % Checks whether the dimension is adequate
    
    % Compile action indices
    
    Idx = (1:MDP.nS)';
    Idx = sub2ind([MDP.nS, MDP.nA], Idx, Pol);

    % Rewrite policy in the adequate format
    
    Pol = zeros(MDP.nS, MDP.nA);
    Pol(Idx) = 1;
end

% We will now formulate the IRL problem as a linear program. The linear
% program, as seen in the lab notes, has the form
%
% maximize 1' sum_a (Ppi - Pa) * inv(I - Gamma * Ppi) R + Lbd R
%
% subject to     (Ppi - Pa) * inv(I - Gamma * Ppi) R >= 0, for all a
%                R >= 0
%                R <= 1
%
% where Ppi denotes the transition probability matrix for the chain induced
% by the policy Pol.

% We start by writing down the given policy as an operator, henceforth
% denoted as PI.
%
% We first compile the indices and then fill in the probabilities.

Idx = sub2ind([MDP.nS, MDP.nS * MDP.nA], repmat((1:MDP.nS),1,MDP.nA), 1:MDP.nS * MDP.nA);

PI  = zeros(MDP.nS, MDP.nS * MDP.nA);
PI(Idx) = Pol;

% Next, we compute the matrix Ppi, corresponding to the transition
% probabilities for the current policy. Given the operator PI, this is very
% easy and requires only adjusting the dimensions of MDP.P.

Ppi = reshape(permute(MDP.P, [1 3 2]), MDP.nS * MDP.nA, MDP.nS);
Ppi = PI * Ppi;

% Finally, we compute the inverse unnormalized transition matrix for the 
% Gamma resolvent associated with Pol. This corresponds to the factor 
% inv(I - Gamma Ppi) in the LP expressions.

K = inv(eye(MDP.nS) - MDP.Gamma * Ppi);

% We now fill in the linear program. Linear programming in Matlab is
% implemented through the function "linprog". The syntax for linprog that
% we are interested in is
%
% [X, Val, Out] = linprog(f, A, b)
%
% and solves the linear problem
%
% min   f' * X
% s.t.  A   * X <= b
%
% In the space provided below, fill in the elements for the linear program.

f = ???;

A = ???;
b = ???;

% Solve linear program

[R, Val, Out] = linprog(f, A, b);

% This verifies if all went well with the linear program

if (Out < 1)
    fprintf('LinProg exited with code %i.\n', Out);
else
    R = repmat(R, 1, MDP.nA);     % Reshape solution 
end
