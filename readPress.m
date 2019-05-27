function [t_ms, P_mBar] = readPress(filename)
    opts = detectImportOptions(filename);
    opts.Delimiter = ',';

    opts.SelectedVariableNames = 'HostTimestamp_ms_';
    t_ms = readmatrix(filename, opts);
    t_ms(:,2) = [];

    opts.SelectedVariableNames = 'Pressure_mBar_';
    P_mBar = readmatrix(filename, opts);
    P_mBar(:,2) = [];
end