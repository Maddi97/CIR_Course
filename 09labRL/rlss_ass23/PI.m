function [Pol] = PI(MDP)
% function [Pol] = PI(M)
%
% This function computes the optimal policy for the MDP M. M is a
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

% Initialize policy

Pol = ???;
Q = zeros(MDP.nS, MDP.nA);

% Initialize PI cycle

Quit = 0;
iter = 0;

% Run VI cycle

if (ECHO)
    fprintf(1, 'Running policy iteration... ');
end

t = cputime;

while (~Quit)
    iter = iter + 1;
    
    % Perform PI update
    
    % -- REPLACE THIS LINE WITH YOUR CODE -- %
    
    Pol = ???;          % Updated policy
    Qnew = ???;         % Q-function for the updated policy
    
    % Stopping condition in terms of corresponding Q-functions
    
    if (norm(Qnew - Q) == 0)
        Quit = 1;
    end
    
    Q = Qnew;
end

t = cputime - t;

if (ECHO)
    fprintf(1, 'Done.\n');
    fprintf(1, 'Total running time: %.2f seconds.\n', t);
    fprintf(1, 'Total iterations:   %i.\n', iter);
    fprintf(1, 'Average iteration time: %.3f seconds.\n\n', t/iter);
end


