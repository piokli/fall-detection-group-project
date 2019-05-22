function [t_ms, X_mg, Y_mg, Z_mg] = readAcc(filename)

opts = detectImportOptions(filename);
opts.Delimiter = ',';

opts.SelectedVariableNames = 'HostTimestamp_ms_';
t_ms = readmatrix(filename, opts);
t_ms(:,2) = [];

opts.SelectedVariableNames = 'X_mg_';
X_mg = readmatrix(filename, opts);
X_mg(:,2) = [];

opts.SelectedVariableNames = 'Y_mg_';
Y_mg = readmatrix(filename, opts);
Y_mg(:,2) = [];

opts.SelectedVariableNames = 'Z_mg_';
Z_mg = readmatrix(filename, opts);
Z_mg(:,2) = [];

end