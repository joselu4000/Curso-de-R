####------------------------------------------------------------------------####
####------------------------------------------------------------------------####
####                              Lesson 4                                  ####
####------------------------------------------------------------------------####
####------------------------------------------------------------------------####

####------------------------------------------------------------------------####
####         **Paso 1:** R como hoja de calculo. Lectura de datos           ####
####------------------------------------------------------------------------####

# R trabaja con un tipo de estrutura similar a la matrix. Esta se puede entender 
# como una hoja de calculo tambien. Se llama dataframe.
# Veamos un ejemplo cargando los datos que estan en la carpeta.

# Para cargar datos hay dos maneras fundamentales:
#### Primera: Usar una libreria especifica y su orden asociada para la carga.
# La libreria es la siguiente: readxl. 
# Antes de usarla, si no se hizo antes se debe de instalar:
install.packages("readxl") 

# Para posteriormente cargar la libreria se usa:
library(readxl)

# Para leer el archivo requerimos un path o camino. 
# En la barra del Menu superior, pulsa Session, pulsa Set Working Directory, y Choose Directory
# En la ventana que te aparece busca la carpeta que destinaste al Curso,
# y en el caso de tenerla, en la subcarpeta donde este este script.
# Observa que en Consola se carga una orden de la forma:
# setwd(path), con path algo entre comillas.
# Copia el interior de la orden, y guardadolo asi:
#
# path_principal <- path
#
# En mi caso es:
path_principal <- "C:/Users/JoseLuisLopezCarmona/Desktop/Curso de R/Lesson 4"
# Y ahora nuestro camino para los datos es el mismo pero dentro de las comillas
# añadimos /data/datosLesson_4.xlsx. En mi caso es:
path_data <- "C:/Users/JoseLuisLopezCarmona/Desktop/Curso de R/Lesson 4/data/datosLesson_4.xlsx"

# Y la orden basica para cargar los datos es:
datos <- read_xlsx(path_data)
# Ahora la informacion esta en la variable datos. 
datos
# U otra forma de verlo mas visual es usando la orden View(), que saca una ventana nueva.
View(datos)

#### Segunda: Usar la interfaz de Rstudio.
# Situate en el panel de Environment. Observa aue hay un boton que dice: Import Dataset
# Clica en el, y clica en From Excel. Busca en el Browse: datosLesson_4.xlsx en la carpeta data 
# y dale a Import.
# Observa que es todo igual a excepcion del nombre de la variable donde guardas los datos
# En mi caso cargo:
# > library(readxl)
# > datosLesson_4 <- read_excel("data/datosLesson_4.xlsx")
# > View(datosLesson_4)

####------------------------------------------------------------------------####
####              **Paso 2:** R como hoja de calculo. Dataframe.            ####
####------------------------------------------------------------------------####

# Retomando lo anterior. La estructura tipo dataframe es todo lo que una hoja de 
# calculo o excel es.
class(datos)
# Observa que manifiesta ser una tabla: "tbl", un dataframe: "data.frame", y una 
# tabla dataframe: "tbl_df".

# Para acceder a una columna de datos hay dos formas: la posicion de la misma (datos[,p])
# o como un dataframe: datos$nombre_columna
datos$Nombre
datos$`Peso(kg)`
datos[,3]
datos[,4]
# Observa el tipo de formato de cada salida
class(datos$Nombre)
class(datos$`Peso(kg)`)
class(datos[,3])
class(datos[,4])
# La diferencia esta en que con la [,p] sacas una parte de la tabla (entiendase 
# similar a matrix) del total, y con $ sacas exactamente esa columna. 
# Con [,p] puede sacar varias:
datos[,c(2,3)]
# Esto se puede con tablas, matrices y dataframe.
# Sin embargo, con $ no se puede.

#### Nota 1: Observa que datos[,c(-1)], es el conjunto datos quitando la columna 1 ####
datos[,-1]

# Se pueden operar columnas de dataframe, mientras su formato sea numerico:
datos$`Peso(kg)` - datos$`Altura(cm)`

####------------------------------------------------------------------------####
####              **Paso 3:** R como hoja de calculo. Cambios formatos.     ####
####------------------------------------------------------------------------####

# Los cambios de formatos, tipos de datos son esenciales.
class(datos$Sexo)
# Observa que la variable Sexo dice que son character. Para nosotros el sexo es una variable
# categorica, factor en R. Para cambiar el formato existen muchos comandos.
# En este caso:
datos$Sexo <- as.factor(datos$Sexo)
class(datos$Sexo)
datos$Sexo
# Hemos reescrito la columna de la variable Sexo como factores.

# Otros cambios de formatos de datos son:
# as.numeric(), transforma en un vector numerico (solo si son numeros).
x <- c("1","3")
as.numeric(x)
# as.matrix(), transforma los datos en una matrix de las mismas dimensiones.
as.matrix(datos[1:3,2:4]) 
# as.vector(), transforma los datos en un vector.
datos[,2]
as.vector(datos[,2])
# as.list(), transforma los datos en listas.
as.list(datos)
# as.data.frame(), transforma los datos en dataframe.
A <- as.matrix(datos[1:3,2:4])
class(A)
as.data.frame(A)
# Y un conocido ya, unlist(), que deshace una lista como vectores.
L <- as.list(datos[,2:3])
L
unlist(L)

