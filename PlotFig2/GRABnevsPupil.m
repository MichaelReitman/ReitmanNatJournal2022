function GRABnevsPupil(PupNExcorr)

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
plot_hierarch_bootstrap_MR_20210824(...
    PupNExcorr.pup_HB,dpup_HB,{'pupil','dpupil'},'max corr',1e4);

