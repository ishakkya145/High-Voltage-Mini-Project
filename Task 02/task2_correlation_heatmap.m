%% task2_correlation_heatmap.m
% Correlation heatmap of 22 FDS features

clear; clc; close all;

% Read Group 03 dataset
T = readtable('Group03_Task2_DataSheet.xlsx');

% First 22 columns are FDS features
X = T{:, 1:22};

% Log transform because FDS tan(delta) values vary over a wide range
Xlog = log10(X);

% Correlation matrix
R = corrcoef(Xlog);

% Output folder
outputFolder = 'task2_outputs';
if ~exist(outputFolder, 'dir')
    mkdir(outputFolder);
end

% Red-orange-yellow colormap
% Low correlation  -> light yellow
% Medium           -> orange
% High correlation -> dark red
n = 256;
yellow = [1.00, 1.00, 0.75];
orange = [1.00, 0.55, 0.00];
red    = [0.70, 0.00, 0.00];

cmap1 = [linspace(yellow(1), orange(1), n/2)', ...
         linspace(yellow(2), orange(2), n/2)', ...
         linspace(yellow(3), orange(3), n/2)'];

cmap2 = [linspace(orange(1), red(1), n/2)', ...
         linspace(orange(2), red(2), n/2)', ...
         linspace(orange(3), red(3), n/2)'];

customMap = [cmap1; cmap2];

% Plot heatmap
fig = figure('Color', 'w');
set(fig, 'Position', [100 100 1500 800]);

h = heatmap(R);
h.Title = 'Correlation Heatmap of 22 FDS Features';
h.XLabel = 'FDS Feature Number';
h.YLabel = 'FDS Feature Number';
h.Colormap = customMap;
h.ColorLimits = [0 1];
h.CellLabelFormat = '%.4g';
h.FontSize = 10;
h.GridVisible = 'on';

% Save as PNG and PDF
pngFile = fullfile(outputFolder, 'task2_correlation_heatmap.png');
pdfFile = fullfile(outputFolder, 'task2_correlation_heatmap.pdf');

exportgraphics(fig, pngFile, 'Resolution', 300);
exportgraphics(fig, pdfFile, 'ContentType', 'vector');

disp('Correlation heatmap saved successfully.');
disp(['PNG: ', pngFile]);
disp(['PDF: ', pdfFile]);
