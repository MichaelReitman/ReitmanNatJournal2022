function ArousalPCaroundAstrocyteCa(AstrocyteETA)

figure; hold on; suptitle('Overall')
xvals = linspace(-20,20,size(AstrocyteETA.OverallPCA,2));
ax(1) = subplot(211); title('Astrocyte ETA of arousal component');
shadedErrorBar(xvals,AstrocyteETA.OverallPCA,{@nanmean,@stderr});
v= vertline; set(v,'linestyle','--');
xlabel('time (s)'); ylabel('arousal component')
ax(2) =subplot(212); title('Astrocyte ETA of arousal component derivative');
shadedErrorBar(xvals,AstrocyteETA.OverallPCAdiff,{@nanmean,@stderr});
h = horzline; set(h,'linestyle','--'); v= vertline; set(v,'linestyle','--');
xlabel('time (s)'); ylabel('arousal component')
linkaxes(ax,'x'); 

figure; hold on; suptitle('stationary')
xvals = linspace(-5,5,size(AstrocyteETA.StatPCA,2));
bx(1) = subplot(211); title('Astrocyte ETA of arousal component');
shadedErrorBar(xvals,AstrocyteETA.StatPCA,{@nanmean,@stderr});
v= vertline; set(v,'linestyle','--');
xlabel('time (s)'); ylabel('arousal component')
bx(2) = subplot(212); title('Astrocyte ETA of arousal component derivative');
shadedErrorBar(xvals,AstrocyteETA.StatPCAdiff,{@nanmean,@stderr});
h= horzline; set(h,'linestyle','--'); v= vertline; set(v,'linestyle','--');
xlabel('time (s)'); ylabel('arousal component')
linkaxes(bx,'x')
