function plotMoveOnsetETA(MovementOnset)

colors = {[0.5,0.5,0.5],[1,0,1]};

figure; hold on;

xvals = linspace(-20,20,size(MovementOnset.Pupil,2));
plotETA(xvals,colors(1),100*MovementOnset.Pupil)

xvals = linspace(-20,20,size(MovementOnset.Astrocytes,2));
plotETA(xvals,colors(2),100*MovementOnset.Astrocytes)

vertline;
xlabel('Time from movement onset (s)')
ylabel('% maximum value')
