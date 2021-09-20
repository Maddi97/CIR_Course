function [V] = TDLearning(MDP, Pol, Lbd)
% function [V] = TDLearning(M, Pol, lambda)
%
% This function computes the value function associated with policy Pol for 
% the MDP M using TD-learning. M is a structure with the following fields:
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

% Initialize the MDP. Since TD-learning relies on transitions sampled from 
% the actual MDP, use this space for any initialization of the MDP.

% -- REPLACE THIS LINE WITH YOUR CODE -- %

% Initialize learning cycle. Use this space to initialize any variables
% that you may use during the learning cycle. Although Matlab can augment
% matrices as needed, for speed purposes it is advisable to allocate all
% needed variables beforehand.

% -- REPLACE THIS LINE WITH YOUR CODE -- %

% Run learning cycle

h = waitbar(0, 'Running, please wait...', 'Name', 'TD-Learning');

t = cputime;

for iter = 1:NITER
    
    % Use this space to implement the TD(Lbd) update. If you need to 
    % simulate a transition in the MDP, you can use the function MDPstep. 
    % For usage, type "help MDPstep" in the Matlab main window.
    
    % -- REPLACE THIS LINE WITH YOUR CODE -- %
    
    waitbar(iter/NITER, h);
    
end

t = cputime - t;

close(h);
    
% Recall that the function returns the value function stored in the
% variable V, so do not forget to assign the result of your algorithm to
% that variable. If needed, you can do this below.

% -- REPLACE THIS LINE WITH YOUR CODE -- %

if (ECHO)
    fprintf(1, 'Done.\n');
    fprintf(1, 'Total running time: %.2f seconds.\n', t);
    fprintf(1, 'Total iterations:   %i.\n', NITER);
    fprintf(1, 'Average iteration time: %.3f seconds.\n\n', t/NITER);
end
