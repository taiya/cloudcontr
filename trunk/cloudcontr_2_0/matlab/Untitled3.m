figure; movegui('center');set(gcf,'color','white');hold on;
%plot3( P.spls(:,1), P.spls(:,2), P.spls(:,3), '.r', 'markersize', 5);
plot3( spls(:,1), spls(:,2), spls(:,3), '.r', 'markersize', 5);
axis off; axis equal;set(gcf,'Renderer','OpenGL');
view3d zoom;
    
line( spls(edge,1),spls(edge,2),spls(edge,3), 'LineWidth', 1, 'Color', 'r');
text(spls(edge(1),1),spls(edge(1),2),spls(edge(1),3),int2str(edge(1))) ;
%%
tteds = skeds( skeds(:,2)==edge(2), 1:2);
for ii = 1:size(tteds,1) 
    tted = tteds(ii,:);
    line( spls(tted,1),spls(tted,2),spls(tted,3), 'LineWidth', 1, 'Color', 'b');
end
%%
nn = 62;
text(spls(nn,1),spls(nn,2),spls(nn,3),int2str(nn)) ;
%%
figure; movegui('center');set(gcf,'color','white');hold on;
plot3( spls(:,1), spls(:,2), spls(:,3), '.r', 'markersize', 5);
axis off; axis equal;set(gcf,'Renderer','OpenGL');
GS.plot_connectivity(spls, A, 1);
view3d zoom;