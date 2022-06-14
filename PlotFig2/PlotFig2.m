function PlotFig2 
load('Fig2Data.mat')

figure; hold on;
GRABneExampleTraces(ExampleData,'run')
figure; hold on;
GRABneExampleTraces(ExampleData,'stat')

plotspectrumwerr(GRABnePowerSpectra.S,...
    GRABnePowerSpectra.F,...
    GRABnePowerSpectra.Serr,...
    'GRABNE power (dB)','g')
xlim([1/300,1])

GRABnevsPupilandAstrocytes(PupNExcorr,AstNExcorr)

GRABne_pwbythresh(GRABneETA.Peakdata)

deltaAstbyGRABne(GRABneETA.ETAdata,GRABneETA.Randdata)

deltaGRABnebyAst(AstETA)

