% Wzór barometryczny

% p = p0*exp(-(mi*g*h)/(R*T))

% p0 – ciœnienie atmosferyczne na poziomie odniesienia (np Gdañsk 1013,25)
% mi – masa molowa powietrza (0,0289644 kg/mol)
% g – przyspieszenie ziemskie (9.80665 m/s2)
% R – sta³a gazowa(8.3144598 J/(mol·K))
% T – temperatura powietrza w K

% https://pl.wikipedia.org/wiki/Wzór_barometryczny

% po przekszta³ceniu:

% h = -(R*T)/(mi*g)*ln(p/p0)

mi = 0.0289644;
g = 9.80665 ; % te sta³e to mo¿na pozmieniaæ albo pozaokr¹glaæ
R = 8.3144598;

p0 = 1013.25; % wybraæ pkt. odniesienia albo wywalone
T = 25 + 273.16; % albo przyj¹æ albo zmierzyæ

p = 1001.08; % mierzone ciœnienie (mBar)

h = -(R*T)/(mi*g)*log(p/p0);