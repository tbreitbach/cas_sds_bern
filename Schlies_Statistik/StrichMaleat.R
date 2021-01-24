# Daten eingeben

labor.1 <- c(4.13, 4.07, 4.04, 4.07, 4.05, 4.04, 4.02, 4.06,
    4.10, 4.04)
labor.2 <- c(4.00, 4.02, 4.01, 4.01, 4.04, 3.99, 4.03, 3.97,
    3.98, 3.98)

# a)
## Haeufigkeiten zaehlen

zaehlen <- function(x){
  x.su <- sort(unique(x))
  l <- length(x.su)
  anzahl <- rep(NA,l)    
  
  for (i in 1:l) anzahl[i] <- sum(x.su[i] == x)
  
  data.frame(Werte = x.su, Anzahl = anzahl)
}

Labor1 <- zaehlen(labor.1)
Labor2 <- zaehlen(labor.2)

## Strichdiagramm erzeugen
layout(matrix(c(1,2)), heights = c(0.5,0.5))

par(oma=c(0,0,6,0), mar=c(6,4,0,1))

plot(Labor1$Werte, Labor1$Anzahl, type = "h", lwd = 2, axes = FALSE,
    xlim = c(3.95,4.15), ylim = c(0,4), ylab = "", xlab = "")
points(Labor1$Werte, Labor1$Anzahl, pch = 16, cex = 2)
axis(1, at = seq(3.95,4.15,0.05), pos = 0, cex.axis = 2, cex.lab = 2,
    mgp = c(3,1.5,0))
mtext("Labor 1", outer = FALSE, side = 1, line = 4, cex = 2) 
axis(2, at = 0:4, pos = 3.95, cex.axis = 2, cex.lab = 2)
mtext("Anzahl", outer = FALSE, side = 2, line = 2, cex = 2)

plot(Labor2$Werte, Labor2$Anzahl, type = "h", lwd = 2, axes = FALSE,
    xlim = c(3.95,4.15), ylim = c(0,4), ylab = "", xlab = "")
points(Labor2$Werte, Labor2$Anzahl, pch = 16, cex = 2)
axis(1, at = seq(3.95,4.15,0.05), pos = 0, cex.axis = 2, cex.lab = 2,
    mgp = c(3,1.5,0))
mtext("Labor 2", outer = FALSE, side = 1, line = 4, cex = 2) 
axis(2, at = 0:4, pos = 3.95, cex.axis = 2, cex.lab = 2)
mtext("Anzahl", outer = FALSE, side = 2, line = 2, cex = 2)
mtext("Strichdiagramme des Chloropheniramin- \n Maleat-Gehalts",
    outer = TRUE, side = 3, line = 1, cex = 2.5, font = 2)


# b) 

var.test(labor.1, labor.2)

t.test(labor.1, labor.2, var.equal=TRUE)
t.test(labor.1, labor.2)

# c)

wilcox.test(labor.1, labor.2)

# falls nötig zuerst exactRankTests installieren:
# install.packages("exactRankTests")

library(exactRankTests)

wilcox.exact(labor.1, labor.2)


# d)

wilcox.test(labor.1-labor.2)
wilcox.test(labor.1, labor.2, paired = TRUE)
