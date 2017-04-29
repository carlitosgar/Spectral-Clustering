# Spectral-Clustering
Graph clustering in Julia using the spectral properties of the affinity matrix of a graph.

## Spectral clustering
Reformulation of intra-cluster and inter-cluster similarity as a cost function defined by the Laplacian matrix decomposition of a graph.
The maximization of the cost function is given by the first k eigenvalues. The corresponding eigenvectors become a normal basis and lower
dimensionality manifold that can be clustered using k-means.

## Results

![alt text](https://github.com/mrquant/Spectral-Clustering/blob/master/example-k2.png "k = 2")

## References

[@INPROCEEDINGS{Ng01onspectral,
    author = {Andrew Y. Ng and Michael I. Jordan and Yair Weiss},
    title = {On Spectral Clustering: Analysis and an algorithm},
    booktitle = {ADVANCES IN NEURAL INFORMATION PROCESSING SYSTEMS },
    year = {2001},
    pages = {849--856},
    publisher = {MIT Press}
}](http://ai.stanford.edu/~ang/papers/nips01-spectral.pdf)
