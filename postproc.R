options(echo=FALSE)  
# postproc.R - Read data from .RData file(s)

# Command line arg indicates number of subdirs
args <- commandArgs(TRUE)
if (length(args) > 0) {
  count <- args[1]

  # Create variable to hold collected data
  # WARNING: Not checking if arg is number!
  collection <- rep(0, times=count)
  
  # Read in R data from each subdir
  for (i in 1:count) {

    # Create path/filename to new .RData
    # WARNING: Assumes 2-digit subdir length!
    path = sprintf("%02d/.RData",i)

    # Get new .RData
    attach(path,warn=FALSE)

    # Get value of 'outputs' variable saved in .RData
    collection[i] <- outputs
  }
} else { 
  # No arg: one .RData file in current dir
  count <- 1
  attach(".RData",warn=FALSE)
  collection <- outputs
}

# Do applicaiton-specific logic here
print(collection)
plot(collection)
