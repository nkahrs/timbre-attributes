function roughnessScalar = e_roughnessFrame(frame, fs)
%% calculates the roughness of a single spectrogram frame
%% assumes first bin is at 0 Hz, last bin at fs/2 Hz
%% based on formula from MacCallum and Einbond

% first, extract peak frequencies and amplitudes from the frame
[bins, mags] = e_from_hw_3_PeakInterpolate(frame', ...
    e_from_hw_3_PeakExtract(frame, 25));
freqs = (fs/2)/(length(frame)-1) * bins;

% now, start adding things together
numerator = 0;
denominator = 1;

for j=1:length(freqs)
    for k=1:(j-1)
        a_1 = mags(j);
        a_2 = mags(k);
        f_1 = freqs(j);
        f_2 = freqs(k);
        numerator = numerator + (a_1 * a_2 * e_parncuttG(f_1, f_2));
        denominator = denominator + (a_1^2);
    end
end

roughnessScalar = numerator / denominator;