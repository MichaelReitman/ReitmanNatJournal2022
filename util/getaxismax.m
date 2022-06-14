function [axismax] = getaxismax(axis)

try
    [axismax] = max(double(get(gca,axis)));
catch
    [axismax] = max(double(get(gca,'xlim')));
end