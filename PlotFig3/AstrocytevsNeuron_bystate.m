function AstrocytevsNeuron_bystate(AstNeurxcorr)

figure; hold on;
shadedErrorBar(AstNeurxcorr.delays,AstNeurxcorr.moving,{@nanmean,@stderr},'lineprops',{'color','k'});
shadedErrorBar(AstNeurxcorr.delays,AstNeurxcorr.stationary,{@nanmean,@stderr},'lineprops',{'color',[0.5,0.5,0.5]});
vertline;
xlabel('time (s)'); ylabel('r')

t0 = AstNeurxcorr.delays==0;
p = ranksum(AstNeurxcorr.moving(:,t0),AstNeurxcorr.stationary(:,t0));
text(5, 0.3, ['p = ' num2str(p,2)])


