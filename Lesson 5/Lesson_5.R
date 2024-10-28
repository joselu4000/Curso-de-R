####------------------------------------------------------------------------####
####------------------------------------------------------------------------####
####                              Lesson 5                                  ####
####------------------------------------------------------------------------####
####------------------------------------------------------------------------####

# Vamos a usar para los ejemplos unos datos archiconocidos. Se encuentran ya 
# precargados en R.
data("iris")  # no lo guardes en ninguna variable

# Veamos un resumen breve de las variables.
summary(iris)

# Como ya viene configurado unicamente quiero invitarte a leer la ayuda para
# saber que tiene de datos son. Para ello, ve al panel de Files, situate en Help
# y busca en el cuadrito de arriba a la derecha: iris.

####------------------------------------------------------------------------####
####          **Paso 1:** Test estadisticos esenciales: t-student           ####
####------------------------------------------------------------------------####

# El uso de este test es muy amplio. Uno de los principales usos que tiene es establecer
# si dos conjuntos de muestras de datos tienen la misma media.

t.test(iris$Sepal.Length, iris$Petal.Length)

# La salida correspondiente es:
# 
# Welch Two Sample t-test
# 
# data:  iris$Sepal.Length and iris$Petal.Length
# t = 13.098, df = 211.54, p-value < 2.2e-16
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#   1.771500 2.399166
# sample estimates:
#   mean of x mean of y
# 5.843333  3.758000
#
# Si decides guardar el resultado en una variable puedes acceder a sus elementos 
# como si fuera un data.frame.

tLength <- t.test(iris$Sepal.Length, iris$Petal.Length)
tLength$statistic # El estadistico asociado
tLength$p.value   # p-valor 
tLength$conf.int  # nivel de confianza
tLength$estimate  # las estimaciones para las dos muestras (en orden del input)
tLength$alternative # construccion del test: en este caso quiere decir que estudio una igualdad
# Esto es,
# H_0: media(X) = media(Y)
# H_1: cc (caso complementario)
# Pero podria haberse escogido ver que era >= o <=, respectivamente:
t.test(iris$Sepal.Length,iris$Petal.Length, alternative = "greater")
t.test(iris$Sepal.Length,iris$Petal.Length, alternative = "less")

#### Nota 1: ####
# Sabes leer un test? Los test son pruebas para decidir si un posible
# hecho es verdad o no. Esto es, se plantea una pregunta, y si se conocer un test asociado
# basta con ver el p-valor obtenido.
# En el caso anterior, la pregunta era: tienen la misma media estas dos muestras?
# La probabilidad de que tengan la misma media es la probabilidad de que ocurra
# la hipotesis nula o H_0, que se corresponde al p-valor (p.value).
# Dado que el nivel de confianza de mi test es 0.95 o 95%, mi probabilidad se rechaza si es
# menor 1-0.95 = 0.05. 
# Como usaremos esto muchas veces, voy a generar un verificador, pero tu puedes hacerlo
# simplemente mirando el valor del p-valor y comparando con 0.05.

verH_0 <- function(p.valor){
  return(
    ifelse(p.valor <= 0.05, "Rechazamos la hipotesis nula", "Se puede asumir H_0")
  )
}
verH_0(tLength$p.value)
# [1] "Rechazamos la hipotesis nula"

# Que quiere decir que se rechaza H_0? Pues indica, y es la forma correcta de decirse,
# que la hipotesis que estudiabamos, la pregunta en cuestion, no es cierta.
# Podria ser por falta de evidencias?
# Podria ser por una mala formulacion?
# Eso son cuestiones aparte.
#
# Que quiere decir que se puede asumir H_0. Pues que podemos entender que nuestra
# hipotesis, nuestra pregunta, es cierta.

####------------------------------------------------------------------------####
####          **Paso 2:** Test estadisticos esenciales: correlacion         ####
####------------------------------------------------------------------------####
     
