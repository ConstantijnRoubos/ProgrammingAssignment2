# Goals
# The main goal of the functions that are defined below is to invert a matrix.
# The secondary goal is to cache the result and retrieve it when the same matrix
# is called again. These goals can achieved by combining the 2 functions that 
# are defined below. 
# 
# Function1:MakeCachematrix
# The MakeCacheMatrix function takes a matrix as argument. It builds a set of 
# functions and returns these functions within a list to the parent environment.
# This results in an object (a matrix) that contains 4 functions: 
# get, set, getmatrix and setmatrix. It also returns two data object x and m.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setmatrix <- function(matrix) m <<- matrix
  getmatrix <- function() m
  list(set = set, get = get,
       setmatrix = setmatrix,
       getmatrix = getmatrix)
}
#Function2: CacheSolve
#The cacheSolve functions takes the Makecachematrix function as input and is 
#incomplete without it. It uses the "getmatrix" function to get the value of m 
#in the makeCacheMatrix function. It then tests if this value is NULL. If it is 
#NULL it will create the inverse from the matrix and set this value in 
#MakeCachematrix. If the value was not NULL it will get the last value from m 
#within Makecachematrix. 

cacheSolve <- function(x, ...) {
  m <- x$getmatrix()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
    data <- x$get()
    m <- solve(data, ...)
    x$setmatrix(m)
    m
        ## Return a matrix that is the inverse of 'x'
    
}
