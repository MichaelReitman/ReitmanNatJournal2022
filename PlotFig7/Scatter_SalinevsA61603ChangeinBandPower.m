function Scatter_SalinevsA61603ChangeinBandPower(A61603_AverageBandPower)

figure; subplot 121; hold on; title ('Change in 2 to 7Hz power from baseline')
pairedscatter(A61603_AverageBandPower.Saline_2to7Hz,...
    A61603_AverageBandPower.A61603_2to7Hz)

xticklabels({'Saline','A61603'})
plot([0.5,2.2],[1,1],'k--')

subplot 122; hold on; title ('Change in 70 to 100Hz power from baseline')
pairedscatter(A61603_AverageBandPower.Saline_70to100Hz,...
    A61603_AverageBandPower.A61603_70to100Hz)

xticklabels({'Saline','A61603'})
plot([0.5,2.2],[1,1],'k--')

