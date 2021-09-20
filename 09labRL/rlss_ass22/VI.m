function [Q, Pol] = VI(MDP)
% function [Q, Pol] = VI(M)
%
% This function computes the optimal Q-function and corresponding optimal 
% policy for the MDP M. M is a structure with the following fields:
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

% Initialize Q-matrix

Q = zeros(MDP.nS, MDP.nA);

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
    
    % Perform VI update in terms of Q-function
    
    % -- REPLACE THIS LINE WITH YOUR CODE -- %
    
    Qnew = ???;
    
    if (norm(Qnew - Q) < ERR)
        Quit = 1;
    end
    
    Q = Qnew;
end

t = cputime - t;

[V, Pol] = max(Q, [], 2);

if (ECHO)
    fprintf(1, 'Done.\n');
    fprintf(1, 'Total running time: %.2f seconds.\n', t);
    fprintf(1, 'Total iterations:   %i.\n', iter);
    fprintf(1, 'Average iteration time: %.3f seconds.\n\n', t/iter);
end


