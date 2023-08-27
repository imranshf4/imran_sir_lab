%14.Experiment Name: Write a MATLAB/Python program to recognize speech signal.
clc;
clear all;
close all;     
        % Load the pre-trained model
load('New_Real_Conversation_Lessons.mp3'); % You need to provide the actual path to your trained model

% Define the class labels
classLabels = ["background_noise", "unknown", "yes", "no", "up", "down", "left", "right", "on", "off", "stop", "go"];

% Load an example speech signal
audioPath = 'New_Real_Conversation_Lessons.mp3'; % You need to provide the actual path to your audio file
[audio, fs] = audioread(audioPath);

% Feature extraction
mfccs = melcepst(audio, fs, 'E0dD'); % Mel-frequency cepstral coefficients

% Resize the feature to match the input shape of the model
inputSize = size(net.Layers(1).InputSize);
mfccsResized = imresize(mfccs, inputSize(1:2));

% Perform speech recognition
predictions = predict(net, mfccsResized);
[~, predictedClassIndex] = max(predictions);

% Print the recognized class label
predictedClassLabel = classLabels(predictedClassIndex);
fprintf('Predicted class: %s\n', predictedClassLabel);