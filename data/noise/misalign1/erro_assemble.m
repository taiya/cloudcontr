clc, clear, close all;

% A.points=read_off('fertility_1.2kv_02.off');
%load fertility_viewdirs.txt;
% fertility_viewdirs = fertility_viewdirs( :, [1,3] );
% thetas = cart2pol( fertility_viewdirs(:,1),fertility_viewdirs(:,2) );
% P1 = pcloud_read_off('fertility_1.2kv_01.off');
% P2 = pcloud_read_off('fertility_1.2kv_05.off');
% P3 = pcloud_read_off('fertility_1.2kv_10.off');
% P4 = pcloud_read_off('fertility_1.2kv_15.off');
% save fertility_input.mat; return

load fertility_input.mat;
%%%%%%%%%%%%%%%%%%抖动
% % P1.normals = P1.points;P2.normals = P2.points;P3.normals = P3.points;P4.normals = P4.points;
% % delta = .020;
% % T = makehgtform('xrotate',randn(1)*pi*delta, 'xrotate',randn(1)*pi*delta, 'xrotate',randn(1)*pi*delta, 'translate', delta*[randn(1,3)]);
% % P1.points = pcloud_affine_transform( P1, T );
% % T = makehgtform('xrotate',randn(1)*pi*delta, 'xrotate',randn(1)*pi*delta, 'xrotate',randn(1)*pi*delta, 'translate', delta*[randn(1,3)]);
% % P2.points = pcloud_affine_transform( P2, T );
% % T = makehgtform('xrotate',randn(1)*pi*delta, 'xrotate',randn(1)*pi*delta, 'xrotate',randn(1)*pi*delta, 'translate', delta*[randn(1,3)]);
% % P3.points = pcloud_affine_transform( P3, T );
% % T = makehgtform('xrotate',randn(1)*pi*delta, 'xrotate',randn(1)*pi*delta, 'xrotate',randn(1)*pi*delta, 'translate', delta*[randn(1,3)]);
% % P4.points = pcloud_affine_transform( P4, T );
% % write_off('01_s.off',P1.points,[],[])
% % write_off('05_s.off',P2.points,[],[])
% % write_off('10_s.off',P3.points,[],[])
% % write_off('15_s.off',P4.points,[],[])
% %%%%%%%%%%%%%%%%%%旋转，拼接
% clear P1;clear P2;clear P3;clear P4;
% [P1.points,P1.faces,P1.normals] = read_off('01_n.off');
% [P2.points,P2.faces,P2.normals] = read_off('05_n.off');
% [P3.points,P3.faces,P3.normals] = read_off('10_n.off');
% [P4.points,P4.faces,P4.normals] = read_off('15_n.off');
% [P5.points,P5.faces,P5.normals] = read_off('00_n.off');
% T = makehgtform('yrotate',-thetas(1));
% [P1.points,P1.normals] = pcloud_affine_transform( P1, T );
% T = makehgtform('yrotate',-thetas(5));
% [P2.points,P2.normals] = pcloud_affine_transform( P2, T );
% T = makehgtform('yrotate',-thetas(10));
% [P3.points,P3.normals] = pcloud_affine_transform( P3, T );
% T = makehgtform('yrotate',-thetas(15));
% [P4.points,P4.normals] = pcloud_affine_transform( P4, T );
% P.points = [P1.points; P2.points; P3.points; P4.points; P5.points;];
% P.normals = [P1.normals; P2.normals; P3.normals; P4.normals; P5.normals;];
% write_off('P_N.off',P.points,[],P.normals);
%%%%%%%%%%%%%%%%%%原先代码
delta = .025;%%shaking para;the bigger delta is, the more shaking;0 implies no shaking
%%“yrotate',-thetas(1)” is the rotation part, in order to put together the five models
%%the number in thetas()must coincide withthe index of model, curruntly are 1，5，10，15；
%%“'xrotate',randn(1)*pi*delta...”is the shaking part
%%T is the rotation matrix
T = makehgtform('yrotate',-thetas(1),          'xrotate',randn(1)*pi*delta, 'xrotate',randn(1)*pi*delta, 'xrotate',randn(1)*pi*delta, 'translate', delta*[randn(1,3)]);
P1.points = pcloud_affine_transform( P1, T );
T = makehgtform('yrotate',-thetas(5),          'xrotate',randn(1)*pi*delta, 'xrotate',randn(1)*pi*delta, 'xrotate',randn(1)*pi*delta, 'translate', delta*[randn(1,3)]);
P2.points = pcloud_affine_transform( P2, T );
T = makehgtform('yrotate',-thetas(10),          'xrotate',randn(1)*pi*delta, 'xrotate',randn(1)*pi*delta, 'xrotate',randn(1)*pi*delta, 'translate', delta*[randn(1,3)]);
P3.points = pcloud_affine_transform( P3, T );
T = makehgtform('yrotate',-thetas(15),          'xrotate',randn(1)*pi*delta, 'xrotate',randn(1)*pi*delta, 'xrotate',randn(1)*pi*delta, 'translate', delta*[randn(1,3)]);
P4.points = pcloud_affine_transform( P4, T );
P5.points = read_off( 'fertility_1.2kv_00.off' );%%p5 is the bottom，do not rotate,just read in
save fertility_multi.mat;
P.points = [P1.points; P2.points; P3.points; P4.points; P5.points;];
write_off(['result_' num2str(delta) '.off'],P.points,[],[]);