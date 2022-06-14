function MoveOffsetETA_LFPandAst(MoveETA)

LFpower = MoveETA.LowFrequency;
HFpower= MoveETA.HighFrequency;
Astrocytes = MoveETA.Astrocytes;


xvals = linspace(-10,10,size(Astrocytes,2));

figure;
subplot 121; hold on; title('Low frequency power and astrocyte Ca^2^+') 
shadedErrorBar(xvals,LFpower,{@nanmean,@stderr},'lineprops',{'color','c'});
shadedErrorBar(xvals,Astrocytes,{@nanmean,@stderr},'lineprops',{'color','m'}); 
xlabel('time from movement offset (s)')

subplot 122; hold on; title('High frequency power and astrocyte Ca^2^+') 
shadedErrorBar(xvals,HFpower,{@nanmean,@stderr},'lineprops',{'color','y'});
shadedErrorBar(xvals,Astrocytes,{@nanmean,@stderr},'lineprops',{'color','m'}); 
xlabel('time from movement offset (s)')
vertline;

