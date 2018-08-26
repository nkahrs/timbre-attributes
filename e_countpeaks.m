function numpeaksVector = e_countpeaks(peakss)
numpeaksVector = zeros(size(peakss));
for i=1:length(numpeaksVector)
    numpeaksVector(i) = size(cell2mat(peakss(i)), 1);
end