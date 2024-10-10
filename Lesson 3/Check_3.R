####------------------------------------------------------------------------####
####------------------------------------------------------------------------####
####                                Check 3                                 ####
####------------------------------------------------------------------------####
####------------------------------------------------------------------------####

####------------------------------------------------------------------------####
####                                  1)                                    ####
####------------------------------------------------------------------------####
# Genera una funcion con un bucle for para la operacion potencia. 
# Recuerda que a^b refiere a: a*a*...*a, b veces.
potencia <- function(a,b){
  z <- 1 # inicio
  for (i in 1:b){
    z <- z*a
  }
  return(z)
}


# Comprueba que sale lo mismo
potencia(2,3) == 2**3

####------------------------------------------------------------------------####
####                                  2)                                    ####
####------------------------------------------------------------------------####
# Estudia con condicionales, cuantas veces aparece la palabra: "ofu", en el 
# siguiente texto.
texto <- "Ofu madre mia, que cansancio tengo. Esto de contar ofu me tiene ofuscado. No entiendo que tipo de ofustamiento digo, pero estoy realmente ofu ofustadisimo"
s <- 0 # inicio del contador
for (palabra in unlist(strsplit(texto," "))){ # divido por palabras
  if (palabra == "ofu"){ # filtramos por "ofu"
    s <- s+1 # contamos cada "ofu", OJO: "Ofu" != "ofu"
  }
}
s
# Si quieres hacerlo en una linea se puede con ifelse()
sum(ifelse(unlist(strsplit(texto," ")) == "ofu", # filtramos por ofu
           1, # si lo cumple lo contamos
           0)) # en otro caso no
# lo sumamos todo

# Pista: Se puede serapar el texto usando strsplit(texto,x), de tantas formas como x.
# Por ejemplo, conoces ya x = "", que separa por character, pero puedes por espacios x= " ".


# **Complicalo si quieres:** Añade que sea cualquier palabra que contenga "ofu".
# Se simplifica observando que "ofu" y "ofuscamiento" por ejemplo se filtran al hacer:
strsplit(texto, "ofu")
# Fijate que salen las cadenas que se separaron por "ofu...". De nuevo, "Ofu" es distinto a "ofu".
# Habra tantos "ofu..." como cadenas separadas al dividir, sin contar con la primera, de ahi el menos.
length(unlist(strsplit(texto,"ofu")))-1 

# Otra forma es cada vez que aparezca "ofu..." contarlo. PAra ello, hay que identificar 
# especificamente esos elementos.
s <- 0 # inicio contador
for (palabra in unlist(strsplit(texto," "))){ # recorremos las palabras
  # Aqui vamos a coger la palabra y dividirla en letras.
  letras <- unlist(strsplit(palabra,""))
  # Comprobamos que los tres primeros son c("o","f","u"), 
  # importanto antes comprobar que tiene la palabra 3 o mas letras
  if (length(letras) >= 3){
    if (prod(letras[1:3] == c("o","f","u")) == 1){ # coge los tres primeros elementos, el producto es un truco para pasar de 3 TRUE a un booleano
      s <- s+1
    }
  }
}
s

####------------------------------------------------------------------------####
####                                  3)                                    ####
####------------------------------------------------------------------------####
# Programa una calculadora con condicionales y bucles.
calculadora <- function(x,y,operation){
  # Operaciones en bateria
  if(operation == "+"){
    x+y
  }else if(operation == "-"){
    x-y
  }else if(operation == "*"){
    x*y
  }else if(operation == "/"){
    x/y
  }else if(operation == "**"){
    x**y
  }else{"Proporciona operacion conocida"} # si no se indica ninguna operacion conocida lo dira
}

# Comprueba todas las operaciones:
calculadora(2,3,"**") == 2**3
calculadora(2,3,"/") == 2/3
calculadora(2,3,"+") == 2+3

# Mas adelante se estudiara como hacerlo mas sencillo con la orden apply()

####------------------------------------------------------------------------####
####                               Reto)                                    ####
####------------------------------------------------------------------------####
# Me encantaria un cafe. Programa una maquina de cafe que si le pido 
# un cafe solo me pida 1 euro, si pido 
# un cafe con leche me pida 1.2 euros, y si quiero 
# un te me pida 0.8 euros 
cecotec <- function(tipo_de_cafe){
  if(tipo_de_cafe == "cafe solo"){
    z <- 1
  }else if(tipo_de_cafe == "cafe con leche"){
    z <- 1.2
  }else if(tipo_de_cafe == "te"){
    z <- 0.8
  }else{z <-"Escoge un producto"} # te requiere un producto conocido
  return(z)
}

# Pista: Usa condicionales dentro de la funcion
# Comprueba:
cecotec("cafe solo") == 1
cecotec("cafe con leche") == 1.2
cecotec("te") == 0.8

# **Complicalo si quieres:** HAz una version de la misma funcion que dada una 
# lista de peticiones de cafes, te diga el precio total de todos.
# Por ejemplo, c("cafe solo","te") ==> 1+0.8 = 1.8

# Es una modificacion sencilla de la funcion anterior:
cecotec_pro <- function(lista_cafes){
  z <- 0 # iniciamos el cobro
  for (tipo_de_cafe in lista_cafes){
    if(tipo_de_cafe == "cafe solo"){
      z <- z+1
    }else if(tipo_de_cafe == "cafe con leche"){
      z <- z+1.2
    }else if(tipo_de_cafe == "te"){
      z <- z+0.8
    }
  }
  if(z == 0){
    "Escoge un producto"
    } # te requiere un producto conocido a cobrar
  return(z)
}

cecotec_pro(c("cafe solo","te")) == 1.8

# Te invito a que continues con la carpeta Lesson 4.