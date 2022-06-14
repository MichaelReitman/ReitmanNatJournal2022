function ChangeinNeuronalPower_Adra1AFloxed(NeuronalPowerSpectra)

%% Average Spectra
Wildtype = NeuronalPowerSpectra.Wildtype;
Floxed = NeuronalPowerSpectra.Floxed;

figure; hold on; suptitle('Neuronal Power Spectra')

subplot(1,4,1); hold on;
plot_vector(nanmean(Wildtype.S,2),Wildtype.F,'nl',[],[0.6,0.6,0.6]);set(gca,'xscale','log');set(gca,'yscale','log')
plot_vector(nanmean(Floxed.S,2),Floxed.F,'nl',[],[1,0.6,0.6]);set(gca,'xscale','log');set(gca,'yscale','log')
title('Lower frequencies'); xlabel('Hz'); ylabel('power');
legend({'wild type','Floxed'})
xlim([0,0.05])

subplot(1,4,2); hold on;
plot_vector(nanmean(Wildtype.S,2),Wildtype.F,'nl',[],[0.6,0.6,0.6]);set(gca,'xscale','log');set(gca,'yscale','log')
plot_vector(nanmean(Floxed.S,2),Floxed.F,'nl',[],[1,0.6,0.6]);set(gca,'xscale','log');set(gca,'yscale','log')
title('higher frequencies'); xlabel('Hz'); ylabel('power');
legend({'wild type','Floxed'})
xlim([0.05,Wildtype.F(end)])

%% Hierarchical Bootstrapping
subplot(1,4,3); hold on;
HierarchicallyBootstrap(...
    Wildtype.hbmat_slow,Floxed.hbmat_slow,{'Wildtype','Floxed'},...
    ['neuronal power < ' num2str(0.05) 'Hz'], 10000);
title(['Spontaneous power below ' num2str(0.05) ' Hz'])

subplot(1,4,4); hold on;
HierarchicallyBootstrap(...
    Wildtype.hbmat_fast,Floxed.hbmat_fast,{'Wildtype','Floxed'},...
    ['neuronal power > ' num2str(0.05) 'Hz'], 10000);
title(['Spontaneous power above ' num2str(0.05) ' Hz'])


