% Wz�r barometryczny

% p = p0*exp(-(mi*g*h)/(R*T))

% p0 � ci�nienie atmosferyczne na poziomie odniesienia (np Gda�sk 1013,25)
% mi � masa molowa powietrza (0,0289644 kg/mol)
% g � przyspieszenie ziemskie (9.80665 m/s2)
% R � sta�a gazowa(8.3144598 J/(mol�K))
% T � temperatura powietrza w K

% https://pl.wikipedia.org/wiki/Wz�r_barometryczny

% po przekszta�ceniu:

% h = -(R*T)/(mi*g)*ln(p/p0)

mi = 0.0289644;
g = 9.80665 ; % te sta�e to mo�na pozmienia� albo pozaokr�gla�
R = 8.3144598;

p0 = 1013.25; % wybra� pkt. odniesienia albo wywalone
T = 25 + 273.16; % albo przyj�� albo zmierzy�

p = 1001.08; % mierzone ci�nienie (mBar)

h = -(R*T)/(mi*g)*log(p/p0);