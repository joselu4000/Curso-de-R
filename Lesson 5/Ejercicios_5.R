####------------------------------------------------------------------------####
####------------------------------------------------------------------------####
####                              Ejercicios 5                              ####
####------------------------------------------------------------------------####
####------------------------------------------------------------------------####

# Carga esto con Ctrl.+Enter
{
  # Cargamos los datos del Titanic
  data("Titanic")
  titanic <- as.data.frame(Titanic)
  # Expandimos el dataset segun la frecuencia, conservando los factores
  titan <- titanic[rep(1:nrow(titanic), titanic$Freq), 1:4]
  summary(titan)
  head(titan, 3)
  View(titan)
}

####------------------------------------------------------------------------####
####                                  1)                                    ####
####------------------------------------------------------------------------####

# Comprueba que tipo de variables son:
# Continuas son numeros continuos
# Discretas son categorias o numeros sueltos

####------------------------------------------------------------------------####
####                                  2)                                    ####
####------------------------------------------------------------------------####

# Tienen la misma media de edad los hombres que las mujeres?


####------------------------------------------------------------------------####
####                                  3)                                    ####
####------------------------------------------------------------------------####

# De que clase murieron mas personas? Existe una correlacion entre la supervivencia y la clase?


####------------------------------------------------------------------------####
####                                  4)                                    ####
####------------------------------------------------------------------------####

# Existe una relacion entre el sexo y la supervivencia? Piensa la respuesta

####------------------------------------------------------------------------####
####                                  5)                                    ####
####------------------------------------------------------------------------####

# Que diferencias significativas hay entre las distintas variables? 
# Si quieres dividir unos datos o medir la interacion entre dos varibles puedes hacerlo en 
# aov usando Variable1*Variable2. Y si quieres todas las variables se puede Variable ~.

####------------------------------------------------------------------------####
####                                  6)                                    ####
####------------------------------------------------------------------------####

# Llegados aqui. Comprueba que variables son normales (deben ser continuas primero)
# Y despues responde a la siguiente pregunta: 
# Sobrevivir en el titanic tenia una probabilidad alta, si o no?


# Te emplazo a Check_5.R o a la siguiente carpeta: Lesson_6.