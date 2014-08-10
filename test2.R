options(echo=FALSE) 
# test2.R - Read data from data file with hardcoded name 

inputs <- scan('data.template',skip=1,what=" ",nlines=1)
inputs <- inputs[2:3] 

# Do application-specific logic here (this just plots & adds 2 numbers)
plot(inputs)  # Creates PDF
outputs <- as.numeric(inputs[1]) + as.numeric(inputs[2])  
cat(" Inputs=",inputs," Outputs=",outputs,"\n")


