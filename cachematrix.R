## Put comments here that give an overall description of what your
## functions do
##  write a pair of functions that cache the inverse of a matrix

## Write a short comment describing this function
##This function creates a special "matrix" object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <-function(y){
                x <<- y
                inv <<- NULL
        }
        
        get <- function() x
        setinv <- function(i) inv <<-i
        getinv <- function() inv
        list(set=set, get=get, 
             setinv=setinv, getinv=getinv)
        
}


## Write a short comment describing this function
## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
##If the inverse has already been calculated (and the matrix has not changed), 
##then the cachesolve should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
        inv <- x$getinv()
        if(!is.null(inv)) {
                message("getting cached inverse matrix")
                return(inv)
        }
        
        data<-x$get()
        inv <- solve(data, ...)
        x$setinv(inv)

        ## Return a matrix that is the inverse of 'x'
        inv
}
