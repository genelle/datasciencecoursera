## These functions collectively compute the inverse of a matrix
## by either calculating the inverse or retrieving it from the cache
## if it has already been calculated

## Creates special list that contains functions to get/set the vector and
## get the cache if applicable/set the inverse of a matrix

makeCacheMatrix <- function(x = matrix()) {
    s <- NULL
    set <- function(y) {
        x <<- y
        s <<- NULL
    }
    get <- function() x
    setinverse <- function(solve) s <<- solve
    getinverse <- function() s
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## Computes the inverse of a matrix. If inverse has been calculated,
## it retrieves it from the cache

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    s <- x$getinverse()
    if(!is.null(s)) {
        message("getting cached data")
        return(s)
    }
    data <- x$get()
    s <- solve(data, ...)
    x$setinverse(s)
    s
    
}
