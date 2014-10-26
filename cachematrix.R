## This function returns a list of several functions that can be used to "set()" the
## originally passed matrix as globally defined and "get()" (return) the originally 
## passed matrix. It also provides the functionally to calculate the inverse, and 
## return the inverse.

# The below code has been tested and confirmed to run as intended.

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(solve) {
                m <<- solve
        }
        getinverse <- function() {
                m
        }
        list(set = set, 
             get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## This function receives the list returned by the "makeCacheMatrix" function.
## If the inverse has been calculated before (this occurs when "m" is not null),
## this function returns the previously calculated inverse, otherwise this function 
## uses the functions supplied in ""makeCacheMatrix" to return the original
## matrix, solve for the inverse, and cache/return the newly calculated inverse.

# The below code has been tested and confirmed to run as intended.

cacheSolve <- function(x, ...) {
        m <- x$getinverse()
        if(!is.null(m)) {
                print("Retrieving cached inverse...")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
}
