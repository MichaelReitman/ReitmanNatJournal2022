function plotbinneddata(binneddata)
figure; hold on; 
boxplot(binneddata(:,1),binneddata(:,2),'whisker',inf);
scatter(binneddata(:,2)+0.5,binneddata(:,1),50,'k.')

