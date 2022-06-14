function ArousalPCresponses_Adra1AFLoxed(NeuronalArousalResponses)
Movement = NeuronalArousalResponses.Movement;
Stationary = NeuronalArousalResponses.Stationary;

colors = {[0.5,0.5,0.5],[0,0.5,0.5]};
xvals = linspace(-20,20,size(Movement.Wildtype.arousapcanorm,2));

figure; hold on; title('movmement')
plotETA(xvals,colors,Movement.Wildtype.arousapcanorm,Movement.Floxed.arousapcanorm)

vertline;
xlabel('Time from movement onset (s)')
ylabel('relative arousal-associated neuronal activity ')

colors = {[0.5,0.5,0.5],[0,0.5,0.5]};
xvals = linspace(-5,5,size(Stationary.Wildtype.arousapcanorm,2));

figure; hold on; title('stationary pupil dilation')
plotETA(xvals,colors,Stationary.Wildtype.arousapcanorm,Stationary.Floxed.arousapcanorm)


vertline;
xlabel('Time from pupil dilation (s)')
ylabel('relative arousal-associated neuronal activity ')

rng(690);
figure; hold on;
HierarchicallyBootstrap(Movement.Wildtype.hbmat,Movement.Floxed.hbmat,...
    {'WildType','Adra1A ^f^l^/^f^l'},'arousal pca mean',10000);
title('Movement')

figure; hold on;
HierarchicallyBootstrap(Stationary.Wildtype.hbmat,Stationary.Floxed.hbmat,...
    {'WildType','Adra1A ^f^l^/^f^l'},'arousal pca mean',10000);
title('Stationary pupil dilation')


