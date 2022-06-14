function AstrocyteResponsetoArousal(comparisonstruct,window)
func = @(x) x-(x(:,ceil(size(x,2)/2))); %t0norm
comparecell = struct2cell(comparisonstruct);
fignames = {'Saline','CNO - 1mgkg','CNO - 5mgkg'};
func = @(x) nanmean(x-(x(:,ceil(size(x,2)/2))));
funcSE = @(x) stderr(x-(x(:,ceil(size(x,2)/2))));

counter = 1;
for ETAidx = 1:2:length(comparecell)-1
baseFnorm = comparecell{ETAidx+1};
trtFnorm = comparecell{ETAidx};

timerange = window;
xvals = linspace(-timerange,timerange,size(trtFnorm,2));

figure; hold on;
set(gcf, 'DefaultAxesFontName', 'Arial');
set(gcf, 'DefaultTextFontName', 'Arial');

title(fignames{counter}) 
shadedErrorBar(xvals,100*baseFnorm,{func,funcSE})
shadedErrorBar(xvals,100*trtFnorm,{func,funcSE},'lineprops',{'color','r'})
vertline;
hl = horzline; set(hl,'linestyle','--','color','k')
ylabel('% change in astrocyte Fnorm')
counter = counter+1;
end