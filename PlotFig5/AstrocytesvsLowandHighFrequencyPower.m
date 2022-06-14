function AstrocytesvsLowandHighFrequencyPower(LFPxcorr)

AstrocytesvsLFPpower(LFPxcorr.LowFrequency,LFPxcorr.delays)
suptitle('Low Frequency')

AstrocytesvsLFPpower(LFPxcorr.HighFrequency,LFPxcorr.delays)
suptitle('High Frequency')


end 
function AstrocytesvsLFPpower(LFPpowerstruct,delays)

AstCorrs= LFPpowerstruct.LAcorrs;
AstCorrs_deriv = LFPpowerstruct.LAdiffcorrs;
NeurCorrs= LFPpowerstruct.LNcorrs;
NeurCorrs_deriv = LFPpowerstruct.LNdiffcorrs;

figure;
subplot(2,2,1);  hold on;  title('LFP power vs Ca^2^+') 
shadedErrorBar(delays,AstCorrs,{@nanmean,@stderr},'lineprops',{'color','m'});
shadedErrorBar(delays,NeurCorrs,{@nanmean,@stderr},'lineprops',{'color',[0.7,0.7,0.7]});
hl = horzline; set(hl,'linestyle','--')
vertline; 
xlabel('LFP lag (s)')
ylabel('correlation')
xlim([-10,10])

subplot(2,2,2);  hold on;  title('LFP power derivative vs Ca^2^+') 
shadedErrorBar(delays,AstCorrs_deriv,{@nanmean,@stderr},'lineprops',{'color','m'});
shadedErrorBar(delays,NeurCorrs_deriv,{@nanmean,@stderr},'lineprops',{'color',[0.7,0.7,0.7]});
hl = horzline; set(hl,'linestyle','--')
vertline; 
xlabel('LFP lag (s)')
ylabel('correlation')
xlim([-10,10])

subplot(2,2,3); hold on; title('power')
signrankvszero(AstCorrs,delays,2,10,'m')
signrankvszero(NeurCorrs,delays,2,10,[0.7 0.7 0.7])
xlim([-10,10]); 

subplot(2,2,4); hold on;  title('derivative')
signrankvszero(AstCorrs_deriv,delays,2,10,'m')
signrankvszero(NeurCorrs_deriv,delays,2,10,[0.7 0.7 0.7])
xlim([-10,10])
end