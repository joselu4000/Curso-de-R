####------------------------------------------------------------------------####
####------------------------------------------------------------------------####
####                              Ejercicios 3                              ####
####------------------------------------------------------------------------####
####------------------------------------------------------------------------####

####------------------------------------------------------------------------####
####                                  1)                                    ####
####------------------------------------------------------------------------####
# Genera una funcion con un bucle for para la operacion potencia. 
# Recuerda que a^b refiere a: a*a*...*a, b veces.
potencia <- function(a,b){
  # completa tu
}


# Comprueba que sale lo mismo
potencia(2,3) == 2**3

####------------------------------------------------------------------------####
####                                  2)                                    ####
####------------------------------------------------------------------------####
# Estudia con condicionales, cuantas veces aparece la palabra: "ofu", en el 
# siguiente texto.
texto <- "Ofu madre mia, que cansancio tengo. Esto de contar ofu me tiene ofuscado. No entiendo que tipo de ofustamiento digo, pero estoy realmente ofu ofustadisimo"

# Pista: Se puede serapar el texto usando strsplit(texto,x), de tantas formas como x.
# Por ejemplo, conoces ya x = "", que separa por character, pero puedes por espacios x= " ".


# **Complicalo si quieres:** Añade que sea cualquier palabra que contenga "ofu".


####------------------------------------------------------------------------####
####                                  3)                                    ####
####------------------------------------------------------------------------####
# Programa una calculadora con condicionales y bucles.
calculadora <- function(x,y,operation){
  # completa tu
}

# Comprueba todas las operaciones:
calculadora(2,3,"**") == 2**3
calculadora(2,3,"/") == 2/3
calculadora(2,3,"+") == 2+3


####------------------------------------------------------------------------####
####                               Reto)                                    ####
####------------------------------------------------------------------------####
# Me encantaria un cafe. Programa una maquina de cafe que si le pido 
# un cafe solo me pida 1 euro, si pido 
# un cafe con leche me pida 1.2 euros, y si quiero 
# un te me pida 0.8 euros 
cecotec <- function(tipo_de_cafe){
  # completa tu
}

# Pista: Usa condicionales dentro de la funcion
# Comprueba:
cecotec("cafe solo") == 1
cecotec("cafe con leche") == 1.2
cecotec("te") == 0.8

# **Complicalo si quieres:** HAz una version de la misma funcion que dada una 
# lista de peticiones de cafes, te diga el precio total de todos.
# Por ejemplo, c("cafe solo","te") ==> 1+0.8 = 1.8


# Cuando lo tengas todo mira la correcion en Check_3.R o ve a la carpeta de Lesson 4