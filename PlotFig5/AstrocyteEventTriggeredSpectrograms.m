function AstrocyteEventTriggeredSpectrograms(SpectStruct)


figure;
for LFPChannel=1:2
    T = SpectStruct(LFPChannel).T;
    F = SpectStruct(LFPChannel).F;
    
    subplot(1,2,LFPChannel); hold on;
    plot_matrix(SpectStruct(LFPChannel).mednorm,T,F,'nl'); caxis([85 115]);
    title(['Astrocyte event triggered spectrogram channel ' num2str(LFPChannel)]);
    line([5,5],[0 100],'linewidth',2,'color','k');
    xlim([1,9]);ylim([0,100]);
    xticks(1:9);
    xticklabels(-4:4)
    xlabel('time from astrocyte Ca^2^+ onset (s)'); ylabel('frequency')
end