####------------------------------------------------------------------------####
####          **Paso 4:** R como hoja de calculo. Estadistica descriptiva.  ####
####------------------------------------------------------------------------####

# Las hojas de calculo son archiconocidas por ser usadas para hacer estadisticas.
# En R podemos igualmente hacerlas.

# Las ordenes media, desviasion estandar, varianza, max, min, mediana y los 
# quantiles principales son:
x <- datos$`Peso(kg)`

mean(x)
sd(x)
var(x)
max(x)
min(x)
median(x)
quantile(x)

# Y hay una forma rapida de sacar todas las estidisticas basicas de todas las variables
summary(datos)
# Observa que las variables character no ofrecen nada, y las factor (como Sexo) 
# dan un conteo de cada factor (clase).


####------------------------------------------------------------------------####
####    **Paso 5:** R como hoja de calculo. Representacion grafica basica.  ####
####------------------------------------------------------------------------####

# R, de forma muy sencilla, permite graficas. La orden es la siguiente:
#
#plot(x,y, options)
#
# Dentro de optiones se puede enumerar un sin fin de parametros que configuran la grafica
y <- datos$`Altura(cm)`

plot(x,y)
# Esta orden asocia a cada valor de x el valor de misma posicion de y.
# Observa que por defecto son puntos negros. Añadamos unas configuraciones basicas
plot(x,y,
     col = "red",              # color, predefinido o explicito
     type = "l",               # "l" indica que es una linea, "p" que es un punto
     main = "Peso vs Altura",  # Titulo de la grafica
     ylim = c(130,190),        # Limites del ejeY (vertical)
     xlim = c(40,110),         # Limites del ejeX (horizontal)
     xlab = "Peso (kg)",       # Nombre del ejeX
     ylab = "Altura (cm)",     # Nombre del ejeY
     lwd = 3                   # Grosor de trazo
     )
    
# Observa que la linea no es recta, pues te une el trazo segun aparecen en x e y
# Por verlo mejor, hagamos unos cambios:
Ox <- sort(x, decreasing = TRUE) # ordenamos x en orden descendiente 
Oy <- sort(y, decreasing = FALSE) # ordenamos y en orden creciente
#
plot(Ox,Oy,
     col = "blue",              # color, predefinido o explicito
     type = "l",               # "l" indica que es una linea, "p" que es un punto
     main = "Peso vs Altura Ordenado",  # Titulo de la grafica
     ylim = c(130,190),        # Limites del ejeY (vertical)
     xlim = c(40,110),         # Limites del ejeX (horizontal)
     xlab = "Peso (kg)",       # Nombre del ejeX
     ylab = "Altura (cm)",     # Nombre del ejeY
     lwd = 3                   # Grosor de trazo
)


# Otra forma de graficar puntos es:
points(x,y)
# Observa que se sobrepone al plot. Esto es porque points requiere al menos de un plot previo

plot(c(),c(), xlim = c(40,110), ylim = c(130,190))
points(x,y)
# Pero todas las configuraciones se han de hacer en el plot previo.

# Veamos un ejemplo de grafica mas interesante. 
# Vamos a pintar los Hombres de rojo y las Mujeres de azul en una grafica del 
# tipo anterior: Peso vs Altura. 

colores <- ifelse(datos$Sexo == "Hombre", "red","blue")
plot(x,y,
     col = colores,              # color, predefinido o explicito
     type = "p",               # "l" indica que es una linea, "p" que es un punto
     main = "Peso vs Altura",  # Titulo de la grafica
     ylim = c(130,190),        # Limites del ejeY (vertical)
     xlim = c(40,110),         # Limites del ejeX (horizontal)
     xlab = "Peso (kg)",       # Nombre del ejeX
     ylab = "Altura (cm)",     # Nombre del ejeY
     lwd = 3,                  # Grosor de trazo
     pch = 3                   # Forma del punto <------------------------------------
)

# Ya puedes observar que existe una clara diferencia entre hombres y mujeres, 
# al menos graficamente. Pero recuerdan que las graficas pueden engañar
plot(x,y,
     col = colores,              # color, predefinido o explicito
     type = "p",               # "l" indica que es una linea, "p" que es un punto
     main = "Peso vs Altura",  # Titulo de la grafica
     ylim = c(10,1900),        # Limites del ejeY (vertical)
     xlim = c(0,200),         # Limites del ejeX (horizontal)
     xlab = "Peso (kg)",       # Nombre del ejeX
     ylab = "Altura (cm)",     # Nombre del ejeY
     lwd = 3,                  # Grosor de trazo
     pch = 3                   # Forma del punto <------------------------------------
)

# Puesto asi parecen mas iguales
plot(x,y,
     col = colores,              # color, predefinido o explicito
     type = "p",               # "l" indica que es una linea, "p" que es un punto
     main = "Peso vs Altura",  # Titulo de la grafica
     ylim = c(-500,500),        # Limites del ejeY (vertical)
     xlim = c(-1000,2000),         # Limites del ejeX (horizontal)
     xlab = "Peso (kg)",       # Nombre del ejeX
     ylab = "Altura (cm)",     # Nombre del ejeY
     lwd = 3,                  # Grosor de trazo
     pch = 3                   # Forma del punto <------------------------------------
)
# Y asi casi iguales.
# Por ello, hay que hacer test estadistico. Los veremos mas adelante.

# Ahora te emplazo a los Ejercicios_4.R








