%% task1a_moisture_effect.m
% Task 1(a): Effect of moisture content on FDS characteristics
% Compare: MC = 0.3% and MC = 5.2%
% Constant: Low oil conductivity, T = 35 degC

clear; clc; close all;

% Load Task 1 data
data_task1;

fig = figure('Color', 'w');
set(fig, 'Position', [100 100 900 600]);

loglog(frequency, dry_low_35, '-o', ...
    'LineWidth', 2, 'MarkerSize', 6, 'Color', [0 0.4470 0.7410]); 
hold on;

loglog(frequency, wet_low_35, '-s', ...
    'LineWidth', 2, 'MarkerSize', 6, 'Color', [0.8500 0.3250 0.0980]);

grid on;
box on;

xlabel('Frequency (Hz)', 'FontSize', 12);
ylabel('Loss Tangent, tan\delta', 'FontSize', 12);
title('Task 1(a): Effect of Moisture Content on FDS Characteristics', 'FontSize', 13);

legend('Dry: MC = 0.3%, Low \sigma, T = 35°C', ...
       'Wet: MC = 5.2%, Low \sigma, T = 35°C', ...
       'Location', 'southwest');

set(gca, 'FontSize', 11);

% Save as PNG and PDF
pngFile = fullfile(outputFolder, 'task1a_moisture_effect.png');
pdfFile = fullfile(outputFolder, 'task1a_moisture_effect.pdf');

exportgraphics(fig, pngFile, 'Resolution', 300);
exportgraphics(fig, pdfFile, 'ContentType', 'vector');

disp('Task 1(a) plot saved successfully.');
disp(['PNG: ', pngFile]);
disp(['PDF: ', pdfFile]);
