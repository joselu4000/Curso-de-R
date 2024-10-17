####------------------------------------------------------------------------####
####------------------------------------------------------------------------####
####                            Ejercicios 4                               ####
####------------------------------------------------------------------------####
####------------------------------------------------------------------------####

####                      Previa creacion de datos                          ####
# Para comenzar los ejercicios primero vamos a crear datos aleatorios.
# -) Cogemos los numeros del 1 al 200: como longitud de las de aves en cm
ala.long <- 1:200
#
#### Nota: Observa que escribir con puntos no es problema en R #####
#
# -) Ahora el ancho del ala, del 1 al 50 (cm)
#
ala.anch <- 1:50
#
# -) Sexo: macho o hembra
#
sex <- c("macho","hembra")
#
# -) Origen: tropical, mediterraneo o pacifico
#
orig <- c("tropical","mediterraneo","pacifico")

# Ahora de forma aleatoria vamos a crear una base de datos que cogera valores de 
# nuestros generados y crear distintos tipos de pajaros
#
n <- 50 # la cantidad de datos a crear
#
# Usamos la orden sample(x, length.out = n, replace = TRUE): para crear tantos 
# datos como queramos permitiendo que repita incluso (replace=TRUE).
# Creamos un data.frame vacio con 4 columnas y n (50) filas
#
pajaros <- as.data.frame(matrix(ncol = 4, nrow = n))
# Imponemos que las columnas tengan los siguientes nombres:
colnames(pajaros) <- c("longitud","ancho","sexo","origen")
#
# Ahora introducimos cada columna en su sitio. Como son procesos aleatorios, para
# poder replicar el codigo, vamos a fijar antes una semilla.
set.seed(29122000) # el numero vale cualquiera
#
pajaros$longitud <- sample(ala.long, n, replace = TRUE)
pajaros$ancho <- sample(ala.anch, n ,replace = TRUE)
pajaros$sexo <- sample(sex, n ,replace = TRUE)
pajaros$origen <- sample(orig, n, replace = TRUE)
View(pajaros)

# Guardamos los datos en nuestra carpeta de datos. Usamos la siguiente libreria
# y orden
install.packages("openxlsx") # si no lo instalaste antes
library(openxlsx)
# si mantienes el directorio de la Lesson_4.R basta esto.
# En otro caso, debes establecer primero el directorio y cargar la orden.
write.xlsx(pajaros, file = "data/pajaros.xlsx")

####------------------------------------------------------------------------####
####                                 1)                                     ####
####------------------------------------------------------------------------####

# Ahora estudia el tipo de formato que tiene cada columna. 


# Asegurate que si una variable es de tipo categorica este guardada asi en su columna.
# Idem con las numericas


####------------------------------------------------------------------------####
####                                 2)                                     ####
####------------------------------------------------------------------------####

# Genera la estadistica descriptiva basica de las variables.


# **Razona:** ¿Hay diferencias segun el sexo? ¿Y segun la region?


####------------------------------------------------------------------------####
####                                 3)                                     ####
####------------------------------------------------------------------------####

# Haz la grafica de las dos variables cuantitativas: longitud y ancho.


# Ahora diferencia mediante colores los distintos origenes.


# Añade a la anterior, una forma de diferenciar segun el sexo.

####------------------------------------------------------------------------####
####                                 4)                                     ####
####------------------------------------------------------------------------####

# Genera una funcion que dado dos vectores te genere una grafica con una configuracion 
# a tu eleccion
grafica <- function(x,y,){
  # Completa tu
}


# Comprueba que funciona:
grafica(pajaros$longitud,pajaros$ancho)


# Te emplazo a Check_4.R o a la carpeta de Lesson 5.