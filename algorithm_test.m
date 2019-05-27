clear all
close all
clc

%% Get accelerometer and gyroscope data
seria = 'seria2';
filename = sprintf('data\\%s\\Accelerometer.csv', seria);
[t_ms_mg, X_mg, Y_mg, Z_mg] = readAcc(filename);

filename = sprintf('data\\%s\\Gyroscope.csv', seria);
[t_ms_dps, X_dps, Y_dps, Z_dps] = readGyro(filename);


%% Vector sum of x, y and z values from gyroscope and accelerometer

for i = 1:length(X_mg)
    sum_acc(i) = sqrt(X_mg(i)^2 + Y_mg(i)^2 + Z_mg(i)^2);
end
sum_acc = sum_acc';

for i = 1:length(X_dps)
    sum_gyro(i) = sqrt(X_dps(i)^2 + Y_dps(i)^2 + Z_dps(i)^2);
end
sum_gyro = sum_gyro';

%% Plots

figure(1);
subplot(2, 1, 1);
plot(t_ms_mg, sum_acc);
xlabel('Time (milisec)')
ylabel('Acceleration (mm/milisec^2)')
hold on;
grid on;
grid minor;

subplot(2, 1, 2);
plot(t_ms_dps, sum_gyro);
xlabel('Time (milisec)')
ylabel('Gyro (degrees/s)')
grid on;
grid minor;

%% Fall detection algorithm

G = 1000;
% thresholds
LFT = 0.5*G;
UFT = 2*G;

local_minimums = islocalmin(sum_acc, 'MinProminence', 0.1*G);
local_maximums = islocalmax(sum_acc, 'MinProminence', 0.1*G);

subplot(2, 1, 1);
plot(t_ms_mg(local_minimums), sum_acc(local_minimums), 'og');
plot(t_ms_mg(local_maximums), sum_acc(local_maximums), 'or');

subplot(2, 1, 1);
yline(LFT,'-.g');
yline(UFT,'-.r');

% porównanie z UFT i LFT
for i = 1:length(sum_acc)
   if local_maximums(i) > 0
       if sum_acc(i) > UFT
           plot(t_ms_mg(i), sum_acc(i), '*r')
       end
   end
end

for i = 1:length(sum_acc)
   if local_minimums(i) > 0
       if sum_acc(i) < LFT
           plot(t_ms_mg(i), sum_acc(i), '*g')
       end
   end
end

