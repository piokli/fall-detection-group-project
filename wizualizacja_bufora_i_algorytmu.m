clear all
close all
clc


%% Get accelerometer and gyroscope data

seria = 'seria1';
filename = sprintf('data\\%s\\Accelerometer.csv', seria);
[t_ms_mg, X_mg, Y_mg, Z_mg] = readAcc(filename);

%% Vector sum of x, y and z values from accelerometer
for i = 1:length(X_mg)
    sum_acc(i) = sqrt(X_mg(i)^2 + Y_mg(i)^2 + Z_mg(i)^2);
end
sum_acc = sum_acc';

figure(1);

%% fifo - Symulacja bufora danych czyli analizy w czasie rzeczywistym

% trzeba wrzuciæ gdzieœ algorytm...
G = 1000;
% thresholds
LFT = 0.5*G;
UFT = 2*G;

data_frame = sum_acc(1:10); %zeros(1, 10);

for i = 11:length(sum_acc)
    % ustawienie bufora
    data_frame(1:end-1) = data_frame(2:end);
    data_frame(end) = sum_acc(i);
    
    % sprawdzam localne min i max bufora
    local_minimums = islocalmin(data_frame, 'MinProminence', 0.1*G);
    local_maximums = islocalmax(data_frame, 'MinProminence', 0.1*G);
    
    % Wizualizacja
    subplot(1, 4, 1:3)
    ylim([-1500 4000])
    rectangle('Position', [t_ms_mg(i-9) -1500, t_ms_mg(i)-t_ms_mg(i-9) 5500])
    hold on
    
    subplot(1, 4, 1:3)
    plot(t_ms_mg, sum_acc)
    axis tight
    ylim([-1500 4000])
    xlabel('Time (milisec)')
    ylabel('Acceleration (mm/milisec^2)')
    grid on
    
    hold on
    yline(LFT,'-.g')
    yline(UFT,'-.r')
    
    hold on
    plot(t_ms_mg(i-10) + t_ms_mg(local_minimums), data_frame(local_minimums), 'og')
    plot(t_ms_mg(i-10) + t_ms_mg(local_maximums), data_frame(local_maximums), 'or')
    
    subplot(1, 4, 4)
    plot(t_ms_mg(i-9:i), data_frame)
    axis tight
    ylim([-1500 4000])
    title('10 samples frame')
    xlabel('Time (milisec)')
    ylabel('Acceleration (mm/milisec^2)')
    grid on
    grid minor
    
    hold on
    yline(LFT,'-.g')
    yline(UFT,'-.r')
    
    hold on
    plot(t_ms_mg(i-10) + t_ms_mg(local_minimums), data_frame(local_minimums), 'og')
    plot(t_ms_mg(i-10) + t_ms_mg(local_maximums), data_frame(local_maximums), 'or')
    
    pause(0.1)
    if i ~= length(sum_acc)
        subplot(1, 4, 1:3)
        cla
        subplot(1, 4, 4)
        cla
    end
end

