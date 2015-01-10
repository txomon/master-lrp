function res = make_figure(fig,name)
    set(findall(fig, 'Type', 'Line'), 'LineWidth', 2);
    axis = findall(gcf, 'Type', 'axes');
    for i = 1:numel(axis);
       ax=axis(i);
       legend(ax,'show');
    end
    saveas(fig, name);
    clf(fig);
    res=1;
end