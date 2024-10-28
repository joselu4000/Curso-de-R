####------------------------------------------------------------------------####
####------------------------------------------------------------------------####
####                                Check 5                                 ####
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
# Los datos se llaman: titan

####------------------------------------------------------------------------####
####                                  1)                                    ####
####------------------------------------------------------------------------####

# Comprueba que tipo de variables son:
# Continuas son numeros continuos: 
# Solo Freq, porque tiene una escala qe se define como numero
# Discretas son categorias o numeros sueltos: 
# El resto, categoricas todas.

####------------------------------------------------------------------------####
####                                  2)                                    ####
####------------------------------------------------------------------------####

# Tienen la misma media de edad los hombres que las mujeres?
filtro.Hombre <- which(titanic$Sex == "Male")
Edad.Hombre <- titan[filtro.Hombre,3]
Edad.Mujeres <- titan[-filtro.Hombre,3]
# El siguiente comando te muestra la tabla de conteo
table(Edad.Hombre)
table(Edad.Mujeres)
# Tiene sentido que no haya adultos hombres?
length(Edad.Hombre)+length(Edad.Mujeres) == length(titan$Age)
# Parece que si

# Para hacer la media, pasamos a numeros
Valores.H <- ifelse(Edad.Hombre == "Child", 0, 1)
Valores.M <- ifelse(Edad.Mujeres == "Child", 0, 1)
# Hacemos el test
t.test(Valores.H, Valores.M)
# Claramente, hay una descompensacion de mujeres y hombres. En particular,
# los hombres son mas jovenes en promedio que las mujeres.

####------------------------------------------------------------------------####
####                                  3)                                    ####
####------------------------------------------------------------------------####

# De que clase murieron mas personas? Existe una correlacion entre la supervivencia y la clase?

# Para contar, vamos hacer la tabla de contingencia:
head(titan,3)
table(titan[,c(1,4)])
# Podemos decir que de la tripulacion murieron el mayor numero de personas,
# seguidos de la tercera clase, la segunda y la primera, en ese orden.

# Para ver si existe una correlacion, veammos primero un mapa de calor,
# que consiste en la matriz de correlacion vista con colores.
# Creamos previamente un sub conjunto de datos con las variables que nos interesan.
Clase.Surv <- titan[,c(1,4)]
# No: 0, Yes: 1.
Clase.Surv$Survived <- ifelse(Clase.Surv$Survived == "No", 0, 1)
# Crew: 0, 1st: 1, 2nd: 2, 3rd: 3.
Clase.Surv$Class <- ifelse(Clase.Surv$Class == "Crew", 0, 
                           ifelse(Clase.Surv$Class == "1st", 1, 
                                  ifelse(Clase.Surv$Class == "2nd", 2, 3)))
head(Clase.Surv,10)
# Ahora hacemos la matriz de correlacion.
C <- cor(Clase.Surv)
heatmap(C)
# Parece que no ha correlacion. Veamos el test.
cor.test(Clase.Surv$Class, Clase.Surv$Survived)
# No hay una correlacion significativa entre las variables.

# Nos conformamos con esto? NOOO, porque las variables son categoricas, y por 
# hacerlas numeros no pasan a ser continuas. Debemos hacer un estudio mas deacuado.
# Una opcion es buscar test adecuados y ver si estan en R o implementarlos.
# Una opcion aceptable es hacer un anova. Se requiere para el test que Survived sea numerico
Clase.Surv$Class <- as.factor(Clase.Surv$Class)
result <- aov(Survived ~ Class, data = Clase.Surv)
summary(result)
# La clase es significativa frente a la supervivencia
print(result)
# Observa que dice que las clases estan algo desbalanceadas.
# Hagamos un post-hoc para ver que categorias son las mas afectadas.
tukey_result <- TukeyHSD(result)
print(tukey_result)
# Diferencias significativas con todas las clases salvo 3-0. Podemos concluir,
# que existen una correlacion fuerte entre la clase y la supervivencia.

####------------------------------------------------------------------------####
####                                  4)                                    ####
####------------------------------------------------------------------------####

# Existe una relacion entre el sexo y la supervivencia? Piensa la respuesta.
# A priori podemos decir que si, puesto que hay muchisimas mas mujeres que hombres.
# Veamos que dicen los test. Dado que son dos variables categoricas, hemos aprendido 
# la leccion. Directamente hacemos un anova.
# Male: 0, Female: 1
titan$Sex <- ifelse(titan$Sex == "Male", 0, 1)
result_SS <- aov(Sex ~ Survived, data = titan)
print(result_SS)
summary(result_SS)
# Hay diferencias significativas. Veamos el conteno como tal.
table(titan[,c(2,4)])
# Se observa que murieron muchos mas hombres. Luego si, el sexo se relaciona con la supervivencia.
# Seguramente, debido a la politica de mujeres y niños se salvan primero.

####------------------------------------------------------------------------####
####                                  5)                                    ####
####------------------------------------------------------------------------####

# Que diferencias significativas hay entre las distintas variables? 
# Si quieres dividir unos datos o medir la interacion entre dos varibles puedes hacerlo en 
# aov usando Variable1*Variable2. Y si quieres todas las variables se puede Variable ~.

# Hacemos todas las variables que faltan numericas (haz un summary y comprueba cuales)
# No: 0, Yes: 1.
titan$Survived <- ifelse(titan$Survived == "No", 0, 1)
# Crew: 0, 1st: 1, 2nd: 2, 3rd: 3.
titan$Class <- ifelse(titan$Class == "Crew", 0, 
                           ifelse(titan$Class == "1st", 1, 
                                  ifelse(titan$Class == "2nd", 2, 3)))
# Child: 0, Adult: 1.
titan$Age <- ifelse(titan$Age == "Child", 0, 1)
summary(titan)

# Existe una correlacion?
heatmap(cor(titan))
# Puedes observar que existe una leve correlacion entre: sex ~ survived, sex ~ class
# El test dice:
for (i in 1:ncol(titan)){
  for (j in i:ncol(titan)){
    if (i != j){
      result <- cor.test(titan[,i],titan[,j])
      print(paste(names(titan)[i], names(titan)[j], result$p.value))
    }
  }
}
# La correlacion se da entre Class ~ Sex + Age, Sex ~ Age + Survived, y Age ~ Survived

# Veamos un anova. Fijamos clase y estudiamos el resto.

result_T <- aov(Class ~ Sex * Age * Survived, data = titan)
summary(result_T)
# Podria existir cierto efecto de confusion entre Survived con Sex y Age.

####------------------------------------------------------------------------####
####                                  6)                                    ####
####------------------------------------------------------------------------####

# Llegados aqui. Comprueba que variables son normales (deben ser continuas primero)
# Y despues responde a la siguiente pregunta: 
# Sobrevivir en el titanic tenia una probabilidad alta, si o no?

# Que pasa si una muestra es discreta y le preguntamos si es discreta?
# Hacemos un apply para ir rapido
apply(titan,2,shapiro.test)
# Pues no dice nada sorpendente, ninguna es normal. 

# Cual es la probabilidad de sobrevivir en el titanic? Pues a priori, deberiamos saber
# todos los que estuvieron, que son mas que los del dataset. NOs conformamos para
# con usar la tasa de supervivencia. Esto es, los que han sobrevivido del total.
Total = length(titan$Survived)
Survived.Si = length(which(titan$Survived == 1))
Probabilidad.Survived = Survived.Si/Total
cat("La probabilidad de supervivencia es:",Probabilidad.Survived)
# Ya si es baja o alta, juzgalo tu. En mi opinion es baja.


# Ahora te invito a ir a la carpeta Lesson_6