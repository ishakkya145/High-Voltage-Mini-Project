%% task2_2pc_score_scatter.m
% Task 2: PC1 vs PC2 scatter plot
% Purpose: Visualize the dataset in 2D PCA space.

clear; clc; close all;

T = readtable('Group03_Task2_DataSheet.xlsx');

% Column 1 = Sample number
% Columns 2 to 23 = 22 FDS features
X = T{:, 2:23};

% Label column
if any(strcmpi(T.Properties.VariableNames, 'Class'))
    y = categorical(T.Class);
else
    y = categorical(T{:, end});
end

% Log transform and standardize
Xlog = log10(X);
Xstd = zscore(Xlog);

% PCA
[coeff, score, latent, tsquared, explained] = pca(Xstd);

% Output folder
outputFolder = 'task2_outputs';
if ~exist(outputFolder, 'dir')
    mkdir(outputFolder);
end

% Plot PC1 vs PC2
fig = figure('Color', 'w');
set(fig, 'Position', [100 100 900 600]);

colors = [0 0.4470 0.7410; ...
          0.8500 0.3250 0.0980; ...
          0.4660 0.6740 0.1880];

gscatter(score(:,1), score(:,2), y, colors, 'o', 8, 'on');

grid on;
box on;

xlabel(sprintf('PC_1 (%.2f%%)', explained(1)));
ylabel(sprintf('PC_2 (%.2f%%)', explained(2)));
title('PCA Score Plot Using First Two Principal Components');

legend('Location', 'best');
set(gca, 'FontSize', 11);

% Save figure
pngFile = fullfile(outputFolder, 'task2_2pc_score_scatter.png');
pdfFile = fullfile(outputFolder, 'task2_2pc_score_scatter.pdf');

exportgraphics(fig, pngFile, 'Resolution', 300);
exportgraphics(fig, pdfFile, 'ContentType', 'vector');

fprintf('Cumulative variance using first 2 PCs = %.2f%%\n', sum(explained(1:2)));

disp('2-PC score scatter plot saved successfully.');
disp(['PNG: ', pngFile]);
disp(['PDF: ', pdfFile]);
