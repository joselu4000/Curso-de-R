####------------------------------------------------------------------------####
####------------------------------------------------------------------------####
####                               CHECK 2                                  ####
####------------------------------------------------------------------------####
####------------------------------------------------------------------------####

####------------------------------------------------------------------------####
####                                  1)                                    ####
####------------------------------------------------------------------------####
# Suma, resta, y multiplica estos numeros
a <- 2
b <- 4
a+b
a-b
a*b
a/b

# Guarda un numero en una variable llamada c, y eleva los anteriores a ese valor.
c <- 7
a**7
b**7

# Haz el logaritmo del siguiente numero y trata de redondearlo al segundo decimal 
# de dos formas distintas:
d <- exp(2.345)

# Primera:
round(d,2)
# Segunda:
# Guardamos los decimales menores que las milesimas
f <- d%%0.01
f
# Eliminamos los decimales guardados del numero original
d-f
# Hay mas opciones, no solo esta
# Pista: usa la operacion %% de forma adecuada. Si es muy dificil pasa al siguiente


####------------------------------------------------------------------------####
####                                  2)                                    ####
####------------------------------------------------------------------------####
# Demuestra con operadores logicos que:
# log(exp(x)) = x,
# para los 10 primeros numeros:
log(exp(c(1:10))) == c(1:10)

# Pista: un vector de numeros naturales consecutivos se genera como c(n:m). 
# Por ejemplo: c(1:3).

####------------------------------------------------------------------------####
####                                  3)                                    ####
####------------------------------------------------------------------------####
# Programa la suma, la resta, el producto y la division de dos numeros como 
# funciones diferenciadas. De la forma mas sencilla posible
# Suma:
suma <- function(x,y){return(x+y)}

# Resta:
resta <- function(x,y){return(x-y)}

# Producto:
producto <- function(x,y){return(x*y)}

# Division:
division <- function(x,y){return(x/y)}


####------------------------------------------------------------------------####
####                               Reto)                                    ####
####------------------------------------------------------------------------####
# Ahora define como una funcion de funciones una calculadora. Y comprueba.

calculadora <- function(x, operacion, y){
  suma <- (operacion == "+")*(x+y)
  resta <- (operacion == "-")*(x-y)
  prod <- (operacion == "*")*(x*y)
  div <- (operacion == "/")*(x/y)
  return(suma+resta+prod+div)
}

calculadora(2,"+",3) == 2+3
calculadora(2,"-",3) == 2-3
calculadora(2,"*",3) == 2*3
calculadora(2,"/",3) == 2/3

# Pista: Usa operadores logicos y palabras para indicar la operacion a usar. 
# Por ejemplo: "+" o "suma".

# A continuación, procede a la carpeta de Lesson 3.
