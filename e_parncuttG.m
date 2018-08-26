function g = e_parncuttG(f_1, f_2)
%% calculate "g(f_cb)" as cited from Parncutt in MacCallum
f_m = mean([f_1 f_2]);
f_cb = 1.72 * (f_m^0.65);

% "distance between them in critical bands"
f_cb = abs(f_1 - f_2) / f_cb;

% f_cb's relation to the space between the pitches is unclear...
% I should also consult Parncutt directly

g = exp(1) * f_cb * 4;
g = g * exp(-f_cb * 4);
g = g^2;

