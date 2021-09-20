function [V] = VI(MDP, Pol)
% function [Q] = VI(M, Pol)
%
% This function computes the value-function associated with policy Pol for 
% the MDP M. M is a structure with the following fields:
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

% Initialize V vector

V = zeros(MDP.nS, 1);

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
    
    % Perform VI update
    
    % -- REPLACE THIS LINE WITH YOUR CODE -- %
    
    Vnew = ???;
        
    if (norm(Vnew - V) < ERR)
        Quit = 1;
    end
    
    V = Vnew;
end

t = cputime - t;

if (ECHO)
    fprintf(1, 'Done.\n');
    fprintf(1, 'Total running time: %.2f seconds.\n', t);
    fprintf(1, 'Total iterations:   %i.\n', iter);
    fprintf(1, 'Average iteration time: %.3f seconds.\n\n', t/iter);
end


