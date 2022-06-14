function plotspectrumwerr(S,F,Serr,ylab,pltclr)
Slog = 10*log10(S');
Serrlog(1,:) = Slog - 10*log10(Serr(1,:));
Serrlog(2,:) = 10*log10(Serr(2,:))- Slog;

figure; hold on; 
shadedErrorBar(F, Slog,flipud(Serrlog),'lineprops',{'color',pltclr})

fitcurve = fitlm(log10(F),Slog,'poly1');
fitcoeffs = table2array(fitcurve.Coefficients);

ConInt = coefCI(fitcurve);
[~,YCI] = predict(fitcurve, log10(F)');
YCI(:,1) =  fitcurve.Fitted-YCI(:,1); 
YCI(:,2) = YCI(:,2)-fitcurve.Fitted; 
shadedErrorBar(F,fitcurve.Fitted,YCI,'lineprops',{'color','k','linestyle','--'})

ylabel(ylab); xlabel('Hz')
set(gca,'xscale','log')
xticks([.01,.05,0.1,0.5,1]); xticklabels({'0.01','0.05','0.1','0.5','1'})
text(getaxismax('xlim')/5,getaxismax('ylim')/2,['y = F ^{' num2str(fitcoeffs(2,1)/10) '}'])
end