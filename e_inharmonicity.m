function inharmonicityVector = e_inharmonicity(peakss)
%% given a spectrogram, calculates inharmonicity for each frame
%% assumes columns are frames, rows cover exactly the positive frequency range

inharmonicityVector = zeros(1, size(peakss,2));

for i = 1:length(inharmonicityVector)
    inharmonicityVector(i) = e_inharmonicityFrame(peakss(i));
end
