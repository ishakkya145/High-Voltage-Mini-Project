%% task2_correlation_calculations.m
% Correlation calculations for 22 FDS features

clear; clc; close all;

% Read Group 03 dataset
T = readtable('Group03_Task2_DataSheet.xlsx');

% First 22 columns are FDS features
X = T{:, 1:22};

% Log transform because FDS tan(delta) values vary over a wide range
Xlog = log10(X);

% Correlation matrix
R = corrcoef(Xlog);

% Use only upper triangular part, excluding diagonal
upperR = triu(abs(R), 1);

% Total possible feature pairs
totalPairs = 22*21/2;

% Count highly correlated pairs
pairs_08  = sum(upperR(:) > 0.8);
pairs_09  = sum(upperR(:) > 0.9);
pairs_095 = sum(upperR(:) > 0.95);

% Adjacent frequency feature correlation
adjCorr = diag(abs(R), 1);
avgAdjCorr = mean(adjCorr);

% Print results
fprintf('Total feature pairs = %d\n', totalPairs);
fprintf('Pairs with |r| > 0.8  = %d (%.2f%%)\n', pairs_08,  pairs_08/totalPairs*100);
fprintf('Pairs with |r| > 0.9  = %d (%.2f%%)\n', pairs_09,  pairs_09/totalPairs*100);
fprintf('Pairs with |r| > 0.95 = %d (%.2f%%)\n', pairs_095, pairs_095/totalPairs*100);
fprintf('Average adjacent-feature correlation = %.4f\n', avgAdjCorr);
