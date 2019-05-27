clear all
close all
clc

%% Get gyroscope data

filename = 'data\seria2\Gyroscope.csv';
[t_ms_dps, X_dps, Y_dps, Z_dps] = readGyro(filename);


%% Vector sum of x, y and z values from gyroscope

for i = 1:length(X_dps)
    sum_gyro(i) = sqrt(X_dps(i)^2 + Y_dps(i)^2 + Z_dps(i)^2);
end
sum_gyro = sum_gyro';

%% Raw plot

figure(1);
subplot(2, 1, 1);
plot(t_ms_dps, sum_gyro);
xlabel('Time (milisec)')
ylabel('Gyro (degrees/s)')
grid on;
grid minor;

%% Displacement

% Average dt for further calculation
DT = t_ms_dps(length(t_ms_dps)) - t_ms_dps(1);
dt = DT / t_ms_dps(length(t_ms_dps)) * 1000;

% Integration to get current angle (drifting problem)
deg = cumtrapz(t_ms_dps, sum_gyro);
subplot(2, 1, 2);
plot(t_ms_dps, deg / dt);
xlabel('Time (milisec)');
ylabel('Degrees');
grid on;
grid minor;

