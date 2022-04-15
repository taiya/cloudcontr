function ring = compute_point_point_ring(pts, k, index)
    % pts: n*3 matrix for coordinates where we want compute 1-ring.
    % k: k of kNN
    % index: index of kNN
    %
    % example:
    % M.rings = compute_point_point_ring(M.verts, 1, M.k_knn);
    % M.rings = compute_point_point_ring(M.verts, [1:size(M.verts,1)], M.k_knn);
    %
    % update-date: 2020-12-21
    %     The code has been updated for Matlab R2018, R2022a. 
    %     3rd party implementation of kdtree and ball searching have been replaced by two build-in functions: 
    %     knnsearch & rangesearch of Matlab.
    % create-date: 2009-4-23
    % by: deepfish @ DUT, JJCAO
    
    %% visual debug conditions
    SHOW_PROGRESS = false;
    
    if SHOW_PROGRESS
        close all;
        figure(1); movegui('northwest');set(gcf,'color','white');hold on;
        scatter3( pts(:,1), pts(:,2), pts(:,3), 20,'.','MarkerEdgeColor', GS.PC_COLOR); 
        axis off; axis equal;set(gcf,'Renderer','OpenGL');view3d rot;
        
        figure(2); movegui('northeast');set(gcf,'color','white');hold on;
        axis off; axis equal;set(gcf,'Renderer','OpenGL');view3d zoom;
    end
    %%
    npts = size(pts,1);
    ring = cell(npts,1);
    
    % make sure that index(i,1)=i, if not flipud it. When I use the kdtree
    % toolbox of Andrea from Matlab exchange center and Matlab 2009a in 32-bit,
    % I need to flipud each row. Now I'm using the kdtree toolbox under
    % subversion and Matlab 2010a in 64-bit, index(i,1)=i.
    % of 
    if nargin < 3 || isempty(index)   
        kdtree = KDTreeSearcher(pts);
        index = knnsearch(kdtree,pts,'K',k);
    end
    
    % parfor i = 1:npts  
    for i = 1:npts  
        neighbor = pts(index(i,:),:);
        coefs = pca(neighbor);    
        x = [neighbor * coefs(:, 1), neighbor * coefs(:, 2)];
        
        TRI = delaunayn(x);
        if SHOW_PROGRESS
            figure(1); 
            phds = scatter3( neighbor(:,1), neighbor(:,2), neighbor(:,3), 30,'.y');
            phd = scatter3( pts(i,1), pts(i,2), pts(i,3), 40,'.r');
            p0 = [1 2 3];        v1 = [1 0 1];        v2 = [0 -1 1];
            plane = [pts(i,:) coefs(:, 1)' coefs(:, 2)'];
            ph = drawPlane3d(plane);
            set(ph,'FaceAlpha', 0.2);
            
            figure(2); 
            th = triplot(TRI,x(:,1),x(:,2),'m');
            xh = plot(x(:,1)',x(:,2)','y.','MarkerSize',30);
            xh1 = plot(x(1,1)',x(1,2)','r.','MarkerSize',30);
            
            pause(0.1);
            delete(phd);       delete(phds);        delete(ph);
            delete(th);        delete(xh);          delete(xh1);
        end
        [row,col] = find(TRI == 1);
        temp = TRI(row,:);
        
        temp = sort(temp,2);
        temp = temp(:,2:end);
        
        x=temp(:);
        x=sort(x);
        d=diff([x;max(x)+1]);
        count = diff(find([1;d]));
        y =[x(find(d)) count];
        n_sorted_index = size(y,1);
        start = find(count==1);
        if ~isempty(start) 
            want_to_find = y(start(1),1);
        else
            want_to_find = temp(1,1);
            n_sorted_index = n_sorted_index+1; 
        end
        
        j = 0;    
        sorted_index = zeros(1,n_sorted_index);
        while j < n_sorted_index
            j = j+1;
            sorted_index(j) = want_to_find;
            [row,col] = find(temp == want_to_find);
            if ~isempty(col)
                if col(1) == 1
                    want_to_find = temp(row(1),2);
                    temp(row(1),2) = -1;
                else
                    want_to_find = temp(row(1),1);
                    temp(row(1),1) = -1;
                end    
            end
        end
        
        neighbor_index = index(i,sorted_index);
        
        ring{i} = neighbor_index;
    end
    
    