####------------------------------------------------------------------------####
####------------------------------------------------------------------------####
####                              Lesson 3                                  ####
####------------------------------------------------------------------------####
####------------------------------------------------------------------------####


####------------------------------------------------------------------------####
####             **Paso 1:** R, cicle du temps: for                         ####
####------------------------------------------------------------------------####


# R, permite crear los conocidos como bucles, que son estructuras que segun un vectores
# de items repiten un conjunto de acciones de forma automatica.
# En general, tienen la siguiente estructura:
#
# for (elemento in vector_elementos){
#   accion_1
#   accion_2
#   ...
#   accion_n
# }
#
# Un ejemplo concreto, queremos sumar los numeros del 1 al 10 de uno en uno. 
# Comenzamos con la suma de 1+2, después de (1+2)+3,.... Entonces, vamos acumulando 
# la suma anterior. Al inicio de nuestra suma, la suma acumulada es 0

suma_acumulada <- 0 # Comenzamos por 0
for (x in c(1:10)){ # Observa que le estamos diciendo que tome los x del vector c(1,2,...,10)
  # Aqui se actualiza el valor:
  suma_acumulada <- suma_acumulada + x 
  # Se traduce como: al valor suma_acumulada guardale el valor suma_acumulada + x,
  # donde x ira variando segun el vector c(1,2,...,10)
}
suma_acumulada 

# Comprobamos que sale lo mismo que usando la orden sum(vector), que suma los 
# elementos de una vector
suma_acumulada == sum(c(1:10))

# Podemos usar el bucle tipo for para cualquier accion que requiramos recorrer un 
# objeto elemento a elemento con detalle.
# Un par de ejemplos mas:

## Ejemplo 1: Funcion producto con bucle for.
# La idea es definir una funcion que defina el producto con un bucle tipo for.
# Recordar que el producto es una suma consecutiva, de manera que, al decir 
# 2*3, esta queriendo decir que sumas 2 con el mismo 3 veces: 2+2+2.
# Por simplicidad asumimos que es entre numero negativos:
#
producto <- function(x,y){
  # x*y = x+...+x, y veces.
  resultado <- 0 # Iniciamos con 0 porque no hemos sumado nada aun
  for (i in c(1:y)){
    resultado <- resultado + x
  }
  # Que no se olvide return() o no tiene porque mostrar nada la funcion, aunque 
  # haga el calculo
  return(resultado)
}
producto(2,3)

# Y puedes comprobar que sale lo mismo que el producto.
producto(2,3) == 2*3

## Ejemplo 2: Bucle tipo for para crear un texto.
# La idea es, dada una vector de palabras, generar la frase con espacios incluidos
palabras <- c("Esto","si","es","un","texto") # nuestras palabras
# Para juntar las palabras vamos a usar la orden paste(), que dados elementos 
# los junta como character
texto <- "" # iniciamos con el character vacio
for (palabra in palabras){ # le pedimos que recorra las palabras de la vector
  texto <- paste(texto,palabra) # observa que NO colocamos el espacio en medio
  # puesto que la orden paste() lo incorpora nativamente
}
texto

# Observa que se genera un espacio al principio solo. Esto se debe a que el 
# character "" vacio es un elemento en si

####------------------------------------------------------------------------####
####             **Paso 2:** R, cicle du temps: while                       ####
####------------------------------------------------------------------------####

# El otro tipo de bucle fundamental es el tipo while. Este repite el conjunto de 
# acciones hasta que se deje de cumplir cierta condicion logica.
# Siempre tiene la siguiente estructura:
#
# while (condion logica){
#   conjunto de acciones
# }

# Por ejemplo, la suma del 1 al 10 de nuevo
# Le vamos a pedir que sume los numeros naturales hasta que llegue al 10
# Empezamos por el 1
numero <- 1
# Iniciamos la suma como 0
suma_acumulada <- 0
while (numero <= 10){ # haz las siguientes acciones mientras numero sea <= 10
  suma_acumulada <- suma_acumulada + numero
  # OJO: Hay que actualizar el numero o nunca acabara el bucle de acciones
  numero <- numero + 1 # Ahora el numero sera el siguiente natural (+1)
}
suma_acumulada

# Que se comprueba que esta bien
suma_acumulada == sum(c(1:10))

# El bucle tipo while se puede usar siempre que queramos repetir un conjunto de 
# accion mientras se cumple una condicion o conjunto de condiciones
# Un par de ejemplos mas:

## Ejemplo 1: Contar numeros hasta llegar a otro dado.
# Debemos contar los numeros que van desde el 1 hasta uno dado
n <- 78 # el numero hasta el que contaremos
# Para "contar", vamos a crear un contador que +1 cada vez que pase por un numero
s <- 0 # comenzamos por 0
# Y comenzamos en el 1
i <- 1 # i de inicio
while (i < n){ # haz esto mientras sea menor que n dado
  s <- s+1 # actualizamos el contador
  i <- i+1 # actualizamos el numero que recorremos en el bucle
}
s 

# Se comprueba que hay tantos como elementos en la vector c(1:77), para longitudes 
# usamos la orden length(), que cuenta la cantidad de elementos de una vector
s == length(c(1:(n-1)))

## Ejemplo 2: Multiplica los numeros hasta el primer multiplo de 7
# Ser multiplo de 7 es lo mismo que x%%7 == 0
2%%7
14%%7
# Comenzamos con las inicializaciones
producto_acumulado <- 1 # comenzamos el producto con 1
numero <- 1 # primer numero 
while (numero%%7 != 0){ # haz esto mientras que n%%7 sea distinto (!=) a 0
  producto_acumulado <- producto_acumulado * numero
  numero <- numero + 1 # actualiza el numero para avanzar en los naturales
}
producto_acumulado
# Observa que se alcanza el numero 7, pero este no se multiplica
numero

