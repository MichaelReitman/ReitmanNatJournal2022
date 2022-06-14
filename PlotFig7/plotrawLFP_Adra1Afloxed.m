function plotrawLFP_Adra1Afloxed(Adra1Afloxed_ExampleData)

Wildtype = Adra1Afloxed_ExampleData.WildType;
Floxed = Adra1Afloxed_ExampleData.Floxed;
xvals = linspace(1,3600,3.6e6);

figure; hold on; 
plot(xvals,Wildtype,'k')
plot(xvals,Floxed,'c')
xlim([1720 1750]); ylabel('voltage (mV)'); xlabel('time (s)');
ylim([-0.5 0.5])