## Put comments here that give an overall description of what your
## functions do

## Special matrix type able to cache inverse calculations.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  getinv <- function() {
    if (is.null(m)) {
      m <<- solve(x)
      m
    } else {
      message("getting cached data")
      m
    }
  }
  list(set = set, get = get, getinv = getinv)
}


## It is just a wrapper, the special type handles the caching.

cacheSolve <- function(x, ...) {x$getinv()}
