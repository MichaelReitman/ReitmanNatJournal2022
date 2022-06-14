function plotLFPexamples_A61603(A61603_ExampleData)
%% raw examples
xvals = linspace(1,3600,length(A61603_ExampleData.SalineRaw));
baselinet = 1200;

figure; 
subplot 211; hold on; title('pre-injection')
plot(xvals,A61603_ExampleData.SalineRaw,'k')
plot(xvals,A61603_ExampleData.A61603Raw,'r');
plot([baselinet,baselinet],get(gca,'ylim'),'k')
ylabel('mV')
xlim([407,412])

subplot 212; hold on; title('post-injection')
plot(xvals,A61603_ExampleData.SalineRaw,'k')
plot(xvals,A61603_ExampleData.A61603Raw,'r');
plot([baselinet,baselinet],get(gca,'ylim'),'k')
ylabel('mV')
xlim([1636,1641])

%% spectrogram examples
figure;
ax(1) = subplot(2,1,1); hold on;
plot_matrix(A61603_ExampleData.SalineS,A61603_ExampleData.T,A61603_ExampleData.F,'nl');
plot([baselinet,baselinet],get(gca,'ylim'),'k')
title('SalineS')
caxis([-1 5])

ax(2) = subplot(2,1,2); hold on;
plot_matrix(A61603_ExampleData.A61603S,A61603_ExampleData.T,A61603_ExampleData.F,'nl');
plot([baselinet,baselinet],get(gca,'ylim'),'k')
title('A61603')
caxis([-1 5])

linkaxes(ax);
xlim([0 3600]); ylim([0 100]); 

%% Band Power examples
% Low Frequency
smoothwin = 120 * 2; %smooth for x seconds * 1/spectrogram moving window
bandidx = A61603_ExampleData.F>2&A61603_ExampleData.F<7;
baselinetidx = A61603_ExampleData.T>0 & A61603_ExampleData.T<baselinet;

SalineLF = median(A61603_ExampleData.SalineS(:,bandidx),2);
A61603LF = median(A61603_ExampleData.A61603S(:,bandidx),2);

SalineLF = SalineLF./mean(SalineLF(baselinetidx));
A61603LF = A61603LF./mean(A61603LF(baselinetidx));

figure; subplot 121; hold on; title('2 to 7Hz Power')
plot(A61603_ExampleData.T,smooth(SalineLF,240),'color','k','linewidth',2)
plot(A61603_ExampleData.T,smooth(A61603LF,240),'color','r','linewidth',2)
line([1 3600],[1 1],'color','k','linewidth',2,'linestyle','--')
ylabel('Fold change from baseline')
xlabel('time (s)')
ylim([0,3]); xlim([121,3600-120]);
line([1200 1200],get(gca,'ylim'),'color','k','linewidth',2)

% High Frequency
bandidx = A61603_ExampleData.F>70&A61603_ExampleData.F<100;

SalineHF = median(A61603_ExampleData.SalineS(:,bandidx),2);
A61603HF = median(A61603_ExampleData.A61603S(:,bandidx),2);

SalineHF = SalineHF./mean(SalineHF(baselinetidx));
A61603HF = A61603HF./mean(A61603HF(baselinetidx));

subplot 122; hold on; title('70 to 100Hz Power')
plot(A61603_ExampleData.T,smooth(SalineHF,240),'color','k','linewidth',2)
plot(A61603_ExampleData.T,smooth(A61603HF,240),'color','r','linewidth',2)
line([1 3600],[1 1],'color','k','linewidth',2,'linestyle','--')
ylabel('Fold change from baseline')
xlabel('time (s)')
ylim([0,3]); xlim([121,3600-120]);
line([1200 1200],get(gca,'ylim'),'color','k','linewidth',2)


