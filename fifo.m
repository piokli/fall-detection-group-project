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

%% fifo - Symulacja bufora danych czyli analizy w czasie rzeczywistym

data_frame = sum_acc(1:10); %zeros(1, 10);

for i = 11:length(sum_acc);
    data_frame(1:end-1) = data_frame(2:end);
    data_frame(end) = sum_acc(i);
    
    plot(t_ms_mg(i-9:i), data_frame);
    ylim([-2000 4000]);
    title('10 samples frame');
    xlabel('Time (milisec)')
    ylabel('Acceleration (mm/milisec^2)')
    pause(0.5);
end

