# Daten eingeben, ohne = geschnittene Pflanzen, 
# mit = Pflanzen mit Wurzeln

ohne <- c(53, 58, 48, 18, 55, 42, 50, 47, 51, 45)
mit <- c(36, 33, 40, 43, 25, 38, 41, 46, 34, 29)

# Strichdiagramm erzeugen

layout(matrix(c(1,2)), heights = c(0.5,0.5))

par(oma=c(0,0,4,0) ,mar=c(6,4,0,1))

plot(ohne, rep(1,10), type = "h", lwd = 2, axes = FALSE,
    xlim = c(15,60), ylim = c(0,2), ylab = "", xlab = "")
points(ohne, rep(1,10), pch = 16, cex = 2)
axis(1, at = seq(15,60,5), pos = 0, cex.axis = 2, cex.lab = 2, mgp = c(3,1.5,0))
mtext("geschnittene Pflanzen", outer = FALSE, side = 1, line = 4, cex = 2) 
axis(2, at = 0:2, pos = 15, cex.axis = 2, cex.lab = 2)
mtext("Anzahl", outer = FALSE, side = 2, line = 2, cex = 2)

plot(mit, rep(1,10), type = "h", lwd = 2, axes = FALSE,
    xlim = c(15,60), ylim = c(0,2), ylab = "", xlab = "")
points(mit, rep(1,10), pch = 16, cex = 2)
axis(1, at = seq(15,60,5), pos = 0, cex.axis = 2, cex.lab = 2, mgp = c(3,1.5,0))
mtext("Pflanzen mit Wurzeln", outer = FALSE, side = 1, line = 4, cex = 2) 
axis(2, at = 0:2, pos = 15, cex.axis = 2, cex.lab = 2)
mtext("Anzahl", outer = FALSE, side = 2, line = 2, cex = 2)

mtext("Strichdiagramme der Puffbohnendaten", outer = TRUE, side = 3, line = 2,
    cex = 2.5, font = 2)

# Test, ob die Varianzen in beiden Gruppen gleich sind

var.test(ohne,mit)

# t.tests: Einmal mit Annahme gleicher Varianzen und einmal ohne. 
# (Die Software fuehrt dabei eine Korrektur durch, siehe Bem. 3.8.)

t.test(ohne, mit, var.equal = TRUE) 
t.test(ohne, mit)
t.test(ohne, mit, var.equal=FALSE) #Ungleiche Varianzen ist default