# Ahora vemos el test de correlacion: de Pearson, Kendall o Spearman. Las 3 opciones son posibles
# Por defecto, se usa el test de correlacion de Pearson.
# Este test plantea la siguiente cuestion
#
# H_0: var(X) = var(Y)
# H_1: cc
#
# Antes de seguir, que es la correlacion? La correlacion es la cuantificacion de
# una posible relacion entre dos muestras de datos o poblacionales.
# La correlacion (de Pearson) responde a la siguiente orden
cor(iris$Sepal.Length,iris$Petal.Length)

#### ¡¡¡Correlacion !=> Causalidad!!! ####

# Para decir que efectivamente dos variables estan correlacionadas basta un test de correlacion
# PERO, para decir que estan relacionadas, hay que observarlo graficamente, cuantificar la relacion
# con la correlacion, y hacer un test de correlacion

x <- iris$Sepal.Length
y <- iris$Petal.Length
# 1: Graficamente: deben de alinearse los datos 
plot(1:8,1:8, col="black", type = "l")  # Bisectriz de los datos x
points(x,y, col = "red", type="p")
# Supongamos que podrian alinearse al normalizarse: (x-media(x))/sd(x),
# podemos usar la orden qqplot
qqplot(x,y)

# 3: Cuantificar correlacion:
cor(x,y)
# Es alta pero no lo suficiente.

# 4: Hacemos un test para la correlacion
testC <- cor.test(x,y)
verH_0(testC$p.value)

# Luego, por la prueba grafica y el test concluimos que no presentan la misma varianza.

####------------------------------------------------------------------------####
####          **Paso 3:** Test estadisticos esenciales: normalidad          ####
####------------------------------------------------------------------------####

# Que una muestra sea normal quiere decir que siga una distribucion normal:
# Ejemplo:
z <- seq(-3,3,length.out=1000)
plot(z, dnorm(-z, mean = 0, sd = 1), col="red", type = "l")

# O, que la frecuencia de los datos tenga esa forma cuando se hace el histograma:
hist(rnorm(1000, mean=0, sd = 1), probability = TRUE)
curve(dnorm(x, mean = 0, sd = 1), col="red", add = TRUE)
 
# A esta forma se le llama campana de Gauss, y es muy importante en estadística
# puesto que existe un TEOREMA matematico que asegura que dada una muestra de datos,
# independientemente de la procedencia, continua, entonces cuando el numero de datos
# crece, lo siguiente tiende a una normal de media 0 y sd 1
# n*(X-mean(X))/sd(X), con X la muestra y n el numero de datos.
# Te invito a que busques mas en internet. Ademas asi lo ves bien escrito y no mi
# simplificacion.

# Dicho esto, pongamos que queremos ver que cierta variable es normal
x <- iris$Sepal.Length

# Graficamente podria ser algo asi
hist(x, probability = TRUE)
curve(dnorm(x, mean = mean(x), sd = sd(x)), col="red", add = TRUE)

# O
qqplot(seq(4,8,length.out=length(x)),x)

# Ya vemos que no parece seguir una normal. Podemos verlo con numeros, viendo la 
# diferencia de MSE (Error Cuadratico Medio, en ingles).
MSE <- sqrt(mean((dnorm(x, mean = mean(x), sd = sd(x))-x)^2))
MSE

# O, el error medio absoluto:
MAE <- mean(abs(dnorm(x, mean = mean(x), sd = sd(x))-x))
MAE

# Que son ligeramente bajos comparando con otros conocidos por la experiencia. 
# Sin embargo, debemos de recordar que lo que verdaderamente importa es el test.
# El mas conocido es el test de Shapiro-Wilk
shapiro.test(x)

# Que se lee igual que el t.test o el cor.test
# Alguna variable de iris es normal? Usaremos la orden apply, te invito a usar la
# ayuda para ver como funciona, de otro modo lo veremos mas adelante.
apply(iris[,-5], 2, shapiro.test)
# Parece que Sepal.Width es normal, o al menos no hay evidencias para negarlo
#
w <- iris$Sepal.Width
hist(w, probability = TRUE)
curve(dnorm(x, mean = mean(w), sd = sd(w)), col="red", add = TRUE)
# Normal si que parece, aunque este algo desviado

