function CompareAsttoPupilandWheel(RhoComparison)

figure; hold on;
pairedscatter(RhoComparison.mouse_wrho,RhoComparison.mouse_prho)
xticklabels({'Wheel','Pupil'});
ylabel('Rho')

rng(100) % for reproducibility
figure; hold on;
HierarchicallyBootstrap(...
    RhoComparison.pupil_hb_mat,RhoComparison.wheel_hb_mat,...
    {'Pupil','Wheel'},'rho',10000);