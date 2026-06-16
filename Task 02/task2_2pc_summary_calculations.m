%% task2_2pc_summary_calculations.m
% Task 2: PCA summary calculations for first 2 PCs

clear; clc; close all;

T = readtable('Group03_Task2_DataSheet.xlsx');

% FDS features
X = T{:, 2:23};

% Log transform and standardize
Xlog = log10(X);
Xstd = zscore(Xlog);

% PCA
[coeff, score, latent, tsquared, explained] = pca(Xstd);
cumExplained = cumsum(explained);

fprintf('PCA Summary for 2-PC Selection\n');
fprintf('--------------------------------\n');
fprintf('PC1 explained variance = %.2f%%\n', explained(1));
fprintf('PC2 explained variance = %.2f%%\n', explained(2));
fprintf('Cumulative variance using PC1 and PC2 = %.2f%%\n', cumExplained(2));
fprintf('Remaining variance after 2 PCs = %.2f%%\n', 100 - cumExplained(2));
fprintf('\nReason: PC1 and PC2 are selected for clear 2D visualization and simple interpretation.\n');
