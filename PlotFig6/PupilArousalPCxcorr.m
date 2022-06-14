function PupilArousalPCxcorr(Pupilxcorr)

Wildtype = Pupilxcorr.Wildtype;
Floxed = Pupilxcorr.Floxed;

colors = {[0.5,0.5,0.5],[0,0.5,0.5]};

figure; hold on; 
subplot 211; hold on;
title('Pupil cross-correlation with arousal-associated neuronal activity')
plotETA(Pupilxcorr.delays,colors,Wildtype.corrs',Floxed.corrs')
vertline;

subplot 212; hold on;
HierarchicallyBootstrap(Wildtype.corrs_HBmat,Floxed.corrs_HBmat,...
    {'Wildtype','Floxed'},'corr at t0',10000);
title(['spontaneous pupil-neuron pca t0 correlation'])