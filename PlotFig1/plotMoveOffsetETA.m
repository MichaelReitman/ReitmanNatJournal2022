function plotMoveOffsetETA(MovementOffset)

colors = {[0.5,0.5,0.5],[1,0,1]};

figure; hold on;

xvals = linspace(-20,20,size(MovementOffset.Pupil,2));
plotETA(xvals,colors(1),100*MovementOffset.Pupil)

xvals = linspace(-20,20,size(MovementOffset.Astrocytes,2));
plotETA(xvals,colors(2),100*MovementOffset.Astrocytes)

vertline;
xlabel('Time from movement offset (s)')
ylabel('% maximum value')

yyaxis right;
bar(xvals,sum(MovementOffset.AstrocyteEvts),1,'m','facealpha',0.5)