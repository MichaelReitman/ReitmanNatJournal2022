function plottotalpower_Adra1Afloxed(OverallLFPPower)

%% spectrum
WT = OverallLFPPower.WT;
FL = OverallLFPPower.FL;
F = OverallLFPPower.F;
figure; hold on;
shadedErrorBar(F,WT.S,WT.Serr,'lineprops',{'color','k','linewidth',2})
shadedErrorBar(F,FL.S,FL.Serr,'lineprops',{'color','r','linewidth',2})
ylabel('Power in decibles (mv^2/Hz)'); xlabel('frequency (Hz)');
title('LFP Spectrum')

%% summed total power
figure; hold on;
scatter(ones(length(WT.totalpower),1),WT.totalpower,100,'k.')
errorbar(1.1,mean(WT.totalpower),stderr(WT.totalpower),'k.','markersize',20)

scatter(2*ones(length(FL.totalpower),1),FL.totalpower,100,'r.')
errorbar(2.1,mean(FL.totalpower),stderr(FL.totalpower),'r.','markersize',20)
xlim([0.5 2.5])
[~,p] = ttest2(WT.totalpower,FL.totalpower);
text(1.5,getaxismax('ylim')/1.1,['p = ' num2str(p,2)]);
ylabel('total LFP power'); xticks([1,2]); xticklabels({'wt' 'KO'})


