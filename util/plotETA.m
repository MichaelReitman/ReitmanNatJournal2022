function plotETA(xvals,colors,varargin)

ndatasets = nargin-2;

for idx = 1:ndatasets
    shadedErrorBar(xvals,varargin{idx},...
        {@nanmean,@stderr},...
        'lineprops',{'color',colors{idx},'linewidth',2});
end
