%% task2_pca_scree_plot.m
% PCA scree plot for Group 03 FDS dataset

clear; clc; close all;

% Read Group 03 dataset
T = readtable('Group03_Task2_DataSheet.xlsx');

% Use only 22 FDS feature columns
% Column 1 = Sample No.
% Columns 2 to 23 = FDS tan(delta) features
X = T{:, 2:23};

% Log transform because FDS values vary over a wide range
Xlog = log10(X);

% Standardize before PCA
Xstd = zscore(Xlog);

% Apply PCA
[coeff, score, latent, tsquared, explained] = pca(Xstd);

% Cumulative explained variance
cumExplained = cumsum(explained);

% Output folder
outputFolder = 'task2_outputs';
if ~exist(outputFolder, 'dir')
    mkdir(outputFolder);
end

% Plot scree plot
fig = figure('Color', 'w');
set(fig, 'Position', [100 100 900 600]);

bar(explained, 'FaceColor', [0 0.4470 0.7410]); hold on;
plot(cumExplained, '-o', ...
    'LineWidth', 2, ...
    'MarkerSize', 6, ...
    'Color', [0.8500 0.3250 0.0980]);

grid on;
box on;

xlabel('Principal Component');
ylabel('Explained Variance (%)');
title('Scree Plot and Cumulative Explained Variance');
legend('Individual explained variance', ...
       'Cumulative explained variance', ...
       'Location', 'best');

set(gca, 'FontSize', 11);
xticks(1:length(explained));

% Save figure
pngFile = fullfile(outputFolder, 'task2_pca_scree_plot.png');
pdfFile = fullfile(outputFolder, 'task2_pca_scree_plot.pdf');

exportgraphics(fig, pngFile, 'Resolution', 300);
exportgraphics(fig, pdfFile, 'ContentType', 'vector');

% Print useful values
fprintf('PC1 explained variance = %.2f%%\\n', explained(1));
fprintf('PC2 explained variance = %.2f%%\\n', explained(2));
fprintf('PC3 explained variance = %.2f%%\\n', explained(3));
fprintf('Cumulative variance using first 2 PCs = %.2f%%\\n', cumExplained(2));
fprintf('Cumulative variance using first 3 PCs = %.2f%%\\n', cumExplained(3));

disp('Scree plot saved successfully.');
disp(['PNG: ', pngFile]);
disp(['PDF: ', pdfFile]);