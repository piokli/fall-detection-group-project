clear all
close all
clc

% Get Data From Accelerometer
filename = 'data\20190521_232942_Accelerometer.csv';

[t_ms, X_mg, Y_mg, Z_mg] = readAcc(filename);

figure(1);
subplot(3, 1, 1);
plot(t_ms, X_mg, t_ms, Y_mg, t_ms, Z_mg);
xlabel('Time (milisec)')
ylabel('Acceleration (mm/milisec^2)')
legend('X', 'Y', 'Z');
grid on;
grid minor;


% Displacement

% First integration
vel_X = cumtrapz(t_ms, X_mg);
vel_Y = cumtrapz(t_ms, Y_mg);
vel_Z = cumtrapz(t_ms, Z_mg);
figure(1);
subplot(3, 1, 2);
plot(t_ms, vel_X, t_ms, vel_Y, t_ms, vel_Z);
xlabel('Time (milisec)');
ylabel('Velocity (mm/milisec)');
legend('X', 'Y', 'Z');
grid on;
grid minor;

% Second integration
dis_X = cumtrapz(t_ms, vel_X);
dis_Y = cumtrapz(t_ms, vel_Y);
dis_Z = cumtrapz(t_ms, vel_Z);
figure(1);
subplot(3, 1, 3);
plot(t_ms, dis_X, t_ms, dis_Y, t_ms, dis_Z);
xlabel('Time (milisec)');
ylabel('Displacement (mm)');
legend('X', 'Y', 'Z');
grid on;
grid minor;





