clear all
close all
clc

%% Get accelerometer data

filename = 'data\seria2\Accelerometer.csv';
[t_ms_mg, X_mg, Y_mg, Z_mg] = readAcc(filename);

%% Vector sum of x, y and z values from accelerometer

for i = 1:length(X_mg)
    sum_acc(i) = sqrt(X_mg(i)^2 + Y_mg(i)^2 + Z_mg(i)^2);
end
sum_acc = sum_acc';

%% Raw plots

figure(1);
subplot(3, 1, 1);
plot(t_ms_mg, sum_acc);
hold on;
xlabel('Time (milisec)')
ylabel('Acceleration (mm/milisec^2)')
grid on;
grid minor;

%% Displacement

% High Pass Filter 1 - potrzebny ¿eby przesun¹æ na zero chocia¿by
sum_acc = highPassFilter(sum_acc, 0.1/30, t_ms_mg, 6);
subplot(3, 1, 1);
plot(t_ms_mg, sum_acc, '-g');
grid on;
grid minor;

% First integration
vel = cumtrapz(t_ms_mg, sum_acc);
subplot(3, 1, 2);
plot(t_ms_mg, vel);
hold on;
xlabel('Time (milisec)');
ylabel('Velocity (mm/milisec)');
grid on;
grid minor;

% %High Pass Filter 2
% vel = highPassFilter(vel, 0.1/30, t_ms_mg, 3);
% subplot(3, 1, 2);
% plot(t_ms_mg, vel, '-g');
% grid on;
% grid minor;

% Second integration
dis = cumtrapz(t_ms_mg, vel);
subplot(3, 1, 3);
plot(t_ms_mg, dis);
hold on;
xlabel('Time (milisec)');
ylabel('Displacement (mm)');
grid on;
grid minor;

% % High Pass Filter 3
% dis = highPassFilter(vel, 0.01, t_ms_mg, 6);
% subplot(3, 1, 3);
% plot(t_ms_mg, dis, '-g');
% grid on;
% grid minor;