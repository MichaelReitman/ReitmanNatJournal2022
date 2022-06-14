function GRABneExampleTraces(ExampleData,cond)

Pupil = ExampleData.Pupil;
Wheel = ExampleData.Wheel;
Astrocytes = ExampleData.Astrocytes;
GRABne = ExampleData.GRABne;

vlen = 1800; 

xvals_pup = linspace(1,vlen,length(Pupil));
xvals_wheel = linspace(1,vlen,length(Wheel));
xvals_ast = linspace(1,vlen,length(Astrocytes));
xvals_GRABne = linspace(1,vlen,length(GRABne));

ax(1) = subplot(2,1,1); hold on;

plot(xvals_GRABne,smooth(GRABne),'g','linewidth',2)
plot(xvals_pup,smooth(Pupil),'color',[0.5 0.5 0.5],'linewidth',2)

ylabel('normalized Pupil / Grabne')


yyaxis right;
plot(xvals_ast,smooth(Astrocytes),'m','linewidth',2)

xlabel('time (s)')
ylabel('Astrocyte Fnorm')


ax(2) =subplot(2,1,2);
plot(xvals_wheel,Wheel,'k','linewidth',2)

xlabel('time (s)')
ylabel('wheel speed (cm/s)')

linkaxes(ax,'x')

if strcmp(cond,'stat')
    xlim([682,712]) %stationary
elseif strcmp(cond,'run')
    xlim([655,965]) %movement
end
