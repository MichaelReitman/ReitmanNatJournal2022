function plotStatDilaETA(StationaryDilation)

colors = {[0.5,0.5,0.5],[1,0,1]};

figure; hold on;

xvals = linspace(-20,20,size(StationaryDilation.Pupil,2));
plotETA(xvals,colors(1),100*StationaryDilation.Pupil)

xvals = linspace(-20,20,size(StationaryDilation.Astrocytes,2));
plotETA(xvals,colors(2),100*StationaryDilation.Astrocytes)

vertline;
xlabel('Time from pupil dilation (s)')
ylabel('% maximum value')
