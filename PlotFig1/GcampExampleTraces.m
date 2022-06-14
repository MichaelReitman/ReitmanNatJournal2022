function GcampExampleTraces(ExampleData)

Pupil = ExampleData.Pupil;
Wheel = ExampleData.Wheel;
Astrocytes = ExampleData.Astrocytes;

vlen = 600;

xvals_pup = linspace(1,vlen,length(Pupil));
xvals_wheel = linspace(1,vlen,length(Wheel));
xvals_ast = linspace(1,vlen,length(Astrocytes));

figure; hold on;
subplot 121; hold on;
plot(xvals_pup,100*Pupil,'color',[0.5,0.5,0.5],'linewidth',2)
plot(xvals_ast,100*Astrocytes,'color','m','linewidth',2)
ylabel('percent max')
yyaxis right;
plot(xvals_wheel,Wheel,'color','k','linewidth',2)
xlim([0,600]); ylabel('speed (cm/s)')
legend({'Pupil','Astrocytes','Speed'})

subplot 122; hold on;
plot(xvals_pup,100*smooth(Pupil,100),'color',[0.5,0.5,0.5],'linewidth',2)
plot(xvals_ast,100*smooth(Astrocytes,10),'color','m','linewidth',2)
ylabel('percent max')
yyaxis right;
plot(xvals_wheel,Wheel,'color','k','linewidth',2)
ylabel('speed (cm/s)')
xlim([140,240])
legend({'Pupil','Astrocytes','Speed'})