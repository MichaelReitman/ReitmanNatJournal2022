function PlotFig1

load('Fig1Data.mat')

GcampExampleTraces(ExampleData)

CompareAsttoPupilandWheel(RhoComparison)

plotbinneddata(BinnedAstrocyteCa)
title('average astrocyte Ca^2^+ fluorescence by binned pupil diameter')
xlabel('pupil size decile')
ylabel('average astrocyte Ca^2^+')

plotMoveOnsetETA(ETA.MovementOnset)

regressmaxvspeak(maxvspeak.movement)

plotr2table(maxvspeak.movement, maxvspeak.colnames)

plotStatDilaETA(ETA.StationaryDilation)

stationaryregresspeak(maxvspeak.stationary)
plotMoveOffsetETA(ETA.MovementOffset)

regresslatencytomax(latencytomax.movement(:,2),latencytomax.movement(:,3))

dpupil_byAstevt(dpupil)