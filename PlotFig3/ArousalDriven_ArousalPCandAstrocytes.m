function ArousalDriven_ArousalPCandAstrocytes(ArousalETA)

Move = ArousalETA.Movement;
Stat = ArousalETA.Stationary;

figure; 
subplot 211; hold on;
xvals = linspace(-20,20,size(Move.Astrocytes,2));
shadedErrorBar(xvals,Move.Astrocytes,{@nanmean,@stderr},'lineprops',{'color','m'})
shadedErrorBar(xvals,Move.Neurons,{@nanmean,@stderr},'lineprops',{'color','k'})
vertline;
title('Movement')
xlabel ('Time from movement onset (s)');

subplot 212; hold on;
xvals = linspace(-5,5,size(Stat.Astrocytes,2));
shadedErrorBar(xvals,Stat.Astrocytes,{@nanmean,@stderr},'lineprops',{'color','m'})
shadedErrorBar(xvals,Stat.Neurons,{@nanmean,@stderr},'lineprops',{'color','k'})
vertline;
title('Pupil')
xlabel ('Time from pupil dilation (s)');



