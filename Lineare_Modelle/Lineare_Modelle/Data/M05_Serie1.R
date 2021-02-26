# -------------------------------
#  NDS 2012-2013
#  M05 Lineare Modelle 
#  Serie 1 - Einweg-ANOVA
#
#  Kathrin Weyermann
# -------------------------------

#############
# Aufgabe 1 #
#############
#setwd("L:/NDS/2012-14/M05_Lineare_Modelle/Serien/Serie1")

daten <- read.table('./Caffeine.txt', header = TRUE)
daten$dose <- factor(daten$dose)

####
# a)
lapply(split(daten$fingertaps, daten$dose), mean)

# Variante 1 Skript (Vorher Paket 'Hmisc' laden) 
summary(fingertaps ~ dose, data = daten)

####
# b)
pdf('boxplot1b.pdf')
boxplot(fingertaps ~ dose, data = daten)
boxplot(fingertaps ~ dose, data = daten, plot = FALSE)
dev.off()

####
# c)
fit <- lm(fingertaps ~ dose, data = daten)
summary(fit)

####
# d)
var(resid(fit))
var(daten$fingertaps)
Rq <- 1-var(resid(fit))/var(daten$fingertaps)


#############
# Aufgabe 2 #
#############

####
# a)
by(daten$fingertaps, daten$dose, t.test)

# Variante pro Guppe 
daten_0 <- subset(daten, dose == 0)
t.test(daten_0$fingertaps, mu = 0, conf.level = 0.95)

####
# d)
summary(lm(fingertaps ~ dose, data = daten))

####
# e)
lapply(split(daten$fingertaps, daten$dose), var)
lapply(lapply(split(daten$fingertaps, daten$dose), var), sqrt)

####
# g)
confint.R2(fit, alternative='greater')

####
# h)
pairwise.t.test(daten$fingertaps, daten$dose, p.adj = "none")
pairwise.t.test(daten$fingertaps, daten$dose, p.adj = "holm")
