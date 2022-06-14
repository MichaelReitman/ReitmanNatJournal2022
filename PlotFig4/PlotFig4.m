function PlotFig4

load('Fig4Data.mat')

raincloud_deltaeventrate(ResampledDeltaEventRate)

AstrocyteResponsetoArousal(AstrocyteResponsetoMovement,20)
CompareAstrocyteResponsetoArousal(AstrocyteResponsetoMovement,'movement')

AstrocyteResponsetoArousal(AstrocyteResponsetoPupilDilation,5)
CompareAstrocyteResponsetoArousal(AstrocyteResponsetoPupilDilation,'stationary dilation')
