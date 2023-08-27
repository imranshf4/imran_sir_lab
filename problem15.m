%Write a MATLAB/Python program for text-to-speech conversion and record speech 
%signal
% Convert text to speech
voice = 'Pabna University of Science  and Technology';
sampleRate = 44100; % You can adjust this based on your preferences
NET.addAssembly('System.speech');
mySpeaker=System.Speech.Synthesis.SpeechSynthesizer;
mySpeaker.Rate=3;
mySpeaker.Volume=100;
Speak(mySpeaker, voice);
% Record the speech
recordTime = 5; % Duration of recording in seconds
recObj = audiorecorder(sampleRate, 16, 1);
disp('Recording speech...');
recordblocking(recObj, recordTime);
disp('Recording completed.');
% Get the recorded speech signal
recordedSignal = getaudiodata(recObj);
% Save the recorded speech signal to a file (optional)
audiowrite('recorded_speech.wav', recordedSignal, sampleRate);
% Plot the recorded speech signal
time = (0:length(recordedSignal)-1) / sampleRate;
figure;
plot(time, recordedSignal);
xlabel('Time (s)');
ylabel('Amplitude');
title('Recorded Speech Signal');
