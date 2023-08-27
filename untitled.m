% Define paths to Kaldi binaries and scripts
kaldi_root = '/path/to/kaldi';
kaldi_bin = fullfile(kaldi_root, 'src', 'bin');
kaldi_scripts = fullfile(kaldi_root, 'egs', 'wsj', 's5', 'utils');

% Set up environment variables
setenv('PATH', [getenv('PATH'), ':', kaldi_bin]);
setenv('KALDI_ROOT', kaldi_root);
addpath(kaldi_scripts);

% Define audio file path and decode folder
audio_file = 'New_Real_Conversation_Lessons.mp3';
decode_folder = 'decode_output';

% Decode the audio file using a pre-trained model
system(['./run.sh', audio_file, decode_folder]);

% Load and display recognition results
hypothesis_file = fullfile(decode_folder, '1.txt');
recognition_result = fileread(hypothesis_file);
fprintf('ASR Result: %s\n', recognition_result);
