function [t_ms, X_dps, Y_dps, Z_dps] = readGyro(filename)
    opts = detectImportOptions(filename);
    opts.Delimiter = ',';

    opts.SelectedVariableNames = 'HostTimestamp_ms_';
    t_ms = readmatrix(filename, opts);
    t_ms(:,2) = [];

    opts.SelectedVariableNames = 'X_dps_';
    X_dps = readmatrix(filename, opts);
    X_dps(:,2) = [];

    opts.SelectedVariableNames = 'Y_dps_';
    Y_dps = readmatrix(filename, opts);
    Y_dps(:,2) = [];

    opts.SelectedVariableNames = 'Z_dps_';
    Z_dps = readmatrix(filename, opts);
    Z_dps(:,2) = [];
end