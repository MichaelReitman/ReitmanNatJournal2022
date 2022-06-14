function [stats,comparison] = CompareAstrocyteResponsetoArousal(comparisonstruct,condition)

func = @(x) x-(x(:,ceil(size(x,2)/2))); %normalize to event onset
comparecell = struct2cell(comparisonstruct);
comparecell = cellfun(func,comparecell,'uni',0');

condnames = fieldnames(comparisonstruct);
comparep2p = cellfun(@(x) peak2peak(x(:,ceil(size(x,2)/2):end)'),comparecell,'uni',0); %look at magnitude of the change after event onset

for groupidx = 1:2:length(comparep2p)-1
    if contains(condition,'stat')
        comparep2p_reordered{groupidx} = rmoutliers(comparep2p{groupidx+1});
        comparep2p_reordered{groupidx+1} = rmoutliers(comparep2p{groupidx});
    else
        comparep2p_reordered{groupidx} = comparep2p{groupidx+1};
        comparep2p_reordered{groupidx+1} = comparep2p{groupidx};
    end
    
    condnames_reordered(groupidx) = condnames(groupidx+1);
    condnames_reordered(groupidx+1) = condnames(groupidx);
end

data = cell2mat(comparep2p_reordered);
names = {};
for nameidx = 1:length(condnames_reordered)
    names = vertcat(names,repmat(condnames_reordered(nameidx),length(comparep2p_reordered{nameidx}),1));
end

figure; hold on; boxplot(100*data,names,'symbol','mo','color','km')
% hl=horzline; set(hl,'linestyle','--');
ylabel('% max change in astrocyte Fnorm')

% ylim([-1 2]); yticks([-1:2]);
% set(gca,'TickLabelInterpreter','tex'); % only if you want superscript
% yticklabels({'0.1','1','10','100'})
[~,~,stats] = kruskalwallis(data,names,'off');
comparison =multcompare(stats,'display','off');
pairedcomps = find(comparison(:,2)-comparison(:,1)==1);
pairedcomps = pairedcomps(1:2:end);
for compidx = 1:length(pairedcomps)
    ptest = pairedcomps(compidx);
    text(comparison(ptest,1),getaxismax('ylim')/1.1, ['p = ' num2str(comparison(ptest,6))])
end
      