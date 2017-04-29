using DataFrames
using Gadfly
using Clustering
using GraphPlot
using Graphs
using Colors
using Fontconfig
using Cairo

GRAPH_FILE = "data/example1.dat"
k = 4
println("Generating eigendecomposition of Laplacian matrix...")
E = readtable(GRAPH_FILE, header = false, names = [:from, :to])
from = E[:from]
to = E[:to]
m = n = max(maximum(from),maximum(to))
As = sparse(from, to, 1, m, n, (x,y) -> x*y)
A = Symmetric(full(As)) # Constructed from the upper triangle.
degrees = vec(sum(A,2))
D = full(Diagonal(degrees))
L = D^(-1/2)*A*D^(-1/2)
eigendecomposition = eigfact(L)
λ = eigendecomposition[:values] # Sorted eigenvalues
v = eigendecomposition[:vectors] # Corresponding eigenvectors
X = v[:,end-k:end] # k-biggest eigenvectors
X_norm2 = sqrt(sum(X.^2,2))
Y = Array{Float64}(size(X))
for i=1:size(X,1), j=1:size(X,2)
  Y[i,j] = X_norm2[i] > 0 ? X[i,j] / X_norm2[i] : 0
end

# K-means in the new subspace
println("Clustering...")
R = kmeans(Y', k; maxiter=2000, display=:iter)

# the number of resultant clusters should be k
@assert nclusters(R) == k

# obtain the resultant assignments
# a[i] indicates which cluster the i-th sample is assigned to
clusters = assignments(R)

println("Generating graph clustering (.png)...")
# nodes membership
nodecolor = [colorant"lightseagreen", colorant"orange",colorant"red",
            colorant"violet", colorant"blue"]
# membership color
nodefillc = nodecolor[clusters]
vlist = [ KeyVertex(i, i) for i=1:m ]
elist = [ Edge(e[1], vlist[e[2]], vlist[e[3]]) for e=zip(1:size(E,1),E[:from],E[:to]) ]
g = graph(vlist, elist, is_directed = false)
draw(PNG("example-k4.png", 16cm, 16cm),gplot(g,nodefillc=nodefillc))
