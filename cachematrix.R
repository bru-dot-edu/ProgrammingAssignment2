## These two functions are used to create a special 
## matrix and cache its inverse. 


## makeCacheMatrix creates a special "matrix" which contains four functions
## to set and get the value of the matrix, and set and get the 
## inverse of the matrix
makeCacheMatrix <- function(x = matrix()) {
        i <- NULL
        set <- function(y) {
                x <<- y
                i <<- NULL
        }
        get <- function() x
        setinv <- function(inv) i <<- inv
        getinv <- function() i
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}


## The following functino calculates the inverse of the special matrix created
## with the above function. It first checks to see if the inverse has already
## been calculated.

cacheSolve <- function(x, ...) {
        i <- x$getinv()
        if(!is.null(i)) {
                message("getting cached data")
                return(i)
        }
        data <- x$get()
        i <- solve(data, ...)
        x$setinv(i)
}







