## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
# makeCacheMatrix creates a list containing a function which
# set the value of the matrix
# get the value of the matrix
# set the value of the matrix inverse
# get the value of the matrix inverse
makeCacheMatrix <- function(x = matrix()) {
  inv<-NULL
  set<-function(y){
    x<<-y
    inv<<-NULL
  }
  get<-function() x
  setinv<-function(inverse) inv <<- inverse
  getinv<-function() inv
  list(set=set, get=get, setinv=setinv, getinv=getinv)
}


## Write a short comment describing this function
# This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
# If the inverse has already been calculated (and the matrix has not changed), then cacheSolve should retrieve the inverse from the cache.
# Function assumes that the matrix supplied is always invertible.
cacheSolve <- function(x, ...) {
  inv<-x$getinv()
  if(!is.null(inv)){
    message("getting cached data.")
    return(inv)
  }
  data<-x$get()
  inv<-solve(data)
  x$setinv(inv)
  inv
}
