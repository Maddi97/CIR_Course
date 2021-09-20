function [] = evalPolicy(POMDP)
% function [] = evalPolicy(M)
%
% This function evaluates the MLS policy in the grid-world.
%
% (C) Francisco Melo, 2009 


init;

% Parse model

if (POMDP.Model ~= 2)
    error('Invalid model.');
end

if (POMDP.nS ~= 16)
    error('Invalid model.');
end
    
if (POMDP.nA ~= 5)
    error('Invalid model.');
end

if (POMDP.nZ ~= 2)
    error('Invalid model.');
end

% Run MC independent trials for the POMDP using the MLS heuristic

h = waitbar(0, 'Evaluating MLS policy, please wait...', 'Name', 'Running...');

runPolicy('init');

for Trial = 1:NTRIALS
    
    % Initialize POMDP

    S = 1;
    B = rand(POMDP.nS, 1);
    B = B/sum(B);
    
    % Initialize discount
    
    G = 1;
    
    % Initialize total disc. reward for current trial
    
    Rtot(Trial) = 0;
    
    % Run evaluation cycle

    for t = 1:30
        A = runPolicy('run', POMDP, B);            % Compute MLS action
        
        R = POMDP.r(S, A);                  % Determine reward

        p = cumsum(POMDP.P(S, :, A));       % Pick transition probs.
        S = min(find(p >= rand));           % Sample new state
        
        p = cumsum(POMDP.O(S, :, A));       % Pick observation probs.
        Z = min(find(p >= rand));           % Sample new observation
        
        B = beliefUpd(POMDP, B, A, Z);      % Update belief
        
        Rtot(Trial) = Rtot(Trial) + G * R;  % Update total disc. reward
        
        G = G * POMDP.Gamma;                % Update discount
        
        % If goal attained, stop trial
        
        if (R > 0)
            break;
        end
        
    end
    
    waitbar(Trial/NTRIALS, h);
end

close(h);

% Printout statistics

fprintf('\n\nPOMDP MLS EVALUATION:\n');
fprintf('=====================\n\n');

fprintf('Average total discounted reward per episode: %.3f +- %.3f.\n', mean(Rtot), std(Rtot));
fprintf('Percentage of successful trials: %.3f.\n', sum(Rtot > 0)/NTRIALS);

% To compare with the POMDP, we compute the MDP optimal policy

M = struct('nS', POMDP.nS, 'nA', POMDP.nA, 'P', POMDP.P, 'r', POMDP.r, 'Gamma', POMDP.Gamma, 'Model', 2);

[Q, P] = VI(M); % Compute optimal policy for MDP

% Run MC independent trials for the MDP

h = waitbar(0, 'Evaluating optimal MDP policy, please wait...', 'Name', 'Running...');

for Trial = 1:NTRIALS
    
    % Initialize MDP

    S = 1;

    % Initialize discount
    
    G = 1;
    
    % Initialize total disc. reward for current trial
    
    Rtot(Trial) = 0;
    
    % Run evaluation cycle

    for t = 1:30
        A = P(S);                           % Choose optimal action
            
        R = M.r(S, A);                    % Determine reward

        p = cumsum(M.P(S, :, A));         % Pick transition probs.
        S = min(find(p >= rand));           % Sample new state
        
        Rtot(Trial) = Rtot(Trial) + G * R;  % Update total disc. reward
        
        G = G * M.Gamma;                  % Update discount
        
        % If goal attained, stop trial
        
        if (R > 0)
            break;
        end
        
    end
    
    waitbar(Trial/NTRIALS, h);
end

close(h);

% Printout statistics

fprintf('\nMDP OPTIMAL POLICY EVALUATION:\n');
fprintf('==============================\n\n');

fprintf('Average total discounted reward per episode: %.3f +- %.3f.\n', mean(Rtot), std(Rtot));
fprintf('Percentage of successful trials: %.3f.\n', sum(Rtot > 0)/NTRIALS);

