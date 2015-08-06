function write_xyz1(filename, vertex, normal)
%   Copyright 2010 JJCAO

if size(vertex,2)~=3
    vertex=vertex';
end
if size(vertex,2)~=3
    error('vertex does not have the correct format.');
end

fid = fopen(filename,'wt');
if( fid==-1 )
    error('Can''t open the file.');
    return;
end

% header
fprintf(fid, '%d\n', size(vertex,1));

% body
if isempty(normal)
    fprintf(fid, '%f %f %f\n', vertex');
else
    vertex = [vertex normal];
    fprintf(fid, '%f %f %f %f %f %f\n', vertex');
end

fclose(fid);