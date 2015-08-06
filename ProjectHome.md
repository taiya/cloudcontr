# Point Cloud Skeletons via Laplacian-Based Contraction #
Junjie Cao and Andrea Tagliasacchi and Matt Olson and Hao Zhang and Zhixun Su<br />
IEEE Conf. on Shape Modeling and Applications, 2010

<img src='http://skeletonization.googlecode.com/files/teaser.png' width='400' title='Teaser' /><br />
Teaser. Point cloud skeleton and skeleton-assisted topology repair and surface reconstruction. (a) Original model. (b) Input point cloud with a great deal of missing data. (c) Curve skeleton extracted via Laplacian based contraction, while descriptive, contains topological errors. After simple user operations to repair the skeleton (d), topologically correct surface reconstruction is obtained (e), compared to the result of Poisson reconstruction (f) from the input point cloud (b).

# Motivation #
  * Most of existing skeleton extraction methods work for mesh or volumetric models. This poses a significant obstacle to implementing applications such as shape matching, retrieval, segmentation or animation on point cloud models without a costly reconstruction phase.
  * Point cloud models are often acquired with under-sampled regions and non-uniform distribution for self-occlusion and handheld scanner etc. This is an especially persistent issue during dynamic or time-varying shape acquisition. Under these circumstances, results from even the best surface reconstruction algorithm can lead to incorrect topology. While curve skeletons provide a simple and intuitive topology editing tool, and can assist in surface reconstruction.

# Abstract #
We present an algorithm for curve skeleton extraction via Laplacian-based contraction. Our algorithm can be applied to surfaces with boundaries, polygon soups, and point clouds. We develop a contraction operation that is designed to work on generalized discrete geometry data, particularly point clouds, via local Delaunay triangulation and topological thinning. Our approach is robust to noise and can handle moderate amounts of missing data, allowing skeleton-based manipulation of point clouds without explicit surface reconstruction. By avoiding explicit reconstruction, we are able to perform skeleton-driven topology repair of acquired point clouds in the presence of large amounts of missing data. In such cases, automatic surface reconstruction schemes tend to produce incorrect surface topology. We show that the curve skeletons we extract provide an intuitive and easy-to-manipulate structure for effective topology modification, leading to more faithful surface reconstruction.

# Keyword #
curve skeleton; point cloud; Laplacian; contraction; topology repair; surface reconstruction

# Paper #
PDF (7.4MB) http://skeletonization.googlecode.com/files/cloudcontr_smi10.pdf
# Presentation #
PPT (7.0MB) http://skeletonization.googlecode.com/files/SkelContr_SMI10.pptx

# Results #
...

# Applications #
## Extracting skeleton from tree models ##
<img src='http://skeletonization.googlecode.com/files/tree_small.jpg' width='240' title='Skeleton of a tree model' />

## Detecting inner eye corners on 3D surface models ##
<img src='http://skeletonization.googlecode.com/files/inner%20eye%20corners.png' width='240' title='Skeleton of the high curvature region near the eye' />

# bibtex #
@inproceedings{cao\_smi10,
> title = {Point Cloud Skeletons via Laplacian-Based Contraction},
> author = {Junjie Cao and Andrea Tagliasacchi and Matt Olson and Hao
Zhang and Zhixun Su},
> booktitle = {Proc. of IEEE Conf. on Shape Modeling and Applications},
> pages = {187-197},
> year = 2010
}

# Main References #
  1. Junjie Cao, Andrea Tagliasacchi, Matt Olson, Hao Zhang, and Zhixun Su, "Point Cloud Skeletons via Laplacian-Based Contraction," Proc. of IEEE Shape Modeling International, 187-197, 2010.
  1. O. K.-C. Au, C.-L. Tai, H.-K. Chu, D. Cohen-Or, and T.-Y. Lee, “Skeleton extraction by mesh contraction,” ACM Trans. Graphics, vol. 27, no. 3, pp. 44:1–44:10, 2008
