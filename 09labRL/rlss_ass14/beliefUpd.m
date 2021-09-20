function [Bnew] = beliefUpd(POMDP, Bold, A, Z)
% function [Bnew] = beliefUpd(POMDP, Bold, A, Z)
%
% This function updates the belief for the robot after taking action A and
% making observation Z. 
%
% Your goal is to implement the belief update equation you can find in the
% lab notes.
%
% (C) Francisco Melo, 2009 

init;

% To update the belief vector, we start by picking the relevant elements
% from the POMDP model. In particular, we select the transition probability
% matrix for the current action and the observation vector for the current
% action-observation.

P = POMDP.P(:, :, A);   % This is a nS x nS matrix
O = POMDP.O(:, Z, A);   % This is a nX x 1  vector

% You will now compute the numerator of the belief update. This can be
% achieved with a simple operation.
%
% Suggestion: You may want to use the element-wise product, which in Matlab 
% corresponds to the operator ".*" For help with this operator, type 
% "help .*" in the main Matlab window. 

% -- REPLACE THIS LINE WITH YOUR CODE -- %

% The denominator in the belief update is simply a normalization constant
% for the belief vector, since the latter corresponds to a probability 
% distribution over the state-space. In order to compute the final belief,
% you now need only to normalize the vector computed in the previous step.
%
% Note: Since the updated belief is the output argument of the function, 
% don't forget to assign it to the variable "Bnew".

% -- REPLACE THIS LINE WITH YOUR CODE -- %
