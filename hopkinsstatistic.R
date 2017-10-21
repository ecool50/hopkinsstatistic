require(FNN)

# follows the wiki definition of H
# INPUTS
#      A dara matrix x
#      How many points to sample n
#      Any other parameters for FNN
# OUTPUT
#     A list with  
#     (1) H statistic (it is 1-H from clustertend)
#     (2) sum of distances for the random data q
#     (3) sum of distances for the real (sampled) data w
hopkins.FNN <- function(x, n, ...) {
  
  N <- nrow(x)
  D <- ncol(x)
  
  stopifnot(n<N)
  
  # sample n data points
  i <- sample(1:N, n)
  # find nearest neigh of the sampled points 
  # exclude the sampled points from search
  w <- knnx.dist(data=x[-i,], query=x[i,], k=1, ...)
  w <- sum(w[,1])
  
  # create uniformaly distributed random matrix
  mini <- apply(x, 2, min)
  maxi <- apply(x, 2, max)
  xr <- matrix(NA, nrow=n, ncol=D)
  for(i in 1:D) {
    xr[,i] <- runif(n, min=mini[i], max=maxi[i])
  }
  # find the nearest neighbors of the random points
  q <- knnx.dist(data=x, query=xr, k=1, ...)
  q <- sum(q[,1])
  
  # Hopkins statistic
  H <- q/(q+w)
  
  return(list(H=H, q=q, w=w))
}

# repeat the Hopkins statistic calculation
hopkins.repeat <- function(x,n=round(0.1*nrow(x)),nrep=100,...) {
  hops <- rep(NA, nrep)
  for(i in 1:nrep) hops[i] <- hopkins.FNN(x,n,...)$H
  return(hops)
}
