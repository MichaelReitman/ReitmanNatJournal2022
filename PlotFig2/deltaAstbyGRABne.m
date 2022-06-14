function deltaAstbyGRABne(ETAdata,Randdata)

thresh = 0.5:0.5:3; 
threshnames = {'0.5 Std','1 Std','1.5 Std','2 Std','2.5 Std','3 Std'};


%% immediate
winsize =5;
comparisontime = 5;
%normaliztion function - subtract mean of first 2 seconds
func = @(x) nanmean(x-nanmean(x(:,1:ceil((size(x,2)/(2*winsize))*2)),2),1); 

figure; hold on; title('Astrocyte')
plotETAbythresh({ETAdata.peak.AllAstrocyte},winsize,thresh,func,'m')
figure; hold on; title('Immediate (t=0) astrocyte Ca^2^+ response to NE')
ScatterETAvsshuffled({ETAdata.peak.AllAstrocyte},{Randdata.peak.AllAstrocyte},...
    1+comparisontime.*1.8,1.8,threshnames,'m');

%% prolonged
winsize =20;
comparisontime = [21,30];
%normaliztion function - subtract mean of first 2 seconds
func = @(x) nanmean(x-nanmean(x(:,1:ceil((size(x,2)/(2*winsize))*2)),2),1); 

figure; hold on; title('Astrocyte')
plotETAbythresh({ETAdata.post.AllAstrocyte},winsize,thresh,func,'m')
figure; hold on; title('Prolonged (1-10s) astrocyte Ca^2^+ response to NE')
ScatterETAvsshuffled({ETAdata.post.AllAstrocyte},{Randdata.post.AllAstrocyte},...
    1+comparisontime.*1.8,1.8,threshnames,'m');
