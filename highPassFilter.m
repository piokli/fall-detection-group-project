function y = highPassFilter(y, fc, t_ms, order)
    fs = length(t_ms) / ((t_ms(length(t_ms)) - t_ms(1))/1000); % Sampling Rate
    [b1 a1] = butter(order, fc, 'high');
    y = filtfilt(b1, a1, y);
end