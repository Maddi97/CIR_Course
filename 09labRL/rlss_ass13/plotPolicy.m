function [] = plotPolicy(MDP)
% function [] = PlotPolicy(M)
%
% This function visually depicts the optimal policy for the MDP M.
%
% (C) Francisco Melo, 2009 

init;

% Parse model

if (MDP.Model ~= 5)
    error('Invalid model.');
end

if (mod(MDP.nS, 16))
    error('Invalid model.');
end
    
if (MDP.nA ~= 5)
    error('Invalid model.');
end

% Estimate number of subwindows

nS = MDP.nS;

nP = nS/16;

nX = sqrt(nP);
nY = sqrt(nP);

if (nX - floor(nX) ~= 0)
    nX = floor(nX + 1);
end
    
if (nY - floor(nY) > 0.5)
    nY = floor(nY + 1);
end

% Compute MDP solution

[Q, Pol] = VI(MDP);

% Initialize quiver domain

[Y, X] = ind2sub([4 4], 1:16);

% Create plot window

f = figure(1);
clf(f);

% Set window name

set(f, 'MenuBar', 'none');
set(f, 'Name', 'Optimal policy');

% Create subwindows

for i = 1:nP
    
    subplot(nX, nY, i);

    % Grid box

    Box(i) = plot([0.5 4.5 4.5 0.5 0.5], [0.5 0.5 4.5 4.5 0.5], 'k');

    set(Box(i), 'LineWidth', 3);

    % Clear axis

    a = get(Box(i), 'Parent');                 % Get axis handle
    set(a, 'Visible', 'off');               % Clear axis
    set(a, 'PlotBoxAspectRatio',[1 1 1]);   % Set square axis

    hold on;

    % Grid

    Grid(i) = plot([1.5 1.5 2.5 2.5 3.5 3.5 4.5 4.5 0.5 0.5 4.5 4.5 0.5 0.5 1.5], ...
                [0.5 4.5 4.5 0.5 0.5 4.5 4.5 3.5 3.5 2.5 2.5 1.5 1.5 0.5 0.5], 'k');

	Idx = (i - 1) * 16 + (1:16);

    U = 0.5 * ACTVEC(Pol(Idx), 1)';
    V = 0.5 * ACTVEC(Pol(Idx), 2)';

    P(i) = quiver(X, 5 - Y, U, V);
end
