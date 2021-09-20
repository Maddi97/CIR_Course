function [] = plotPolicy(MDP)
% function [] = PlotPolicy(M)
%
% This function visually depicts the optimal policy for the MDP M.
%
% (C) Francisco Melo, 2009 


init;

% Parse model

if (MDP.Model < 1 | MDP.Model > 4)
    error('Invalid model.');
end

if (MDP.Model == 3 & MDP.nS ~= 15)
    error('Invalid model.');
end
    
if (MDP.Model ~= 3 & MDP.nS ~= 16)
    error('Invalid model.');
end

if (MDP.nA ~= 5)
    error('Invalid model.');
end

% Create plot window

f = figure(1);
clf(f);

% Set window name

set(f, 'MenuBar', 'none');
set(f, 'Name', 'Optimal policy');

% Grid box

Box = plot([0.5 4.5 4.5 0.5 0.5], [0.5 0.5 4.5 4.5 0.5], 'k');

set(Box, 'LineWidth', 3);

% Clear axis

a = get(Box, 'Parent');                 % Get axis handle
set(a, 'Visible', 'off');               % Clear axis
set(a, 'PlotBoxAspectRatio',[1 1 1]);   % Set square axis

hold on;

% Grid

if (MDP.Model == 3)
    Obst = fill([2.5 3.5 3.5 2.5 2.5], [2.5 2.5 3.5 3.5 2.5], 'k');
end
    
if (MDP.Model == 4)
    Obst = fill([2.5 3.5 3.5 2.5 2.5], [2.5 2.5 3.5 3.5 2.5], 'r');
end

Grid = plot([1.5 1.5 2.5 2.5 3.5 3.5 4.5 4.5 0.5 0.5 4.5 4.5 0.5 0.5 1.5], ...
            [0.5 4.5 4.5 0.5 0.5 4.5 4.5 3.5 3.5 2.5 2.5 1.5 1.5 0.5 0.5], 'k');

        
% MDP solution

Pol = PI(MDP);

if (MDP.Model == 3)
    Pol = [Pol(1:9); 5; Pol(10:15)];
end

[Y, X] = ind2sub([4 4], 1:16);
U = 0.5 * ACTVEC(Pol, 1)';
V = 0.5 * ACTVEC(Pol, 2)';

Pol = quiver(X, 5 - Y, U, V);


    
    
            