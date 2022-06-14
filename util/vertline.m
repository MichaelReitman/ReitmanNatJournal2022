function [h] = vertline

h =line([0,0],get(gca,'ylim'),'linestyle','-','color','k','linewidth',2);
