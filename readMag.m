function [t_ms, X_mGa, Y_mGa, Z_mGa] = readGyro(filename)

opts = detectImportOptions(filename);
opts.Delimiter = ',';

opts.SelectedVariableNames = 'HostTimestamp_ms_';
t_ms = readmatrix(filename, opts);
t_ms(:,2) = [];

opts.SelectedVariableNames = 'X_mGa_';
X_mGa = readmatrix(filename, opts);
X_mGa(:,2) = [];

opts.SelectedVariableNames = 'Y_mGa_';
Y_mGa = readmatrix(filename, opts);
Y_mGa(:,2) = [];

opts.SelectedVariableNames = 'Z_mGa_';
Z_mGa = readmatrix(filename, opts);
Z_mGa(:,2) = [];

end