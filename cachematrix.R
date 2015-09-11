## the functions allow the user to inverse a matrix and store the result in a cheched varaible
# so when the same matrix is called it won't be needed to calculate the inverse matrix again.

## Write a short comment describing this function

#the function can set a specail cache matrix,
#can get the specail matrix,
#can set the inverse of the specail matrix,
#can return the inverse of the specail matrix 
makeCacheMatrix <- function(x = matrix()) {
        
        w <- NULL
        set <- function(y) {
                x <<- y
                w <<- NULL
        }
        get <- function() x
        setinverse <- function(inv) w <<- inv
        getinverse <- function() w
                list(
                set = set,
                get = get,
                setinverse = setinverse,
                getinverse = getinverse
                )
        
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        w <- x$getinverse()
        if(!is.null(w)) {
                message("getting cached data")
                return(w)
        }
        
        m <- x$get()
        
        ##solve(A) = Inverse of A where A is a square matrix.
        w <- solve(m, ...)
        x$setinverse(w)
        w
        
}

#temp data to check functions
matinsert <- matrix(rexp(16), 4)
matinsert
mat = makeCacheMatrix(matinsert)
mat
cacheSolve(mat)
