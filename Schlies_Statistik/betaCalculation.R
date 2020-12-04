betaCalcPlot<- function(alpha, mu0, mu1, s, n, 
    main="", ylab="Dichte", xlab="x", cex_legend=1) {
  # Input: 
  #      alpha=      (alpha-Fehler)
  #      mu0=        Mittelwert/Erwartungswert unter der Nullhypothese
  #      mu1=        Mittelwert/Erwartungswert unter der Alternativhypothese
  #      s=          Standardabweichung (wahre oder geschaetzte bei genuegend
  #                  grossem n)
  #      n=          Stichprobengroesse
  # 
  #      main=       Titel der Grafik (default: kein Titel)
  #      ylab=       Titel der y-Achse (default: Dichte) 
  #      xlab=       Titel der x-Achse (default: x)
  #      cex_legend= Groesse der Schrift  der Legende und damit der Legende im
  #                  allgemeinen (default 1, muss je nachdem angepasst werden,
  #                  damit keine Ueberschneidung)
  
  # Output: 
  #      Output 1:   Power und beta (in Konsole)
  #      Output 2:   Plot der Verteilungen und alpha- und beta Fehler
  
  # Berechnung Standardfehler se und kritische Grenze
  se<- s/sqrt(n)
  xk<- qnorm(alpha, mu0, se)
  
  # Output 1
  ## Berechnung der Power (1-beta)
  power<- pnorm(xk, mu1, se)
  
  ## Printen in Konsole 
  print(paste("Macht/Power="))
  print(power)
  print(paste("beta="))
  print(1-power)
  
  # Output 2
  ## Bestimmen der Grenzen x-Achse
  xmin<- min(mu0, mu1)-8*se
  xmax<- max(mu0, mu1)+5*se
  
  ## Zeichnen Dichte unter Nullhypothese
  curve(dnorm(x, mu0, se), xlim=c(xmin,xmax),
        ylab=ylab, xlab=xlab, , n=1001, lty=2)

  ## Zeichnen Dichte unter Alternativhypothese
  curve(dnorm(x, mu1, se), add=TRUE, n=1001, lty=3)
  
  ## Zeichnen horizontale Linie fuer den kritischen Wert
  abline(v=xk)
  
  ## Einfaerben der Flaechen fuer alpha und beta
  k0 <- c(xmin,seq(xmin,xk, 0.001), xk)
  y0 <- c(0,dnorm(seq(xmin,xk, 0.001), mu0, se),0)
  
  k1 <- c(xk,seq(xk,xmax, 0.001),xmax)
  y1 <- c(0,dnorm(seq(xk,xmax, 0.001), mu1, se),0)
  
  polygon(k0,y0,col="red", lty=2)
  polygon(k1,y1,col="green", lty=3)
  
  ## Schwarze horizontale Linie einzeichnen (da vorher gefaerbt von Dichten)
  abline(h=0)
  
  ## Einzeichnen der Legende
  legend("topleft",
        legend=c("Verteilung unter H0", "Verteilung unter H1", "alpha","beta"), 
        col=c("black", "black", "red", "green"), lty=c(2, 3, 1, 1), cex=cex_legend)
  
}
