%% task1c_oil_conductivity_effect.m
% Task 1(c): Effect of oil conductivity on FDS characteristics
% Compare: Low oil conductivity and High oil conductivity
% Constant: MC = 0.3%, T = 35 degC

clear; clc; close all;

% Load Task 1 data
data_task1;

fig = figure('Color', 'w');
set(fig, 'Position', [100 100 900 600]);

loglog(frequency, dry_low_35, '-o', ...
    'LineWidth', 2, 'MarkerSize', 6, 'Color', [0 0.4470 0.7410]); 
hold on;

loglog(frequency, dry_high_35, '-s', ...
    'LineWidth', 2, 'MarkerSize', 6, 'Color', [0.4660 0.6740 0.1880]);

grid on;
box on;

xlabel('Frequency (Hz)', 'FontSize', 12);
ylabel('Loss Tangent, tan\delta', 'FontSize', 12);
title('Task 1(c): Effect of Oil Conductivity on FDS Characteristics', 'FontSize', 13);

legend('MC = 0.3%, Low \sigma, T = 35°C', ...
       'MC = 0.3%, High \sigma, T = 35°C', ...
       'Location', 'southwest');

set(gca, 'FontSize', 11);

% Save as PNG and PDF
pngFile = fullfile(outputFolder, 'task1c_oil_conductivity_effect.png');
pdfFile = fullfile(outputFolder, 'task1c_oil_conductivity_effect.pdf');

exportgraphics(fig, pngFile, 'Resolution', 300);
exportgraphics(fig, pdfFile, 'ContentType', 'vector');

disp('Task 1(c) plot saved successfully.');
disp(['PNG: ', pngFile]);
disp(['PDF: ', pdfFile]);
