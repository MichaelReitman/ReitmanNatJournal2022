function raincloud_deltaeventrate(ResampledDeltaEventRate)

groupnames = {'Saline','CNO1mgkg','CNO5mgkg'};
colors = [0.5 0.5 .5; 0.7 0 0.7; 0.5 0 0.5];
boxdodgeamt = [0.2,0.4,0.6];

figure; title('Change in event rate from baseline'); hold on;
for trtidx = 1:3
    
    h = raincloud_plot(groupnames{trtidx}, ResampledDeltaEventRate.(groupnames{trtidx}),...
        'box_on', 1, 'box_dodge',1,'box_dodge_amount',boxdodgeamt(trtidx),...
        'dot_dodge_amount',boxdodgeamt(trtidx),'color',colors(trtidx,:),...
        'cloud_edge_col', [0 0 0],'band_width',1);
    
    h{1}.FaceAlpha=0.75; h{2}.MarkerFaceAlpha =0.5;
end
ydimensions = get(gca,'ylim'); line([0,0],ydimensions,'linewidth',2,'color','k','linestyle','--')
xlabel('events per second');

CNO1mgkg_pval= 1-sum(ResampledDeltaEventRate.CNO1mgkg < min(ResampledDeltaEventRate.Saline))./length(ResampledDeltaEventRate.CNO1mgkg);
CNO5mgkg_pval= 1-sum(ResampledDeltaEventRate.CNO5mgkg < min(ResampledDeltaEventRate.Saline))./length(ResampledDeltaEventRate.CNO1mgkg);

text(-20,0.35,'Saline','color',colors(1,:))
text(-20,0.3, ['1 mg/kg; p = ' num2str(CNO1mgkg_pval,3)], 'color', colors(2,:))
text(-20,0.25, ['5 mg/kg p = ' num2str(CNO5mgkg_pval,3)], 'color', colors(3,:))

