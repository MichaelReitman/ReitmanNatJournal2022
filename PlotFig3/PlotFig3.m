function PlotFig3

load('Fig3Data.mat')

figure; hold on
AstocyteandNeuronExampleTraces(ExampleData)

AstrocytevsNeuron_bystate(AstNeurxcorr)

CompareMeanvsArousalPC(ExampleData)

ArousalDriven_ArousalPCandAstrocytes(ArousalETA)

ArousalPCaroundAstrocyteCa(AstrocyteETA)