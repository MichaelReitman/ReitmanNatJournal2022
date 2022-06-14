function GRABnevsPupilandAstrocytes(PupNExcorr,AstNExcorr)

figure;
subplot 131, hold on; title('Pupil Diameter')
shadedErrorBar(PupNExcorr.delays(1,:),PupNExcorr.corrs,{@mean,@stderr})
vertline;
line(get(gca,'xlim'),[0,0],'color','k','linestyle','--')
xlabel('Lag in GRABne signal (s)')
ylabel('r')

subplot 132, hold on; title('Pupil derivative')
shadedErrorBar(PupNExcorr.delays(1,:),PupNExcorr.corrs_deriv,{@mean,@stderr})
vertline;
line(get(gca,'xlim'),[0,0],'color','k','linestyle','--')
xlabel('Lag in GRABne signal (s)')
ylabel('r')

subplot 133, hold on;
pairedscatter(PupNExcorr.pup_byms,PupNExcorr.dpup_byms)
ylabel('r');
xticklabels({'Pupil diameter','Pupil derivative'})

rng(129); % for reproducibility
figure; hold on;
HierarchicallyBootstrap(...
    PupNExcorr.pup_HB,PupNExcorr.dpup_HB,{'pupil','dpupil'},'max corr',1e4);

figure; 
subplot 131, hold on; 
shadedErrorBar(AstNExcorr.delays(1,:),AstNExcorr.corrs,{@mean,@stderr})
vertline;
line(get(gca,'xlim'),[0,0],'color','k','linestyle','--')
xlabel('Lag in GRABne signal (s)')
ylabel('r')

subplot 132; hold on;
histogram(AstNExcorr.maxlag,'binwidth',2,'facecolor','m','facealpha',0.5)
line([0,0],get(gca,'ylim'),'color','k','linewidth',2);

line([mean(AstNExcorr.maxlag),mean(AstNExcorr.maxlag)],get(gca,'ylim'),'color','m','linewidth',2);
ylabel('number of recordings')
xlabel('shift in GRABne signal (s)')
text(min(double(get(gca,'xlim')))/2,max(double(get(gca,'ylim')))/2,...
    [' lag  = ' num2str(mean(AstNExcorr.maxlag)) ' +/- ' num2str(stderr(AstNExcorr.maxlag'))])

subplot 133, hold on;
pairedscatter(PupNExcorr.pup_byms,AstNExcorr.byms)
ylabel('r');
xticklabels({'Pupil diameter','Astrocyte Ca^2^+'})

rng(945); % for reproducibility
figure; hold on; HierarchicallyBootstrap(...
    AstNExcorr.HB,PupNExcorr.pup_HB,{'astrocyte','pupil'},'max corr',1e4);