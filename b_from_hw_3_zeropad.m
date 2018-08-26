function padded = zeropad(signal, n)
% takes signal, n, returns n-times zero-padded signal
% signal has to be a single row vector
padded = [signal, zeros(1, (n-1)*(length(signal)))];