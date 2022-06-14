function [h] = horzline

h = line(get(gca,'xlim'),[0,0],'linestyle','-','color','k','linewidth',2);
