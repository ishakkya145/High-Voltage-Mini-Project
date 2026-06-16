%% task2_05_pc1_pc2_pc3_scatter.m
% Task 2: PC1-PC2-PC3 3D scatter plot
% Purpose: Visualize the selected 3 principal components.

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

% Plot 3D PCA scatter
fig = figure('Color', 'w');
set(fig, 'Position', [100 100 900 650]);

classes = categories(y);
colors = [0 0.4470 0.7410; 
          0.8500 0.3250 0.0980; 
          0.4660 0.6740 0.1880];

hold on;
for i = 1:numel(classes)
    idx = y == classes{i};
    scatter3(score(idx,1), score(idx,2), score(idx,3), ...
        55, colors(i,:), 'filled', 'MarkerEdgeColor', 'k');
end

grid on;
box on;
view(45, 25);

xlabel(sprintf('PC_1 (%.2f%%)', explained(1)));
ylabel(sprintf('PC_2 (%.2f%%)', explained(2)));
zlabel(sprintf('PC_3 (%.2f%%)', explained(3)));
title('PCA Score Plot Using Selected 3 Principal Components');

legend(classes, 'Location', 'best');
set(gca, 'FontSize', 11);

% Save figure
pngFile = fullfile(outputFolder, 'task2_05_pc1_pc2_pc3_scatter.png');
pdfFile = fullfile(outputFolder, 'task2_05_pc1_pc2_pc3_scatter.pdf');

exportgraphics(fig, pngFile, 'Resolution', 300);
exportgraphics(fig, pdfFile, 'ContentType', 'vector');

disp('PC1-PC2-PC3 scatter plot saved successfully.');
disp(['PNG: ', pngFile]);
disp(['PDF: ', pdfFile]);
