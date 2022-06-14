function PlotFig7

load('Fig7Data.mat')
%% A61603 Pharmacology
plotLFPexamples_A61603(A61603_ExampleData)

Scatter_SalinevsA61603ChangeinBandPower(A61603_AverageBandPower)

%% Adra1A floxed mice 
plotrawLFP_Adra1Afloxed(Adra1Afloxed_ExampleData)

plottotalpower_Adra1Afloxed(OverallLFPPower)

relativeBandPower_withMovement_Adra1Afloxed(PowerwithMovement)