# Vamos a tipificar, es decir, transformarlo en un Normal(0,1), media 0, sd 1.
Z <- (w-mean(w))/sd(w)
hist(Z, probability = TRUE)
curve(dnorm(x, mean = mean(Z), sd = sd(Z)), col="red", add = TRUE)


#### Nota 2: ####
# Como genere los datos de la normal antes? Que ordenes eran esas?
# Bueno, distribuciones hay muchas: normal, exponencial, binomial, geometrica,...
# Y las hay de varios tipos: continuas, discretas o mixtas.
# R trae por defecto algunas distribuciones que se definen segun sus parametros.
# Para aprender las mas basicas habria que dar todo un curso de estadistica.
# Aqui, basta con entender que si un palabra corresponde a una distribucion: norm, a la normal
# rnorm, genera los datos aleatorios
# dnorm, da su funcion de densidad
# pnorm, su funcion de probabilidad (acumulada)
# y hay mas, que te invito a investigar.
#
# Por ejemplo, exp representa la funcion exponencial. Mira en la ayuda que te sale en rexp.
# Observa como se ve.
E <- rexp(n = 100, # genero 100 datos
     rate = 0.5) # es la tasa de crecimiento
hist(E, probability = TRUE)
curve(dexp(x, rate = 1/mean(E)), col="red", add = TRUE)

# De igual forma, te planteo la binomial (binom)
B <- rbinom(n = 10000, # genero 100 datos
            size = 1, # la cantidad de categorias sin contar al 0
            prob = 0.3) 
table(B) # una tabla del numero de las distintas clases
# Observa que la prob = 0.3 es aproximadamente
table(B)/length(B) # el valor de la clase 1.

####------------------------------------------------------------------------####
####  **Paso 4:** Test estadisticos esenciales: diferencias significativas  ####
####------------------------------------------------------------------------####

# Aqui empieza lo gracioso. Hay tantos test como preguntas y respuestas se te ocurran
# Para que en estadistica algo se considere un test solo debe de verificar unas
# propiedades.

# Test para diferencias significativa entre dos muestras. Hay dos grandes:
# Kruskal-Wallis: H_0 son la misma distribucion, H_1: cc
x <- iris$Sepal.Length
y <- iris$Petal.Length
kruskal.test(x,y)

# Mann-Whitney: Las mismas hipotesis
wilcox.test(x,y)

# Podemos hacer tambien los famosos anova, que mide si existe una relacion lineal.
ANOVA <- aov(Sepal.Length ~ Petal.Length, data = iris)
summary(ANOVA)

# El Test de Kolmogorov-Smirnov para dos muestras, que mide si siguen la misma distribucion
ks.test(x, y)

# El chi-cuadrado para los valores categoricos. Asumamos que queremos ver su ambas variables
# son de la misma manera mayores que 5
# Creación de datos de ejemplo
tabla <- table(x > 5, y > 5) 
chisq.test(tabla)  


####------------------------------------------------------------------------####
####         **Paso 5:** Test estadisticos esenciales: post-hoc             ####
####------------------------------------------------------------------------####

# Son test que, existiendo diferencias significativas, te dice entre que muestras (si hay mas de dos)
# Se llaman post-hoc, porque son post analisis.

# Algunos son:
# Test de Tukey: Teniendo un anova no significativo inicial, dividido por categorias
ANOVA <- aov(Sepal.Length ~ Species, data = iris)
posthoc_tukey <- TukeyHSD(ANOVA)
posthoc_tukey

# Test post-hoc de Bonferroni, qe es mas conservador y lo hace a pares.
pairwise.t.test(iris$Sepal.Length, iris$Species, p.adjust.method = "bonferroni")

# Y hay mas. Ahora te invito a irte a los Ejercicios_5.R donde jugaremos con una 
# base de datos del titanic