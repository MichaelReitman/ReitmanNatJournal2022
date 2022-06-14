function regressmaxvspeak(varstocorr)
figure; 
ax(1) = subplot(1,4,1); hold on; 
h = scatterwithregression(varstocorr(:,1),varstocorr(:,5)); 
set(h(2),'color', 'k')
ylabel('astrocyte Fnorm')
xlabel('wheel speed (cm/s)')

ax(2) =subplot(1,4,2); hold on;
h = scatterwithregression(varstocorr(:,2),varstocorr(:,6));
set(h(2),'color', 'k')
xlabel('change in wheel speed (cm/s)')
ylabel('% change in astrocyte calcium')

ax(3) = subplot(1,4,3); hold on;
h= scatterwithregression(varstocorr(:,3),varstocorr(:,5)); 
set(h,'markeredgecolor',[0.5,0.5,0.5])
set(h(2),'color',[0.5,0.5,0.5])
ylabel('astrocyte calcium (% max)')
xlabel('pupil diameter (% max)')

ax(4) = subplot(1,4,4); hold on;
h = scatterwithregression(varstocorr(:,4),varstocorr(:,6));
set(h,'markeredgecolor',[0.5,0.5,0.5])
set(h(2),'color',[0.5,0.5,0.5])
xlabel('% change in pupil diameter')
ylabel('% change in astrocyte calcium')

xlim = [0,100];
ylim = [0,100];

linkaxes(ax)