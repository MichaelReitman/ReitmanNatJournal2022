function stationaryregresspeak(varstocorr)

figure; hold on;
h = scatterwithregression(varstocorr(:,4),varstocorr(:,6));
set(h,'markeredgecolor',[0.5,0.5,0.5])
set(h(2),'color',[0.5,0.5,0.5])
xlabel('% change in pupil diameter')
ylabel('% change in astrocyte calcium')