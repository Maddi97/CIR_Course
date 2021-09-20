function [A] = runPolicy(Mode, POMDP, B)
% function [A] = runPolicy(Mode, POMDP, B)
%
% This function chooses an action A given the current belief, using the 
% most likely state heuristic. 
%
% Mode is a control input that is used to initialize the function.
%
% (C) Francisco Melo, 2009 

init;

persistent Pol;

% Parse Mode

Mode = upper(Mode);

% If in initialization mode, compute policy

if (strcmp(Mode, 'INIT'))
   
    % We start by loading the underlying MDP model

    MDP = MDPLoad('stochastic');

    % We now compute the corresponding policy. The policy computed below is a
    % stochastic policy that assigns equal probability to all optimal actions.
    % This helps to avoid an undesirable cyclic behavior sometimes observed
    % with the MLS heuristic.

    Q = VI(MDP);

    Pol = (Q == repmat(max(Q, [], 2), 1, MDP.nA));  % This computes which 
                                                    % actions are optimal for 
                                                    % the underlying MDP

    Pol = Pol ./ repmat(sum(Pol, 2), 1, MDP.nA);    % This normalizes the 
                                                    % policy
    
	% This returns a dummy output
                                                    
	A = 0;
    
    return;
end

% If not, run policy

if (~strcmp(Mode, 'RUN'))
    error('Invalid mode in RunPolicy.');
end
                                                
% The matrix Pol computed above contains the optimal policy for the
% underlying MDP. You must now determine which state has largest
% probability given the current belief Bold.
%
% Suggestion: You may want to use the Matlab function "max". Type "help
% max" in the main Matlab window for usage information.

% -- REPLACE THIS LINE WITH YOUR CODE -- %

% Given the MLS, you will now choose an optimal actions in that state. If 
% more than one action is optimal, you should choose randomly between the
% several optimal actions.
%
% Suggestion: You may want to use the Matlab function "rand". Type "help
% rand" in the main Matlab window for usage information.
%
% Note: Since the selected action is one of the output arguments of the
% function, don't forget to assign it to the variable "A".

% -- REPLACE THIS LINE WITH YOUR CODE -- %