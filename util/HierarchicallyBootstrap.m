function [p_boot_amp] = HierarchicallyBootstrap(group1,group2,group_names,measurement,num_reps)
%Hierarch bootstrap
cmp = [0.713725490196078,0.427450980392157,1;1,0.600000000000000,0];
cmp_dark = [0.356862745098039,0.213725490196078,0.500000000000000;0.500000000000000,0.300000000000000,0];
[p_boot_amp, bootstats_amp,bootstats_mean_amp] = get_bootstrap_results_equalsamples(group1,group2,num_reps,5000,'mean');
mean_amp = NaN(2,1);
for i = 1:2
    h = histogram(bootstats_amp(i,:),'binwidth',0.01,'Normalization','probability','FaceColor',cmp(i,:),'EdgeColor','none');
    mean_amp(i) = mean(bootstats_mean_amp(i));
    line([mean_amp(i) mean_amp(i)],[0 max(h.Values)],'Color',cmp_dark(i,:),'LineWidth',2); %have to use line instead of plot with hist
end
if mean_amp(1)<mean_amp(2); p_boot_amp = 1-p_boot_amp; end %flip the p-value if the one-sided test is the other way
xlabel(measurement);
ylabel('Probability');
text(mean(mean_amp),getaxismax('ylim')/1.1,['p= ' num2str(p_boot_amp,3)]);
legend(repelem(group_names,2));
