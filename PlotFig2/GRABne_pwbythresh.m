function GRABne_pwbythresh(Peakdata)
threshnames = {'0.5 Std','1 Std','1.5 Std','2 Std','2.5 Std','3 Std'};
[h,stats,mstats] = violinplotfromcell({Peakdata.widths},threshnames); title('GRABne peak widths by threshold')
% csvwrite('GRABnePeakwidth_bythresh.csv',mstats); for stats table
ylabel('peak half-width (s)'); xlabel('peak threshold')
set(gca,'yscale','log');
ylim([0.5,100]); yticks([0.5,1,5,10,50,100]); yticklabels(num2cell([0.5,1,5,10,50,100]));
colors = [zeros(length(h),1),linspace(0.5,1,length(h))',zeros(length(h),1)];
colors = flipud(colors);
for threshidx = 1:length(Peakdata)
h(threshidx).ViolinAlpha=0.3; 
h(threshidx).ViolinColor=colors(threshidx,:); 
h(threshidx).EdgeColor=colors(threshidx,:); 
h(threshidx).ScatterPlot.SizeData =6;
h(threshidx).BoxPlot.LineWidth = 2;
end %set params