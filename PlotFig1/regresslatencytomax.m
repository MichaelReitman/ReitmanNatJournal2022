function regresslatencytomax(pupillat,astlat)

figure; hold on;
h = scatterwithregression(pupillat,astlat); 
set(h,'markeredgecolor',[0.5,0.5,0.5])
set(h(2),'color',[0.5,0.5,0.5])
xlabel('Time to max pupil diameter (s)')
ylabel('Time to max astrocyte Ca^2^+')
xlim([0,20]);
ylim([0,15]);

