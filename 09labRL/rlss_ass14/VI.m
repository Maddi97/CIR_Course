function [Q, varargout] = VI(MDP, varargin)
% function [Q, P] = VI(M)
%
% This function computes the optimal Q-function for the MDP M. M is a
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

% Rearrange dimensions of the transition and reward matrices for 
% computational speed

P = permute(MDP.P, [1, 3, 2]);
P = reshape(P, MDP.nS * MDP.nA, MDP.nS);

R = reshape(MDP.r, MDP.nS * MDP.nA, 1);

% Initialize Q-matrix

Q = zeros(MDP.nS, MDP.nA);

% Policy evaluation vs. policy optimization 

if (nargin > 1)
    Pol  = varargin{1};
    Eval = 1;
else
    Pol  = ones(MDP.nS, MDP.nA)/MDP.nA;
    Eval = 0;
end

% Initialize VI cycle

Quit = 0;
iter = 0;

% Run VI cycle

if (ECHO)
    fprintf(1, 'Running value iteration... ');
end

t = cputime;

while (~Quit)
    iter = iter + 1;
    
    % Compute maximum or run evaluated policy
    
    Qmax = sum(Pol.*Q, 2);
    
    % Perform VI update
    
    Qnew = reshape(R + MDP.Gamma * P * Qmax, MDP.nS, MDP.nA);
    
    if (~Eval)
        Pol = Q == repmat(max(Q, [], 2), 1, MDP.nA);
        Pol = Pol ./ repmat(sum(Pol, 2), 1, MDP.nA);
    end
    
    if (norm(Qnew - Q) < ERR)
        Quit = 1;
    end
    
    Q = Qnew;
end

t = cputime - t;

if (nargout > 1)
    [V, Pol] = max(Q, [], 2);
    varargout{1} = Pol;
end

if (ECHO)
    fprintf(1, 'Done.\n');
    fprintf(1, 'Total running time: %.2f seconds.\n', t);
    fprintf(1, 'Total iterations:   %i.\n', iter);
    fprintf(1, 'Average iteration time: %.3f seconds.\n\n', t/iter);
end


