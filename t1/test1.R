options(echo=FALSE) 
# test1.R - Read data (cmd line or data file), 
# plot data, add together, save in .RData

args <- commandArgs(TRUE) # Only "--args..."

# First arg numeric? 
if (suppressWarnings(!is.na(as.numeric(args[1])))) {
  # Input data is on cmd line.   
  inputs <- args[1:2]
} else {  
  # Arg is name of data file
  inputs <- scan(args[1],skip=1,what=" ",nlines=1)
  inputs <- inputs[2:3] 
}

if (args[length(args)] == "snow") { 
  # Create snow "cluster" workers to test parallel job
  library(snow)
  cl <- makeCluster(50) # Single Hansen node has 48 cores

  # Do application-specific logic here (this just shows node numbers)
  names <- do.call("rbind", clusterCall(cl, function(cl) Sys.info()["nodename"]))
  cat(names,sep="\n")
  
  stopCluster(cl)
}

# Do application-specific logic here (this just plots & adds 2 numbers)
plot(inputs)  # Creates PDF
outputs <- as.numeric(inputs[1]) + as.numeric(inputs[2])  
cat("Args=",args," Inputs=",inputs," Outputs=",outputs,"\n")


