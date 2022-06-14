function dpupil_byAstevt(dpupil)

figure; hold on; 
histogram(dpupil.Astonsets,'binwidth',0.01);
histogram(dpupil.Astoffsets,'binwidth',0.01);
line([mean(dpupil.Astonsets),mean(dpupil.Astonsets)],get(gca,'ylim'),'color','b','linewidth',2);
line([mean(dpupil.Astoffsets),mean(dpupil.Astoffsets)],get(gca,'ylim'),'color','red','linewidth',2);

xlim([-0.3 0.5])
ylabel('# astrocyte calcium events'); xlabel('derivative of pupil diameter')
legend({'onsets','offsets','zero','mean evt onsets','mean evt offsets'})
text(0.2,max(double(get(gca,'ylim')))/2,{['onsets = ' num2str(mean(dpupil.Astonsets))]; [' +/-' num2str(stderr(dpupil.Astonsets))]})
text(-.3,max(double(get(gca,'ylim')))/2,{['offsets = ' num2str(mean(dpupil.Astoffsets))]; [' +/-' num2str(stderr(dpupil.Astoffsets))]})
title('Pupil derivative by Astrocyte onset and offset')
