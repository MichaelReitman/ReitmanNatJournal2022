function h = pairedscatter(y1,y2)

numpts = length(y1);
x1 = ones(numpts,1);
x2 = 2*x1;


h(1,1) = scatter(x1,y1,100,'k.');
h(1,2) = scatter(0.9,nanmean(y1),200,'r.');
h(1,3) = errorbar(0.9,nanmean(y1),stderr(y1),'color','r','linestyle','none');

h(2,1) = scatter(x2,y2,100,'k.');
h(2,2) = scatter(2.1,nanmean(y2),200,'r.');
h(2,3) = errorbar(2.1,nanmean(y2),stderr(y2),'color','r','linestyle','none');

for idx =1:length(y1)
    line([1,2],[y1(idx) y2(idx)],'color','k');
end
xlim([0.5 2.5]); xticks([1,2]);

if adtest(y1) && adtest(y2)
    [~,p] = ttest(y1,y2); text(1,getaxismax('ylim')/1.1,['p = ' num2str(p) ' paired t-test']);
else
    p = signrank(y1,y2); text(1,getaxismax('ylim')/1.1,['p = ' num2str(p) ' sign test']);
end