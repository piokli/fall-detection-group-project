% Accelerometer
filename = '20190521_232942_Accelerometer.csv';

[t_ms, X_mg, Y_mg, Z_mg] = readAcc(filename);

figure(1);
subplot(3, 1, 1);
plot(t_ms, X_mg, t_ms, Y_mg, t_ms, Z_mg);
grid on;
grid minor;

% Gyroscope
filename = '20190521_232942_Gyroscope.csv';

[t_ms, X_dps, Y_dps, Z_dps] = readGyro(filename);

subplot(3, 1, 2);
plot(t_ms, X_dps, t_ms, Y_dps, t_ms, Z_dps);
grid on;
grid minor;

% Magnetometer
filename = '20190521_232942_Magnetometer.csv';

[t_ms, X_mGa, Y_mGa, Z_mGa] = readMag(filename);

subplot(3, 1, 3);
plot(t_ms, X_mGa, t_ms, Y_mGa, t_ms, Z_mGa);
grid on;
grid minor;