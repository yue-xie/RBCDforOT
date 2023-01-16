# RBCDforOT
This repository restores all the experiment data in the paper: Random block coordinate descent methods for computing
optimal transport and convergence analysis

Experiment5_1_xd.mlx is the matlab file generating the figures and tables in Section 5.1 related to Wasserstein distance between x dimension distributions. 

Experiment5_2_xd.mlx is the matlab file generating the figures in Section 5.2 related to Wasserstein distance between x dimension distributions. 

Experiment5_2_scalability is the matalbe file generating Figure 6: Computation time (s) vs. problem size (n).

RBCD0.mlx, reRBCD.mlx, ARBCD.mlx, ARBCD1.mlx, Sinkhorn.m, Sinkhorn1.m are the algorithms used in these experiments. The file names are strongly related to the algorithm names in the paper. 

round_matrix.m is a file implementing the rounding procedure in the paper: J. Altschuler, J. Niles-Weed, and P. Rigollet, Near-linear time approximation algorithms for optimal transport via Sinkhorn iteration, Advances in Neural Information Processing Systems, 30 (2017).

map_0.log records data of sample points from the empirical invariant measure.
