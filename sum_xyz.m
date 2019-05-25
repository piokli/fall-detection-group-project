clear all
close all
clc

% Get Data From Accelerometer
filename = 'data\20190521_232942_Accelerometer.csv';

[t_ms_mg, X_mg, Y_mg, Z_mg] = readAcc(filename);

% Get Data From Gyroscope
filename = 'data\20190521_232942_Gyroscope.csv';

[t_ms_dps, X_dps, Y_dps, Z_dps] = readGyro(filename);


% Sum Acc x y z
for i = 1:length(X_mg)
    sum_acc(i) = sqrt(X_mg(i)^2 + Y_mg(i)^2 + Z_mg(i)^2);
end
sum_acc = sum_acc';
granica = zeros(1, length(t_ms_mg)) + 1000;

% Sum Gyro x y z
for i = 1:length(X_dps)
    sum_gyro(i) = sqrt(X_dps(i)^2 + Y_dps(i)^2 + Z_dps(i)^2);
end
sum_gyro = sum_gyro';

figure(1);
subplot(2, 1, 1);
plot(t_ms_mg, sum_acc);
hold on;
plot(t_ms_mg, granica, '-r');
xlabel('Time (milisec)')
ylabel('Acceleration (mm/milisec^2)')
grid on;
grid minor;

subplot(2, 1, 2);
plot(t_ms_dps, sum_gyro);
xlabel('Time (milisec)')
ylabel('Gyro (degrees)')
grid on;
grid minor;