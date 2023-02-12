function [mini,maxi] = minmax(x)
    mini = min(x,[],"all");
    maxi = max(x,[], "all");
end