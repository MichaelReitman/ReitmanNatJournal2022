function ChangeinNeuronalPower_withA61603(NeuronalPowerSpectra)

%% Average Spectra
Baseline = NeuronalPowerSpectra.Baseline;
A61603 = NeuronalPowerSpectra.A61603;

figure; hold on; suptitle('Neuronal Power Spectra')

subplot(1,4,1); hold on;
plot_vector(nanmean(Baseline.S,2),Baseline.F,'nl',[],[0.6,0.6,0.6]);set(gca,'xscale','log');set(gca,'yscale','log')
plot_vector(nanmean(A61603.S,2),A61603.F,'nl',[],[1,0.6,0.6]);set(gca,'xscale','log');set(gca,'yscale','log')
title('Lower frequencies'); xlabel('Hz'); ylabel('power');
legend({'wild type','A61603'})
xlim([0,0.05])

subplot(1,4,3); hold on;
plot_vector(nanmean(Baseline.S,2),Baseline.F,'nl',[],[0.6,0.6,0.6]);set(gca,'xscale','log');set(gca,'yscale','log')
plot_vector(nanmean(A61603.S,2),A61603.F,'nl',[],[1,0.6,0.6]);set(gca,'xscale','log');set(gca,'yscale','log')
title('higher frequencies'); xlabel('Hz'); ylabel('power');
legend({'wild type','A61603'})
xlim([0.05,Baseline.F(end)])

%% Hierarchical Bootstrapping
subplot(1,4,2); hold on;
HierarchicallyBootstrap(...
    Baseline.hbmat_slow,A61603.hbmat_slow,{'Baseline','A61603'},...
    ['neuronal power < ' num2str(0.05) 'Hz'], 10000);
title(['Spontaneous power below ' num2str(0.05) ' Hz'])

subplot(1,4,4); hold on;
HierarchicallyBootstrap(...
    Baseline.hbmat_fast,A61603.hbmat_fast,{'Baseline','A61603'},...
    ['neuronal power > ' num2str(0.05) 'Hz'], 10000);
title(['Spontaneous power above ' num2str(0.05) ' Hz'])


