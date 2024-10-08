####------------------------------------------------------------------------####
####------------------------------------------------------------------------####
####                              Lesson 2                                  ####
####------------------------------------------------------------------------####
####------------------------------------------------------------------------####


####------------------------------------------------------------------------####
####               **Paso 1:** Entiende tu entorno.                         ####
####------------------------------------------------------------------------####


# Primero vamos a aprender como movernos por la interfaz. Hay 4 paneles básicos:
# 1. Panel de archivos o scripts. Donde se escriben las órdenes. (Este)
# 2. El panel de la terminal, la consola y los jobs. Donde se cargan las órdenes.
# 3. El panel de files, plots,.... Principalmente usado para graficas, la ayuda, 
# y localizar archivos.
# 4. El panel de Environment,....Donde se guardan los datos, variables,....
# Cada uno se verá en su momento.

# Centrémonos en el primer panel. Observa que si no escribes con # delante, el color cambia
# Por ejemplo:

estonoestexto

# Para cargar lineas de ordenes se suelen usar el boton de run que esta arriba o Ctrl.+Enter.
# Prueba a cargar la orden de antes:

estonoestexto

# Te devuelve un error. Esto es porque las ordenes se dividen en tres tipos:
# 1. Ordenes del tipo respuesta. Te pido algo y lo muestras. Por ejemplo:

1+1
# [1] 2, esto dice: de tu orden [1] (la primera) el valor es 2.

# 2. Ordenes del tipo guardado o saving. Haz esto y guardalo aqui. Por ejemplo:

a <- 2
# Comprueba que ahora a es 2 cargando la siguiente linea
a

# 3. Ordenes del tipo carga (pero no muestra nada). Por ejemplo el uso de un comando 
# predefinido. Ya lo veremos al definir nuestras propias funciones.

# Ahora te invito a que experimentes. Guarda dos numeros a las siguientes variables.
# Despues carga la linea de la orden que da su suma.
b <- 
c <-
b+c

# Antes del Paso 2, mira que debajo de este panel pone un simbolo de # con el 
# nombre del Paso 1. Si le clicas, tendras acceso a un listado de todo lo comentado 
# en tu codigo acabado con 4 simbolos iguales (#,o -) al final.

# esto1 ####
# esto2 ----

####------------------------------------------------------------------------####
####               **Paso 2:** R tu mejor calculadora.                      ####
####------------------------------------------------------------------------####


# Ya has comprobado en los ejemplos que puedes guardar variables.
# Tambien has cargado una operacion suma. 
# En R puedes hacar operaciones aritmeticas basicas de todo tipo. 
# Te las enuncio antes de practicarlas

# Suma: +
2+3
# Resta: -
2-3
# Producto: *
2*3
# Division: / 
2/3
# Potencia de un numero: **, ^
2**3
2^3
# Division entera o modulo: %%
4%%2
5%%2
# Logaritmo neperiano: log( )
log(2)
# Logaritmo en base 10: log10( )
log10(10)
# Exponencial (clasica): exp( )
exp(2)

# El orden de operacion es de derecha a izquierda y se respeta el orden convencional
2+3^4
# 84, de izquierda a derecha seria 625

# Practica las operaciones con los siguientes valores.
d <- 2
e <- 3
f <- 17
# Replica la siguiente operacion usando numeros
d*f/log(3)


# Hay operaciones predefinidas que no son operaciones en si, pero sirven de la 
# misma manera.    
# round(x,num.decimales), que te redondea segun el numero de decimales que quieras
round(log(2),4)
# Veremos mas a su debido tiempo

####------------------------------------------------------------------------####
####                 **Paso 3:** R, no solo son numeros                     ####
####------------------------------------------------------------------------####

# Dentro de R hay varios tipos de formatos basicos. Algunos son:
# numeric: numeros a secas.
class(2)
# character: texto o simbolos entre "." o '.'
class("a")
# logical: son valores booleanos, TRUE o FALSE
class(TRUE)

# Hay otro tipo de formato de orden superior. Los vectores, listas o tupas.
# Otros lenguajes distinguen entre los tres, R no lo hace. Ejemplo:
x <- c(2,3,4,"a")
x
# Todas los vectores se escriben empezando por c(, posteriormente se ordenan los
# elementos que se quieran tener y se cierra con otro )

# Es importante entender que se pueden operar con vectores SIEMPRE Y CUANDO SEAN 
# ENTRADAS NUMERICAS.
p <- c(2.9,3.123,4.409)
q <- c(5,6,7)
p+q
p*q
# Habras observado que se hace entrada a entrada la operacion.

# Tambien se puede usar las operaciones definidas
log(p)
exp(p)
round(p,2)

# Y, excepcionalmente, se puede operar todas las entras con un unico numero tambien
1+p
8*p

# Observa que solo se pueden operar dos vectores si son de la misma longitud
length(p)
length(q)
# O, uno de ellos es un unico numero.
# Esto se debe a que un vector de un unico elemento numerico o un numero, es lo mismo
3 == c(3)

####------------------------------------------------------------------------####
####                      **Paso 4:** R tiene logica                        ####
####------------------------------------------------------------------------####

# Dentro del tipo de formatos logical, podemos hacer operaciones logicas. Son:

# ==: para ver si dos objetos son iguales
2 == 2
2 == 3
# >=, <=, <, >: para ver si son mayores iguales, menores iguales, menores o mayores (resp.)
2 <= 3
2 >= 4
3 > 5
3 < 7

# Observa, que aplicarlo a un vector, te devuelve el resultado para cada entrada
p <= 3
q >= 5.5

# Podemos comprobar varias operaciones logicas a la vez
# AND: &&. Debe cumplir ambas condiciones a la vez.
2 <= 4 && 4 >= 5
# OR: ||. Debe cumplir una de las condiciones unicamente
2 <= 4 || 4 >= 5

# Es interesante que veas como funcionan los operadores logicos
# TRUE = 1
# FALSE = 0
TRUE*TRUE
TRUE*FALSE
FALSE*TRUE
FALSE*FALSE

# Y observa tambien que estan asociado los valores numericos dichos anteriormente 
# a operaciones.
TRUE*(2+2)
FALSE*(2+2)

# OJO: Puede dar fallos a veces, hay que usar con cuidado.


####------------------------------------------------------------------------####
####                      **Paso 5:** R lo creas tu                         ####
####------------------------------------------------------------------------####

# En R se pueden definir funciones desde cero. La forma es la siguiente
# [nombre de la funcion] <- function(nombres variables entrada por comas){
#   Operaciones
#   return(variable de salid)
# }
# POr ejemplo:

suma <- function(x,y){
  return(x+y)
}

# Para usarla, se escribe: [nombre de la funcion](variables entrada por comas)
suma(2,3)

# Observa que si le das un valor desconocido te lo avisara
suma(2,w)

# OJO: el nombre de la funcion debe de ser escrito seguido, sin espacios, no acentos,
# y evitar funciones predefinidas.

# Lo impresionante de R es que puedes definir lo que quieras, solo necesitas tiempo 
# y experiencia.
# Pero OJO: puedes definir cosas que sean demasiado complejas sin necesidad.
# HAY QUE PENSAR ANTES DE PROGRAMAR NADA
# Por ejemplo: Defino otra funcion suma que es mas compleja
suma_mala <- function(x,y){
  z <- round(y/10,0)
  return(x+(z>0)*z+(y-z))
}
suma_mala(2,4)
suma_mala(2,12)


# Ahora pasa al archivo de Ejercicios_2.R







