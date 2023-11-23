# RBCDforOT
This repository restores all the experiment data in the paper: Randomized methods for computing optimal transport without
regularization and their convergence analysis

Experiment5_1_xd.mlx is the matlab file generating the figures and tables in Section 5.1 related to Wasserstein distance between x dimension distributions. 

Experiment5_2.mlx is the matlab file generating the figures and table in Section 5.2. 

Experiment5_3.mlx is the matalbe file generating Figure 9: Solving large-scale problem via ARBCD. 

RBCD0.mlx, reRBCD.mlx, ARBCD.mlx, SKstab.m, IPM folder are the algorithms used in these experiments. The file names are strongly related to the algorithm names in the paper. In particular, SKstab is the stabelized Sinkhorn's algorithm.

round_matrix.m is a file implementing the rounding procedure in the paper: J. Altschuler, J. Niles-Weed, and P. Rigollet, Near-linear time approximation algorithms for optimal transport via Sinkhorn iteration, Advances in Neural Information Processing Systems, 30 (2017).

map_0.log records data of sample points from the empirical invariant measure.
