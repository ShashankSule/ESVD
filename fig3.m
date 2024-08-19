%% plot
M_K = abs(D_256'*U_K*Sigma_K*D_256);
M_W = abs(D_80'*Sigma_1*V_1'*D_256); 

tiledlayout(1,2);
nexttile;
imagesc(flipud(M_K(88:167,:))); 
yticks(20:20:80)
yticklabels(88:20:167)
set(gca,'FontSize', 14, 'TickLabelInterpreter', 'latex'); 
title("$\mathcal{F}[U_K\Sigma_K]$", 'Interpreter','latex', 'FontSize',18);
colormap turbo

nexttile;
imagesc(flipud(M_W(:,58:198))'); 
set(gca,'FontSize', 14, 'TickLabelInterpreter', 'latex'); 
xlabel('Output dim.', 'FontSize',18); 
ylabel('Input dim.', 'FontSize',18);
title("$\mathcal{F}[\Sigma_1 V_{1}^{\top}]$", 'Interpreter','latex', 'FontSize',18);
colormap turbo; 

cb = colorbar; 
cb.Layout.Tile = 'east'; 