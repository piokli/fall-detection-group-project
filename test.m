clear all
close all
clc

% Accelerometer
filename = 'data\20190521_232942_Accelerometer.csv';

[t_ms, X_mg, Y_mg, Z_mg] = readAcc(filename);

figure(1);
subplot(3, 1, 1);
plot(t_ms, X_mg, t_ms, Y_mg, t_ms, Z_mg); %mili-G's
grid on;
grid minor;

% Gyroscope
filename = 'data\20190521_232942_Gyroscope.csv';

[t_ms, X_dps, Y_dps, Z_dps] = readGyro(filename);

subplot(3, 1, 2);
plot(t_ms, X_dps, t_ms, Y_dps, t_ms, Z_dps); %degree-per-second
grid on;
grid minor;

% Magnetometer
filename = 'data\20190521_232942_Magnetometer.csv';

[t_ms, X_mGa, Y_mGa, Z_mGa] = readMag(filename);

subplot(3, 1, 3);
plot(t_ms, X_mGa, t_ms, Y_mGa, t_ms, Z_mGa); %mili-Gauss
grid on;
grid minor;


% 3D view of Gyroscope data
t_ms(length(t_ms)) = [];
figure(2);
plot3(t_ms, X_mg, Y_mg);