# Comprobamos que el producto acumulado es efectivamente correcto. Lo hacemos
# usando la orden prod(), que hace el producto de una vector de numeros
producto_acumulado == prod(c(1:6))


####------------------------------------------------------------------------####
####                        **Paso 3:** R, what if                          ####
####------------------------------------------------------------------------####

# Podemos usar un tipo de condicional logico que devuelve una accion si se cumple
# la condicion. EStos son los condicionales if, else, y ifelse. A veces llamados 
# bucles condicionales, aunque realmente no son bucles de ningun tipo.
# La estructura de if conjunto a else es:
# 
# if(conditions){
#   acciones si es TRUE
# }else if(conditions){
#   acciones si es TRUE
# }else{
#   acciones si es TRUE
# }
#
# Observa que else no tiene condicion puesto que la condicion nativa es la 
# complementaria a los if anteriores.
# La estructura para ifelse es distinta puesto que permite operar de forma natural
# con vectors. Es la siguiente:
#
# ifelse(condicion sobre vectores, accion si es TRUE, accion si es FALSE)
#
# Veamos unos ejemplos:

## Ejemplo 1: Sumar si no es par.
# Vamos a ver dos formas de hacerlo, pero hay muchas.
#-) Primera forma: Sumando con sum() los numeros que son impares
# Primero filtramos los numeros impares, por ejemplo del 1 al 10.
num1al10 <- 1:10 # es lo mismo que c(1:10)
impares <- ifelse(num1al10 %% 2 != 0, # solo cuando no sea divisible por 2, es decir, par
                  num1al10, # lo mantienes igual
                  0 # en otro caso, lo cambias por 0
                  ) 
impares # observa que solo estan los impares
# Ahora basta sumarlos
suma_impares <- sum(impares) # Nota: el 0 no aporta a la suma, por eso sale
suma_impares

#-) Segunda forma: Usando un for que sume solo y cuando sea impar
suma_acumulada <- 0 # inicio de la suma en 0
for (i in 1:10){ # recorre los numeros del 1 al 10
  if (i %% 2 != 0){ # solo haz esto si cumple ser impar
    suma_acumulada <- suma_acumulada + i
  }  
}
suma_acumulada

# Comprobamos que sale lo mismo
suma_impares == suma_acumulada

## Ejemplo 2: Contador de una letra en un texto.
# La idea es recorrer un texto e ir contando cuantas veces hay una letra.
# Por ejemplo, este texto
texto <- "Esto es un texto que pretende ser contado, pero solo la letra e"
# Iniciamos el contador de letras e, 
num_e <- 0 # iniciamos con 0
for (letra in unlist(strsplit(texto,""))){ # recorre el texto dividido por letras
  if (letra == "e"){ # si la letra es una e ("e"), haz esto
    num_e <- num_e + 1
  }
}
num_e

# Comprobamos usando la funcion which(), que nos localiza en un vectores los elementos 
# que verifican una condicion, y sumando cuantas hay
num_e == length(which(unlist(strsplit(texto,""))=="e"))


####------------------------------------------------------------------------####
####                      **Aclaraciones u Notas**                          ####
####------------------------------------------------------------------------####

## Aclaracion 1: El simbolo <- o = para asignar valores tienen un uso basico identico

## Aclaracion 2: Llamar a los vectores c() listas, es una simplificacion de lenguaje.
# Existe la estructura de lista propiamente: list()

## Nota 1: Se puede acceder a un elemento concreto de un vector usando su posicion
x <- 1:15
x[5]
# Y de igual forma se puede con una lista, se hace de la siguiente manera
L <- list(1,2,3)
L[[2]]

## Aclaracion 3: La estructura c() es muy distinta a la estructura list(). 
# Con la primera no se pueden crear estructuras anidadas: c(c(),c(),c()).
# Mientras que con la segunda si.
# Por ejemplo, observa que es lo mismo
x1 <- c(c(2,3),c(4,5),c(6,7)) 
x1
x2 <- c(2:7)
x2
# De hecho, son iguales elemento a elemento.
x1 == x2

# Pero, no pasa igual con list()
L1 <- list(c(2,3),c(4,5),c(6,7)) 
L1
L2 <- list(2:7)
L2
# Y, no se pueden ni comparar al no tener la misma forma ni longitud
L1 == L2
# A las listas en un lista se le llama sublistas


## Nota 2: Se pueden distribuir vectores en forma de "vectores dentro de vectores". 
# Es la estructura tipo matrix.
A <- matrix(c(1:4), # vector de elementos que se coloca por columnas
            nrow = 2, # cantidad de filas
            ncol = 2) # cantidad de vectores
class(A)
# Y se accede a sus elementos indicando fila y columna
A[1,2]
A[2,1]
A[1,] # la fila 1
A[,2] # la columna 2

# Observa que una matriz es como una lista de listas de la forma:
#  [ 1,3 ] = c(1,3)
#  [ 2,4 ] = c(2,4)
# A similar a list(c(1,3),c(2,4)). Pero solo eso: similar, no son iguales
A == list(c(1,3),c(2,4))

## Nota 3: DEntro de una lista se puede contener lo que se desee.
L3 <- list(A,3)
L3
# En las matrices tambien, sin embargo la informacion se puede reducir en pantalla
B <- matrix(c(list(A),3))
B[1,] # guardo la lista completa como una entrada 
B[2,]

# Estas estructuras nuevas te permitiran hacer grandes codigos de forma mas sencilla
# Ya puedes pasar al script Ejercicios_3.R

