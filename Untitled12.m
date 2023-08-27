%Write a MATLAB/Python program to separation of voiced/un-voiced/silence regions 
%from a speech signal.

clc;
clear all;
close all;
% Read the speech signal (replace 'speech.wav' with your file)
[speechSignal, Fs] = audioread('New_Real_Conversation_Lessons.mp3');

% Parameters for analysis
frameSize = 0.02;   % Frame size in seconds
overlap = 0.5;      % Overlap ratio
thresholdEnergy = 0.02;  % Energy threshold for silence detection
thresholdZCR = 50;       % Zero-crossing rate threshold for voicing detection

frameLength = round(Fs * frameSize);
overlapLength = round(frameLength * overlap);
numFrames = floor((length(speechSignal) - overlapLength) / (frameLength - overlapLength));

voicedRegions = zeros(size(speechSignal));
unvoicedRegions = zeros(size(speechSignal));
silenceRegions = zeros(size(speechSignal));

for i = 1:numFrames
    startIdx = (i - 1) * (frameLength - overlapLength) + 1;
    endIdx = startIdx + frameLength - 1;
    
    frame = speechSignal(startIdx:endIdx);
    
    energy = sum(frame.^2) / frameLength;
    zcr = sum(frame(1:end-1) .* frame(2:end) < 0) / frameLength;
    
    if energy < thresholdEnergy
        silenceRegions(startIdx:endIdx) = frame;
    elseif zcr > thresholdZCR
        unvoicedRegions(startIdx:endIdx) = frame;
    else
        voicedRegions(startIdx:endIdx) = frame;
    end
end

% Plot the results
time = (0:length(speechSignal)-1) / Fs;
subplot(3,1,1), plot(time, voicedRegions), title('Voiced Regions')
subplot(3,1,2), plot(time, unvoicedRegions), title('Unvoiced Regions')
subplot(3,1,3), plot(time, silenceRegions), title('Silence Regions')
xlabel('Time (s)')

% Play the separated regions
soundsc(voicedRegions, Fs);
pause(length(voicedRegions) / Fs);
soundsc(unvoicedRegions, Fs);
pause(length(unvoicedRegions) / Fs);
soundsc(silenceRegions, Fs);