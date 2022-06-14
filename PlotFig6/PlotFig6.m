function PlotFig6

load('Fig6Data.mat')

%% A61603 experiments
rng(2719);

figure; hold on;
HierarchicallyBootstrap(Baseline,A61603,{'baseline','A61603'},'autocorrelation',10000);
title('Astrocyte Autocorrelation')

ExampleTraceswithA61603(ExampleData)

figure; 
subplot 121; hold on;
HierarchicallyBootstrap(AstrocyteDeltaF.Baseline,AstrocyteDeltaF.A61603,...
    {'baseline','A61603'},'mean Zscore',10000);
title('Astrocyte fluorescence');

subplot 122; hold on;
HierarchicallyBootstrap(...
    NeuronDeltaF.Baseline,NeuronDeltaF.A61603,...
    {'baseline','A61603'},'mean Zscore',10000);
title('Neuron fluorescence');

ChangeinNeuronalPower_withA61603(NeuronalPowerSpectra)

%% Adra1A fl/fl experiments

rng(357);
figure; hold on; HierarchicallyBootstrap(...
    NeuronalEventRate.Wildtype,NeuronalEventRate.Floxed,...
    {'Wildtype','Floxed'},'event rate',10000);

ChangeinNeuronalPower_Adra1AFloxed(NeuronalPowerSpectra_Adra1Afl)

ArousalPCresponses_Adra1AFLoxed(NeuronalArousalResponses)

PupilArousalPCxcorr(Pupilxcorr)