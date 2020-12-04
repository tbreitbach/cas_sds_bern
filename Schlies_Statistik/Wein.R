# Daten aus der Uebungsaufgabe
wein <- c(750.9, 749.8, 750.6, 751.5, 748.0, 750.4, 747.6, 
 752.6, 750.5, 751.3, 749.1, 758.1, 743.2, 748.7, 749.3, 747.8, 
 735.9, 750.4, 746.5, 748.7, 749.2, 749.2, 750.6, 754.9, 749.1, 
 750.9, 754.7, 751.5, 751.2, 750.4, 750.5, 748.2, 749.0, 749.1, 
 744.7, 747.2)

# Grafik erzeugen
layout(matrix(c(1,2), byrow = TRUE, ncol = 2), widths = c(2.5,1))

qqnorm(wein, ylim = c(735, 760),
  cex = 1.3, pch = 21, bg = "dark grey",
  main = "Q-Q-Plot", cex.main = 1.5,
  xlab = "Quantile der Standardnormalverteilung", 
  ylab = "empirische Quantile", 
  cex.axis = 1.2, cex.lab = 1.2)

boxplot(wein, ylim = c(735, 760),
  cex = 1.3, pch = 21, bg = "dark grey", 
  boxwex = 0.7, staplewex = 0.2, col = "dark grey", 
  medlwd = 5, whisklty = 1, 
  main = "Box-Plot", cex.main = 1.5,
  ylab = "Weinabfüllmengen [ml]", 
  cex.axis = 1.2, cex.lab = 1.2)

# Vorzeichen-Rangsummentest
wilcox.test(wein, alternative="less", mu=750)

# Exakte p-Werte
library(exactRankTests)
wilcox.exact(wein, alternative = "less", mu = 750)
