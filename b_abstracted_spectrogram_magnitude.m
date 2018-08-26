function spectrogramOut = b_abstracted_spectrogram_magnitude(...
    fullSignalIn, fftSize, hopSize, zeroPadding)
%% calculates a spectrogram matrix, but magnitudes only (for the usual timbre metrics)
%% inputs: signal to process, fft size, hop size (in samples), zero-padding (how many x)


% window start points (in samples)
windowStarts = 1:hopSize:(length(fullSignalIn)-fftSize);
% allocate spectrogram matrix
spectrogramOut = zeros((fftSize*zeroPadding/2)+1, length(windowStarts));
% calculate hamming window once
hammingSized = hamming(fftSize)';

% for each frame,
for j = 1:length(windowStarts)
    % figure out the chunk of the signal
    i = windowStarts(j);
    signal = fullSignalIn(i:i+fftSize-1);
    % apply Hamming window
    signal = hammingSized .* signal;
    % 4x zero pad
    signal = b_from_hw_3_zeropad(signal, zeroPadding);
    % take fft magnitudes for pos freqs
    spectrum = b_from_hw_3_fftPosFreqMag(signal);
    % add to the matrix
    spectrogramOut(:,j) = spectrum';
end