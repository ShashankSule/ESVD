%% get singular vectors
corr_mat = S_3*S_3'; 

%% Chebyshev polys 
chebs = zeros(256,20); 
x = linspace(-1,1,256); 
a = -1; 
b = 1; 
N = size(chebs,1); 
for i=1:20
    coefs=zeros(i+1,1); 
    coefs(i+1) = 1.0; 
    y = chebyshev_interpolant(-1,1,i+1, coefs, N, x);
    chebs(:,i) = y; 
end

%% NN polys
polys = zeros(256,20); 
for i = 1:20
    u = U_S(:,i);
    if mod(i,2) == 0
        if mod(i,4) == 0 
            u = u/abs(0.5*(u(128) + u(129))); 
            u = ((0.5*(u(128) + u(129)))/abs(0.5*(u(128) + u(129))))*u; 
        else
            u = u/abs(0.5*(u(128) + u(129))); 
            u = -((0.5*(u(128) + u(129)))/abs(0.5*(u(128) + u(129))))*u; 
        end
    else
       u = u/abs(0.5*(u(128) + u(129)));
       
    end
    u = u/max(abs(u));
    polys(:,i) = u; 
end

%% polyfits 
x = linspace(-1,1,256);
polys_trunc = polys(:,:); 
chebs_trunc = chebs(:,:); 
tiledlayout(2,3); 
for i = 1:5 
    [p, S] = polyfit(x,polys_trunc(:,i),i); 
    [y_fit, delta] = polyval(p,x,S); 
    nexttile;
    plot(x,polys_trunc(:,i), 'bo');
    hold on
    plot(x,y_fit,'r-')
    plot(x,y_fit+2*delta,'m--');
    plot(x,chebs_trunc(:,i), 'g-', 'linewidth', 3); 
    plot(x,y_fit-2*delta,'m--');
    legend({'$u^{i}_{S}$','Poly Fit','$95\%$ Prediction Interval','Chebyshev polynomial of deg. $i$'}, ...
          'interpreter', 'latex', 'Location','best');
    set(gca,'FontSize', 10);
    title(strcat('Singular vector index: ', {' '}, num2str(i)), 'interpreter', 'latex', 'FontSize', 18);

end
nexttile; 
imagesc(abs(polys_trunc(:,1:10)'*chebs_trunc(:,1:10))); colormap parula; 
colorbar; 
set(gca,'FontSize',10)
title({"Inner products between the first 10", "Chebyshev polys. and Singular vectors"},'interpreter', 'latex', 'FontSize', 18)
