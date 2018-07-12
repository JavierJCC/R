#Cargamos las libreria 
library(RMySQL)
library(DBI)

# Cargar archivos cvs desde java 
archivocsv <- read.csv(file ="/home/javis/Documentos/R/Datafile.csv", header= FALSE, sep=",")

print(archivocsv)

len<-dim(archivocsv)

cat("EL numero de columnas es: ", len[1])
cat("El numero de filas es: ", len[2])

ConectarBD<-function(len, archivocsv){
  #Campos para conectar a base de datos 
  COntrasena<-""
  USuario<-"root"
  HOstz<-"127.0.0.1"
  NOmbreBD<-"BasepruebasR"
  
  mydb <- dbConnect(RMySQL::MySQL(),
                    dbname = NOmbreBD,
                    host = HOstz,
                    port =3306,
                    user=USuario,
                    password=COntrasena
                   )
  dbListTables(mydb)
  #Creamos una consulta a la base de datos 
  result = dbSendQuery(mydb, "select * from Usuario")
  # Store the result in a R data frame object. n = 5 is used to fetch first 5 rows.
  data.frame = fetch(result, n = 5)
  print(data.frame)
}

ConectarBD(len, archivocsv)


