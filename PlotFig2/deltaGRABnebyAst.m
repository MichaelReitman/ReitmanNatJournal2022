function deltaGRABnebyAst(AstETA)

xvals = linspace(-5,5,19);
figure; hold on;
plotETA(xvals,{[0,1,0]},AstETA.MoveGRABne); vertline;
xlabel('Time from astrocyte event(s)')
ylabel('% from baseline')

figure; hold on;
plotETA(xvals,{[0,1,0]},AstETA.StationaryGRABne);vertline;
xlabel('Time from astrocyte event(s)')
ylabel('% from baseline')



