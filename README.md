# Spectral-Clustering
Graph clustering in Julia using the spectral properties of the affinity matrix of a graph.

## Spectral clustering
Reformulation of intra-cluster and inter-cluster similarity as a cost function defined by the Laplacian matrix decomposition of a graph.
The maximization of the cost function is given by the first k eigenvalues. The corresponding eigenvectors become a normal basis and lower
dimensionality manifold that can be clustered using k-means.

## Results

K = 2

![alt text](https://github.com/mrquant/Spectral-Clustering/blob/master/example-k2.png "k = 2")


K = 4

![alt text](https://github.com/mrquant/Spectral-Clustering/blob/master/example-k4.png "k = 4")

## References

[   Spectral Clustering: Analysis and an algorithm,
    author: Andrew Y. Ng and Michael I. Jordan and Yair Weiss,
    ADVANCES IN NEURAL INFORMATION PROCESSING SYSTEMS,
    2001
}](http://ai.stanford.edu/~ang/papers/nips01-spectral.pdf)
