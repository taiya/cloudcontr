clear;clc;close all;
path('toolbox',path);
filename = '../data/2D/n.mat';
load(filename);

figure;movegui('northeast');set(gcf,'color','white');set(gcf,'Renderer','OpenGL');
scatter3(M.verts(:,1),M.verts(:,2),M.verts(:,3),30,'.','MarkerEdgeColor', GS.PC_COLOR);  hold on;
%scatter3(M.cverts(:,1),M.cverts(:,2),M.cverts(:,3),30,'.r'); 
axis off;axis equal;camorbit(0,0,'camera'); axis vis3d;view3d zoom;




