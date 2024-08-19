%% Here we'll fiddle with the descrambled data for layer 1 
net = load('/home/ssule25/Documents/spinach_2_6_5625/My_experiments/2_Layer_DeerNet/relu/2_layer_DEERNET_relu.mat');
net = net.net; 
%% Make a new net that is just the first layer of the network
layers_1 = net.Layers(1:2,1); 
layers_1(3,1) = net.Layers(end,1); 
net_1 = assembleNetwork(layers_1); 
layers_2 = net.Layers(1:3,1); 
layers_2(4,1) = net.Layers(end,1); 
net_2 = assembleNetwork(layers_2);

%% Set up data
P = load('P_1.mat');
P_2 = load('P_2.mat'); 
descram_W = load('Wd_1.mat');
D_80 = load('recentered_80.mat');
D_256 = load('recentered_256.mat');
P = P.P; 
descram_W = descram_W.descrambled_weight_mat; 
D_80 = D_80.D_80; 
D_256 = D_256.D_256; 
W = net.Layers(2,1).Weights; 
W_2 = net.Layers(4,1).Weights; 
P_2 = P_2.P_2;
descram_W_2 = W_2*P_2'; 
[U_2_raw, Sigma_raw, V_2_raw] = svd(W_2); 
[U_2, Sigma, V_2] = svd(descram_W_2);
%% Visualize!!!

figure(); 
tiledlayout(2,2); 
nexttile
imagesc(W_1');
title("Raw Weight matrix"); 
axis xy
nexttile
imagesc(descram_W_1'); 
title("Descrambled Weight Matrix"); 
axis xy 
nexttile
imagesc(abs(D_80'*W_1*D_256)');
title("$F^+ W F^-$", 'Interpreter', 'latex');  
axis xy
nexttile
imagesc(abs(D_80'*descram_W_1*D_256)');
title("$F^+ PW F^-$", 'Interpreter', 'latex');  
axis xy
saveas(gcf, 'Layer1.png');

%% Visualize second layer! 

figure(); 
tiledlayout(2,2); 
nexttile
imagesc(W_2')
title("Raw weight matrix"); 
axis xy
nexttile
imagesc(P_2*W_2'); 
title("Descrambled Weight matrix"); 
axis xy 
nexttile
imagesc(V_2_raw); 
title("Right singular vectors of raw weight");
nexttile
imagesc(V_1); 
title("Right singular vectors of descrambled weight"); 
saveas(gcf, 'Layer2.png'); 