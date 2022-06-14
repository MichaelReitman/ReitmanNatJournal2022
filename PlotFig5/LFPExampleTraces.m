function LFPExampleTraces(ExampleData)

raw = ExampleData.raw;
HF = ExampleData.HighFrequency;
LF = ExampleData.LowFrequency;

vlen = 600;

power_xvals =linspace(1,vlen,length(LF));
raw_xvals = linspace(1,vlen,length(raw));

figure; hold on;
ax(1) = subplot(2,1,1);
plot(raw_xvals,raw,'k')
ax(2) = subplot(2,1,2); hold on;
plot(power_xvals,LF,'c','linewidth',1)
yyaxis right;
plot(power_xvals,HF,'y','linewidth',1)
legend({'Low Frequency', 'High Frequency'})
linkaxes(ax,'x')
xlim([550 560]);

