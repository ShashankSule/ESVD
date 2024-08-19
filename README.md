# descrambling-NN

This is the code repository for the paper "Emergence of the SVD as an interpretable factorization in deep learning for inverse problems" by Sule, Czaja, Spencer. To reproduce our figures, first download the `workspace_23_11.mat` file from [here](https://umd.box.com/s/zul3iaq9x6u332nydsc6lo19uvote8ry). You will need MATLAB >= 2022a with the DeepLearning and Symbolic Computation toolboxes downloaded. Our experiments concern the network `DEERNet` [^1]. A 2-layer version of this network was proposed for the purposes of illustrating NN descrambling[^3]. We will work with this two layer DEERNet. 

1. The mat file `workspace_23_11.mat` contains a DEERNet trained according to the specifications in Amey et. al 2021 [^2]. To regenerate the figures and work with our data, you may simply run the files `figs1_2.m` for Figures 1 & 2, `figs3.m` for Figure 3, and `figs4.m` for Figure 4. Here the file `descramble.m` implements the projected gradient descent via the Cayley transform on the orthogonal group and was first written in an older version of the Spinach package. See [here](https://spindynamics.org/wiki/index.php?title=Descramble.m). 

2. If you want to retrain a new DEERNet altogether, you will need the [DEERNet](https://github.com/IlyaKuprov/DEERNet) repository published by [Prof. Ilya Kuprov](spindynamics.org). After downloading the DEERNet repository in the current folder, change lines 30-48 in `DEERNet/kernel/dist_net.m` to reflect the two-layer DEERNet architecture used for descrambling[^1]. Next, run the file `train_DEERNet.m`. Make sure you have enough disk space!

[^1]: Worswick, S.G., Spencer, J.A., Jeschke, G. and Kuprov, I., 2018. Deep neural network processing of DEER data. Science advances, 4(8), p.eaat5218.
[^2]: https://www.pnas.org/doi/suppl/10.1073/pnas.2016917118#supplementary-materials.
[^3]: Amey, J.L., Keeley, J., Choudhury, T. and Kuprov, I., 2021. Neural network interpretation using descrambler groups. Proceedings of the National Academy of Sciences, 118(5), p.e2016917118. 
