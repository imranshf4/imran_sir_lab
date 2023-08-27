%13.Experiment Name: Write a MATLAB/Python program and plot multilevel speech resolution.

clc;
clear all;
close all;
% Read the speech signal (replace 'speech.wav' with your file)
[speechSignal, Fs] = audioread('New_Real_Conversation_Lessons.mp3');

% Parameters for CWT
scales = 1:64;  % Scale levels
waveletName = 'morl';  % Wavelet function (change as needed)

% Perform CWT
cwtCoeffs = cwt(speechSignal, scales, waveletName);
%disp(cwtCoeffs)
% Create a time-frequency plot
time = (0:length(speechSignal)-1) / Fs;
freq = scal2frq(scales, waveletName, 1/Fs);

figure;
imagesc(time, freq, abs(cwtCoeffs));
colormap(jet);
colorbar;
set(gca, 'YDir', 'normal');
xlabel('Time (s)');
ylabel('Frequency (Hz)');
title('Continuous Wavelet Transform - Multilevel Speech Resolution');