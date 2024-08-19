
%% set
[~,diff_256] = fourdif(256,2); 
[T_256, ~] = eig(diff_256'*diff_256); 
iUpT = inv(eye(256) + T_256); 
init = (eye(256) - T_256)*iUpT; 

%% compute
P_3_plain = descramble(S_3, 1000);
P_3_init = descramble(S_3,1000,init);
%% compute 2 
% change the parameterization here! 
P_3_reparam = descramble(S_3,1000);
[U_S, ~, ~] = svd(S_3*S_3');
P_3_svd = T_256*U_S';

%% plot 
figure; 

tiledlayout(1,5); 

nexttile 
imagesc(eye(80));
set(gca,'FontSize',14)
title('No descrambling','FontSize',18, 'Interpreter','latex')

nexttile; 
imagesc(P_1_plain);
set(gca,'FontSize',14)
title('Initialization: $I$', 'FontSize',18, 'Interpreter','latex')

nexttile; 
imagesc(P_1_init);
set(gca,'FontSize',14)
title('Initialization: $T$', 'FontSize',18, 'Interpreter','latex')

nexttile; 
imagesc(T_80*P_1_reparam);
set(gca,'FontSize',14)
title('Reparameterized PGD', 'FontSize',18, 'Interpreter','latex')

nexttile; 
imagesc(P_1_svd); 
set(gca,'FontSize',14)
title('Computed via eigensolver', 'FontSize',18, 'Interpreter','latex')

% colormap(ax1, 'hsv')
cb = colorbar; 
cb.Layout.Tile = 'east';
colormap parula; 

figure;
tiledlayout(2,5)
nexttile; 
imagesc(flipud(W_1)'); 
set(gca,'FontSize', 14)
xlabel('Input dim.', 'FontSize',18, 'Interpreter','latex');
ylabel('Output dim.', 'FontSize',18, 'Interpreter','latex'); 
title('No descrambling','FontSize',18, 'Interpreter','latex')

nexttile; 
imagesc(flipud((P_1_plain*W_1)')); 
set(gca,'FontSize', 14)
xlabel('Input dim.', 'FontSize',18, 'Interpreter','latex');
ylabel('Output dim.', 'FontSize',18, 'Interpreter','latex'); 
title('Initialization: $I$', 'FontSize',18, 'Interpreter','latex')

nexttile; 
imagesc(flipud((P_1_init*W_1)')); 
set(gca,'FontSize', 14)
xlabel('Input dim.', 'FontSize',18, 'Interpreter','latex');
ylabel('Output dim.', 'FontSize',18, 'Interpreter','latex'); 
title('Initialization: $T$', 'FontSize',18, 'Interpreter','latex')

nexttile; 
imagesc(flipud((T_80*P_1_reparam*W_1)')); 
set(gca,'FontSize', 14)
xlabel('Input dim.', 'FontSize',18, 'Interpreter','latex');
ylabel('Output dim.', 'FontSize',18, 'Interpreter','latex'); 
title('Reparameterized PGD', 'FontSize',18, 'Interpreter','latex')

nexttile; 
imagesc(flipud((P_1_svd*W_1)')); 
set(gca,'FontSize', 14)
xlabel('Input dim.', 'FontSize',18, 'Interpreter','latex');
ylabel('Output dim.', 'FontSize',18, 'Interpreter','latex'); 
title('Computed via eigensolver', 'FontSize',18, 'Interpreter','latex')
% frequency side

nexttile; 
M = abs(D_80'*W_1*D_256); 
 
imagesc(flipud(M(20:60,96:164)')); 
yticklabels(96:8:164)
xticklabels(20:40:60)
set(gca,'XTickLabel', {'40', '60'}, 'FontSize',14)
relnorm = (norm(M(1:30, :))^2 + norm(M(50:80,:))^2)/norm(M)^2;
title(strcat('Rel norm: ', num2str(relnorm)), "FontSize", 18, 'interpreter', 'latex'); 
ylabel('Input dim.', 'FontSize',18, 'Interpreter','latex');
xlabel('Output dim.', 'FontSize',18, 'Interpreter','latex'); 

nexttile; 
M = abs(D_80'*P_1_plain*W_1*D_256); 
imagesc(flipud(M(20:60,96:164)')); 
yticklabels(96:8:164)
xticklabels(20:40:60)
set(gca,'XTickLabel', {'40', '60'}, 'FontSize',14)
relnorm = (norm(M(1:30, :))^2 + norm(M(50:80,:))^2)/norm(M)^2;
title(strcat('Rel norm: ', num2str(relnorm)), "FontSize", 18, 'interpreter', 'latex'); 
ylabel('Input dim.', 'FontSize',18, 'Interpreter','latex');
xlabel('Output dim.', 'FontSize',18, 'Interpreter','latex'); 

nexttile; 
M = abs(D_80'*P_1_init*W_1*D_256); 
imagesc(flipud(M(20:60,96:164)')); 
yticklabels(96:8:164)
xticklabels(20:40:60)
set(gca,'XTickLabel', {'40', '60'}, 'FontSize',14)
relnorm = (norm(M(1:30, :))^2 + norm(M(50:80,:))^2)/norm(M)^2;
title(strcat('Rel norm: ', num2str(relnorm)), "FontSize", 18, 'interpreter', 'latex'); 
ylabel('Input dim.', 'FontSize',18, 'Interpreter','latex');
xlabel('Output dim.', 'FontSize',18, 'Interpreter','latex'); 

nexttile; 
M = abs(D_80'*T_80*P_1_reparam*W_1*D_256); 
imagesc(flipud(M(20:60,96:164)')); 
yticklabels(96:8:164)
xticklabels(20:40:60)
set(gca,'XTickLabel', {'40', '60'}, 'FontSize',14)
relnorm = (norm(M(1:30, :))^2 + norm(M(50:80,:))^2)/norm(M)^2;
title(strcat('Rel norm: ', num2str(relnorm)), "FontSize", 18, 'interpreter', 'latex'); 
ylabel('Input dim.', 'FontSize',18, 'Interpreter','latex');
xlabel('Output dim.', 'FontSize',18, 'Interpreter','latex'); 

nexttile; 
M = abs(D_80'*P_1_svd*W_1*D_256); 
imagesc(flipud(M(20:60,96:164)')); 
yticklabels(96:8:164)
xticklabels(20:40:60)
set(gca,'XTickLabel', {'40', '60'}, 'FontSize',14)
relnorm = (norm(M(1:30, :))^2 + norm(M(50:80,:))^2)/norm(M)^2;
title(strcat('Rel norm: ', num2str(relnorm)), "FontSize", 18, 'interpreter', 'latex'); 
ylabel('Input dim.', 'FontSize',18, 'Interpreter','latex');
xlabel('Output dim.', 'FontSize',18, 'Interpreter','latex'); 

cb_2 = colorbar; 
cb_2.Layout.Tile = 'east';
colormap parula

