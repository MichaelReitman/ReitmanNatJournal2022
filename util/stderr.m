function y = stderr(x,dim)

if any(isnan(x),'all')
    func = @nanstd;
else
    func= @std;
end

if any(isinf(x))
x(isinf(x)) =nan; %convert infs to nans to avoid very rare breaking
end

if isvector(x)
   y = func(x)/sqrt(length(x));
else
    switch nargin
        case 1
            y = func(x,[],1)/sqrt(size(x,1));
        case 2
            y = func(x,[],dim)/sqrt(size(x,dim));
    end
end
end

