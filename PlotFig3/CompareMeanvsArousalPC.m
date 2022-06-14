function CompareMeanvsArousalPC(ExampleData)

Pupil = ExampleData.Pupil;
Neurons = ExampleData.Neurons;
ArousalPC = ExampleData.ArousalPC;

vlen = 600;

xvals_pup = linspace(1,vlen,length(Pupil));
xvals_Neurons = linspace(1,vlen,length(Neurons));

figure; 
ax(1) = subplot(2,1,1); hold on;
plot(xvals_pup,Pupil,'color',[0.5 0.5 0.5],'linewidth',2)
plot(xvals_Neurons,Neurons,'color',[0.3,0.3,0.3],'linewidth',2,'linestyle','-')
plot(xvals_Neurons,ArousalPC,'color','r','linewidth',2,'linestyle','-')

legend({'Pupil','Neurons','ArousalPC'})
ylabel('percent max'); xlabel('time (s)')
xlim([120,320])

SortedNeurons = ExampleData.SortedNeuronalActivity;
ncells = size(SortedNeurons,1);

MoveTimes = ExampleData.MoveTimes;

ax(2) = subplot(2,1,2); hold on;
imagesc([1,600],[1,ncells],SortedNeurons);
ylim([1,ncells]);
colorbar; ylabel('arousal sorted Neuron ID'); xlabel('time (s)')
c = gray;
c = flipud(c);
colormap(c); caxis([-0.25,1]);

for moveidx = 1:length(MoveTimes)
    plot([MoveTimes(moveidx),MoveTimes(moveidx)],get(gca,'ylim'),'r--','linewidth',2);
end


linkaxes(ax,'x');

