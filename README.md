# Point Cloud Skeletons via Laplacian-Based Contraction
(Automatically exported from code.google.com/p/skeletonization)

## Bibtex

    @inproceedings{cao_smi10,
    author = {Junjie Cao and Andrea Tagliasacchi and Matt Olson and Hao Zhang and Zhixun Su},
    title = {Point Cloud Skeletons via Laplacian-Based Contraction},
    booktitle = {Proc. of IEEE Conf. on Shape Modeling and Applications},
    year = 2015}

## Abstract
We present an algorithm for curve skeleton extraction via Laplacian-based contraction. Our algorithm can be applied to surfaces with boundaries, polygon soups, and point clouds. We develop a contraction operation that is designed to work on generalized discrete geometry data, particularly point clouds, via local Delaunay triangulation and topological thinning. Our approach is robust to noise and can handle moderate amounts of missing data, allowing skeleton-based manipulation of point clouds without explicit surface reconstruction. By avoiding explicit reconstruction, we are able to perform skeleton-driven topology repair of acquired point clouds in the presence of large amounts of missing data. In such cases, automatic surface reconstruction schemes tend to produce incorrect surface topology. We show that the curve skeletons we extract provide an intuitive and easy-to-manipulate structure for effective topology modification, leading to more faithful surface reconstruction. 

## Compile and execution
The code should be able to run without any setup. Just run eg_skeleton_laplacian_rosa.m and you will find all info needed. More details about the code can be found in https://github.com/ataiya/cloudcontr/blob/master/matlab/readme.txt.

## Data
Geometry models used in the paper are obtained from the AIM@SHAPE shape repository, the Stanford 3D Scanning repository, Lior Shapira, the Princeton Shape Benchmark, Hugues Hoppe, the Digital Plant Laboratory, and our own laser scanning using a Polhemus Cobra FastScan System. All the data used in our paper are saved in https://github.com/ataiya/cloudcontr/tree/master/data.

## Downloads

- [Paper PDF (7.4MB)](https://github.com/ataiya/skeletonization/raw/master/Downloads/cloudcontr_smi10.pdf)
- [Presentation PPT (7.0MB)](https://github.com/ataiya/skeletonization/raw/master/Downloads/SkelContr_SMI10.pptx)
- [Zipped Source Code](https://github.com/ataiya/skeletonization/raw/master/Downloads/cloudcontr_2.0.1.zip) and [KDTree Library](https://github.com/ataiya/skeletonization/raw/master/Downloads/kdtree.rar)

## Teaser of results

<img src="/Downloads/teaser.png" width="30%"/>
<img src="/Downloads/tree_small.jpg" width="30%"/>
<img src="/Downloads/inner eye corners.png" width="30%"/>
