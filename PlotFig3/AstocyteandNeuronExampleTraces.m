function AstocyteandNeuronExampleTraces(ExampleData)

Pupil = ExampleData.Pupil;
Wheel = ExampleData.Wheel;
Astrocytes = ExampleData.Astrocytes;
Neurons = ExampleData.Neurons;

vlen = 600; 

xvals_pup = linspace(1,vlen,length(Pupil));
xvals_wheel = linspace(1,vlen,length(Wheel));
xvals_ast = linspace(1,vlen,length(Astrocytes));
xvals_Neurons = linspace(1,vlen,length(Neurons));

ax(1) = subplot(2,1,1); hold on;

plot(xvals_pup,Pupil,'color',[0.5 0.5 0.5],'linewidth',2)
ylabel('normalized Pupil')

yyaxis right;
plot(xvals_ast,Astrocytes,'m','linewidth',2)
plot(xvals_Neurons,Neurons,'color',[0.3,0.3,0.3],'linewidth',2,'linestyle','-')

xlabel('time (s)')
ylabel('Ca^2^+ Fnorm')

ax(2) =subplot(2,1,2);
plot(xvals_wheel,Wheel,'k','linewidth',2)

xlabel('time (s)')
ylabel('wheel speed (cm/s)')

linkaxes(ax,'x')

