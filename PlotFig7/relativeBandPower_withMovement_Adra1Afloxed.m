function relativeBandPower_withMovement_Adra1Afloxed(PowerwithMovement)

wtdata = PowerwithMovement.WildTypeAllMovements(:,2);
fldata = PowerwithMovement.FloxedAllMovements(:,2);

subplot 221; hold on;
title(' change in 70-100 Hz power');
xlabel('median power')
ylabel('probability density');
h= histogram(wtdata,'binwidth',(max(wtdata)-min(wtdata))/50,'facecolor','k','normalization','pdf');
histogram(fldata,'binwidth',h.BinWidth,'facecolor','r','normalization','pdf')

wtdata = PowerwithMovement.WildTypeAllMovements(:,1);
fldata = PowerwithMovement.FloxedAllMovements(:,1);

subplot 223; hold on;
title('change in 2-7Hz power');
xlabel('median power')
ylabel('probability density');
h= histogram(wtdata,'binwidth',(max(wtdata)-min(wtdata))/50,'facecolor','k','normalization','pdf');
histogram(fldata,'binwidth',h.BinWidth,'facecolor','r','normalization','pdf')


subplot 222; hold on;
title('change in 70-100Hz power');

wtdata =PowerwithMovement.WildTypebyMouse(:,2);
fldata =PowerwithMovement.FloxedbyMouse(:,2);

scatter(2*ones(length(fldata),1),fldata,200,'r.')
errorbar(2.1,mean(fldata),stderr(fldata),'r.','markersize',20)

scatter(ones(length(wtdata),1),wtdata,200,'k.')
errorbar(1.1,mean(wtdata),stderr(wtdata),'k.','markersize',20)
ylabel('% median power'); xticks([1.05,2.05]);xticklabels({'WT','KO'})

[~,p] = ttest2(fldata,wtdata);

text(1.5,getaxismax('ylim')/1.1,['p = ' num2str(p,2)]);
line(get(gca,'xlim'),[1,1],'color','k','linestyle','--');

subplot 224; hold on;
title('change in 2-7Hz power');

wtdata =PowerwithMovement.WildTypebyMouse(:,1);
fldata =PowerwithMovement.FloxedbyMouse(:,1);

scatter(2*ones(length(fldata),1),fldata,200,'r.')
errorbar(2.1,mean(fldata),stderr(fldata),'r.','markersize',20)

scatter(ones(length(wtdata),1),wtdata,200,'k.')
errorbar(1.1,mean(wtdata),stderr(wtdata),'k.','markersize',20)
ylabel('% median power'); xticks([1.05,2.05]);xticklabels({'WT','KO'})

[~,p] = ttest2(fldata,wtdata);

text(1.5,getaxismax('ylim')/1.1,['p = ' num2str(p,2)]);
line(get(gca,'xlim'),[1,1],'color','k','linestyle','--');


