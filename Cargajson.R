library("rjson")

# Give the input file name to the function.
result <- fromJSON(file = 'C:/Users/jchavezc1000/Documents/GitHub/R/input.json')
print(result)
result[1,]
archivocsv <- read.csv(file ="C:/Users/jchavezc1000/Documents/GitHub/R/Datafile.csv", header= FALSE, sep=",")

