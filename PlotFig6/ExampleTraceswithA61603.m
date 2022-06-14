function ExampleTraceswithA61603(ExampleData)

xvals = linspace(1,4200,length(ExampleData.Neurons));
figure; hold on;
plot(xvals,ExampleData.Neurons,'color',[0.7 0.7 0.7])
plot(xvals,ExampleData.Astrocytes,'color','m')
plot([1800,1800],get(gca,'ylim'),'k-')
ylabel('Z'); xlabel('time (s)');
legend({'neurons','astrocytes'})
suptitle('example')