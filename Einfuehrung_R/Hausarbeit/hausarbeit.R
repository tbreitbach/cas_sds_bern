############################################################################
# CAS SDS 2020-2021
# Modul: Statistik-Software und Visualisierung von Daten
# Leistungskontrolle, abzugeben bis am 05.02.2021
#
# Name: Tim Breitenbach
############################################################################



# Die Datei spinnen.csv enthaelt Daten zu Spinnen, die im Rahmen eines 
# Forschungsprojekts in einem Auengebiet in den Fallen vorgefunden wurden, 
# welche an 47 verschiedenen Standorten platziert worden waren. Die Fallen 
# wurden normalerweise monatlich kontrolliert und geleert, es konnten aber 
# nicht immer alle Fallenstandorte besucht werden.
# Besten Dank an Sarah Rohr fuer die Erlaubnis, ihre (minimal veraenderten)
# Daten im Rahmen des Statistik-Unterrichts zu verwenden. Bitte die Daten 
# nicht anderweitig weiterverwenden oder weitergeben.



#########################################################
#### Aufgabe 1: Import, Datenaufbereitung (8 Punkte) ####
#########################################################


#### 1 (a) (1 Punkt) ####
# Importieren Sie die Datei als Data Frame "spinnen" ins R. Die einzelnen 
# Variablen in der Datei sind mit Strichpunkten voneinander getrennt.


spinnen = read.csv("../Data/spinnen.csv", sep = ";")



#### 1 (b) (1 Punkt) ####
# Verschaffen Sie sich einen Ueberblick ueber die vorhandenen Variablen.
# Welche eigentlich numerischen Variablen sollte man bearbeiten, bevor man 
# sie verwendet, da sie nicht als Zahlen importiert wurden? Weshalb wurden 
# diese Variablen nicht wie gewuenscht importiert?

head(spinnen)
summary(spinnen)
str(spinnen)

#- ycoor teilweise sind Leerschläge in den
#Zahlen, an welchen R sie als character anstatt als numerische Variable
#erkennen lässt 
#- date wird als Character eingelesen, sieht inital aus
#als wäre irgendetwas nicht richtig, ist aber eigentlich eine Daterange.
#Es muss also nichts verändert werden 
#-Alle Mean Variablen werden als Character eingelesen, da sie Komma anstatt einen Punkt als
#Dezimaltrennzeichen verwenden(Standard ist Punkt und es wird auch Punkt in voherigen Variablen benutzt)

#### 1 (c) (3 Punkte*) ####
# Wie kann man diese Variablen in die gewuenschten numerischen Werte 
# umwandeln?
# Hinweis: Die Funktion gsub ist dafuer nuetzlich - sie ermoeglicht es, in 
#          einem character-Vektor gewisse Zeichenfolgen durch andere zu 
#          ersetzen. Die Verwendung wird in der R-Hilfe (?gsub) erlaeutert. 
#          Die wesentlichen Parameter sind pattern, replacement und x; wenn 
#          Sie den Parameter fixed auf TRUE setzen, brauchen Sie sich 
#          ausserdem nicht mit "regular expressions" zu befassen. Einfachere 
#          Beispiele zur Anwendung finden Sie unter 
#          http://rfunction.com/archives/2354 oder im Code zur Vorlesung vom 
#          20.11.2020.
# Natuerlich sind auch Loesungen ohne gsub erlaubt. Sie duerfen auch die 
# Daten in anderer Form neu importieren - wichtig ist einfach, dass am Ende 
# der Data Frame spinnen alle numerischen Variablen tatsaechlich als 
# "numeric" (oder bei ganzzahligen Werten evtl. "integer") enthaelt.

library(dplyr)
library(stringr)
spinnen <- spinnen %>%
  mutate(ycoor = as.numeric(str_remove(ycoor, " "))) %>%
  mutate(mean_t = as.numeric(str_replace(mean_t, ",", "."))) %>%
  mutate(mean_k = as.numeric(str_replace(mean_k, ",", "."))) %>%
  mutate(mean_l = as.numeric(str_replace(mean_l, ",", "."))) %>%
  mutate(mean_f = as.numeric(str_replace(mean_f, ",", "."))) %>%
  mutate(mean_r = as.numeric(str_replace(mean_r, ",", "."))) %>%
  mutate(mean_n = as.numeric(str_replace(mean_n, ",", "."))) %>%
  mutate(mean_w = as.numeric(str_replace(mean_w, ",", "."))) %>%
  mutate(mean_h = as.numeric(str_replace(mean_h, ",", "."))) %>%
  mutate(mean_d = as.numeric(str_replace(mean_d, ",", ".")))

str(spinnen)
summary(spinnen$ycoor)


# Falls Sie einen Teil der obenstehenden Aufgaben nicht loesen konnten, 
# koennen Sie die soweit aufbereiteten Daten auch direkt aus der Datei 
# spinnen_h1.txt importieren: 
# spinnen <- read.delim('spinnen_h1.txt')



#### 1 (d) (1 Punkt)

#Entfernen Sie alle Zeilen, bei denen die Angabe zu tot_individuals NA
#ist, aus dem Data Frame spinnen. (Dies sind Eintraege zu Fallen, die zum
# entsprechenden Zeitpunkt nicht besucht werden konnten.)

spinnen = spinnen %>%
  filter(!is.na(tot_individuals))

summary(spinnen$tot_individuals)


#### 1 (e) (1 Punkt) ####
# Welche Werte kommen in der Variable month vor, und wie oft?

summary(as.factor(spinnen$month))

#### 1 (f) (1 Punkt) ####
# Erzeugen Sie aus der Variable month eine neue Faktor-Variable month2 im 
# Data Frame spinnen. Die Levels dieses Faktors ("Monatsnamen") sollen 
# sinnvoll geordnet sind.
# (Hinweis: "Dez" bezieht sich auf den Dezember 2018, alle anderen Eintraege 
# aufs Jahr 2019.)
# Lassen Sie sich nun mit dieser Variable nochmals die Haeufigkeiten anzeigen.

spinnen = spinnen %>%
  mutate(month2 = ordered(as.factor(month), levels = c("Dez", "Jan-Feb", "Mrz", "Apr", "Mai", "Jun", "Jun-Jul","Jul", "Jun-Aug", "Aug", "Sept", "Okt", "Nov")))

summary(spinnen$month2)



# Falls Sie einen Teil der obenstehenden Aufgaben nicht loesen konnten, 
# koennen Sie die soweit aufbereiteten Daten auch direkt aus der Datei 
# spinnen_h2.txt importieren (wobei dann allerdings die Reihenfolge der 
# Stufen von month2 nicht wie gewuenscht ist): 
# spinnen <- read.delim('spinnen_h2.txt', colClasses=c(month2='factor')))



###################################################################
#### Aufgabe 2: Analysen mit dem Data Frame spinnen (6 Punkte) ####
###################################################################


#### 2 (a) (1 Punkt) ####
# Erzeugen Sie eine Kreuztabelle: Welche Falle (Variable trapnum) kommt in 
# welchem "Monat" (Variable month2) wie oft im Data Frame spinnen vor?

table(spinnen$trapnum, spinnen$month2)


#### 2 (b) (1 Punkt) ####
# Bestimmen Sie im Data Frame spinnen zur gefundenen Anzahl von Spinnen pro 
# Falle und Zeitpunkt (Variable tot_individuals) das Minimum, das untere 
# Quartil, den Median, das obere Quartil und das Maximum ueber alle 
# Beobachtungen.

spinnen %>%
  group_by(trapnum) %>%
  summarize(min = min(tot_individuals),
            u_quantil = quantile(tot_individuals, 0.25),
            median = median(tot_individuals),
            o_quantil = quantile(tot_individuals, 0.75),
            max = max(tot_individuals))


#### 2 (c) (1 Punkt) ####
# Bestimmen Sie den Mittelwert und die Standardabweichung von tot_individuals. 
# (Was faellt beim Mittelwert im Vergleich zu den Quartilen auf?)

tot_mean = mean(spinnen$tot_individuals)
tot_sd = sd(spinnen$tot_individuals)

spinnen %>%
  group_by(trapnum) %>%
  summarize(min = min(tot_individuals),
            u_quantil = quantile(tot_individuals, 0.25),
            median = median(tot_individuals),
            mean = mean(tot_individuals),
            o_quantil = quantile(tot_individuals, 0.75),
            max = max(tot_individuals),
            sd = sd(tot_individuals))

#Der Mittelwert ist fast immer höher als der Median. Da auch die
#Max-Werte sehr hoch sind liesst dies auf sehr starke positive Ausreisser
#schliessen.

#### 2 (d) (1 Punkt) ####
# Zeichnen Sie ein Histogramm von tot_individuals ueber alle Beobachtungen 
# im Data Frame spinnen. Die Daten sollen dabei in ca. 30 Klassen eingeteilt 
# werden.

hist(spinnen$tot_individuals, nclass = 30)


#### 2 (e) (2 Punkte*) ####
# Erzeugen Sie ein Histogramm der Quadratwurzel von tot_individuals.
# Fuegen Sie beim Histogramm oben eine zusaetzliche Achse hinzu, welche die 
# entsprechenden untransformierten Werte von tot_individuals angibt (mit 
# "Ticks" an den Stellen 0, 1, 5, 10, 20, 30, 40, 60, 80, 100, 140).
# Entfernen Sie den Standard-Titel (d.h. setzen Sie einen "leeren" Titel), 
# damit Platz fuer diese Achse bleibt.

hist(sqrt(spinnen$tot_individuals), main = "")
axis(3, seq(0,12,1), labels = c(0, 1, 5, 10, 20, 30, 40, 60, 80, 100, 140, "", ""))4


##################################################################
#### Aufgabe 3: Aggregieren der Daten pro Falle (11.5 Punkte) ####
##################################################################

# Nun soll ein neuer Data Frame erzeugt werden, der gewisse gleichbleibende 
# Angaben zu jeder einzelnen Falle enthaelt, wobei in diesem Data Frame pro 
# Falle nur noch eine Zeile vorkommen soll.


#### 3 (a) (1 Punkt) ####
# Erzeugen Sie dazu zunaechst einen Vektor mit allen Zeilennummern zum Data 
# Frame spinnen (also mit den ganzen Zahlen von 1 bis zur Anzahl Zeilen).

spinnen = spinnen %>%
  mutate(rownames = as.numeric(rownames(spinnen)))


#### 3 (b) (1 Punkt) ####
# Waehlen Sie aus diesem Vektor die Zeilennummern aus, bei denen die 
# dazugehoerigen Zeilen in spinnen zur Falle 'Sel02' gehoeren.

spinnen %>%
  filter(trapnum == 'Sel02') %>%
  select(rownames)


#### 3 (c) (0.5 Punkte) ####
# Bestimmen Sie die kleinste solche Zeilennummer.

min(spinnen$rownames[spinnen$trapnum == 'Sel02'])


#### 3 (d) (1 Punkt) ####
# Definieren Sie eine Funktion trap.first.row.number, der man als Parameter 
# eine Fallenbezeichnung uebergibt. Die Funktion soll die Nummer der Zeile 
# im Data Frame spinnen zurueckgeben, in der die erste Beobachtung zu dieser 
# Falle steht.

trap.first.row.number = function(trapnum_bez){
  min(spinnen$rownames[spinnen$trapnum == trapnum_bez])
}


#### 3 (e) (0.5 Punkte) ####
# Testen Sie Ihre Funktion: Was ist die erste Zeilennummer, in der eine 
# Beobachtung zur Falle "Sel03" vorkommt?

trap.first.row.number('Sel03')


#### 3 (f) (1.5 Punkte*) ####
# Wenden Sie Ihre Funktion auf jede vorkommende Fallenbezeichnung an 
# und fassen Sie die resultierenden Zeilennummern zu einem Vektor 
# zusammen.

my_vector = c()
for (i in unique(spinnen$trapnum))
{
  my_vector = append(my_vector, trap.first.row.number(i))
}

print(my_vector)



#### 3 (g) (1 Punkt) ####
# Erstellen Sie nun den neuen Data Frame "trapdata", der pro Falle nur eine 
# einzige Zeile enthaelt, mit folgenden Variablen aus dem Data Frame spinnen:
# trapnum, succession, ycoor, xcoor, latitude, longitude, height, tot_plants
# (Falls Sie Teil (f) nicht loesen konnten, nehmen Sie fuer den Moment an, die 
# gewuenschten Zeilennummern waeren in einem Vektor the.rows gespeichert.)

trapdata = spinnen %>%
  select(trapnum, succession, ycoor, xcoor, latitude, longitude, height, tot_plants) %>%
  group_by(trapnum, succession, ycoor, xcoor, latitude, longitude, height, tot_plants) %>%
  summarise()

head(trapdata)


# Falls Sie einen Teil der obenstehenden Aufgaben nicht loesen konnten, 
# koennen Sie den Data Frame trapdata auch direkt mit folgendem Code aus dem 
# Data Frame spinnen erzeugen:
# trapdata <- unique(spinnen[, c('trapnum', 'succession', 'ycoor', 'xcoor', 'latitude', 'longitude', 'height', 'tot_plants')])


#### 3 (h) (1 Punkt) ####
# Sortieren Sie den ganzen Data Frame trapdata nach den Fallennummern 
# (trapnum, aufsteigend).

library(stringr)
trapdata[order(as.numeric(str_sub(trapdata$trapnum, 4,))),]



#### 3 (i) (2 Punkte) ####
# Bestimmen Sie mit dem Data Frame spinnen die Anzahl Tiere, die 
# insgesamt in jeder Falle gefunden wurden - also die Summe der Eintraege 
# in der Variable tot_individuals ueber alle Zeilen, die zur gleichen 
# Falle gehoeren. Speichern Sie diese Anzahlen in einem Vektor 
# individuals.per.trap, dessen Elemente mit den Fallenbezeichnungen 
# benannt sind.

individuals.per.trap = spinnen %>%
  group_by(trapnum) %>%
  summarise(trapnum = unique(trapnum),sum=sum(tot_individuals))%>%
  pull(sum)
head(individuals.per.trap)


#### 3 (j) (1 Punkt) ####
# Stellen Sie diese totale Anzahl der Tiere pro Falle in einem Barplot dar.
# Beschriften Sie die Achse mit den Fallenbezeichnungen mit "Falle".

plot_data = individuals.per.trap = spinnen %>%
  group_by(trapnum) %>%
  summarise(trapnum = unique(trapnum),sum=sum(tot_individuals))


barplot(plot_data$sum, names.arg = plot_data$trapnum, las=2, cex.names=0.5, xlab = "Falle")


#### 3 (k) (1 Punkt) ####
# Fuegen Sie die totale Anzahl der Tiere pro Falle als neue Variable 
# tot_individuals zum Data Frame trapdata hinzu. Stellen Sie dabei sicher, 
# dass die Eintraege den richtigen Fallen zugeordnet werden.

trapdata = spinnen %>%
  select(trapnum, succession, ycoor, xcoor, latitude, longitude, height, tot_plants,tot_individuals) %>%
  group_by(trapnum, succession, ycoor, xcoor, latitude, longitude, height, tot_plants) %>%
  summarise(individuals.per.trap=sum(tot_individuals))

head(trapdata)


# Falls Sie einen Teil der obenstehenden Aufgaben nicht loesen konnten, 
# koennen Sie den Data Frame trapdata auch direkt aus der Datei 
# trapdata_h1.txt importieren: 
# trapdata <- read.delim('trapdata_h1.txt')



#######################################################################
#### Aufgabe 4: Analysen mit dem Data Frame trapdata (13.5 Punkte) ####
#######################################################################


#### 4 (a) (1 Punkt) ####
# Berechnen Sie fuer den Data Frame trapdata den Mittelwert der Variable 
# tot_plants. Ignorieren Sie dabei fehlende Werte.

mean(trapdata$tot_plants, na.rm = TRUE)


#### 4 (b) (1 Punkt) ####
# Zeichnen Sie mit dem Data Frame trapdata einen Scatterplot mit ycoor 
# auf der x-Achse und xcoor auf der y-Achse [!].

plot(trapdata$ycoor, trapdata$xcoor)


#### 4 (c) (1.5 Punkte*) ####
# Ergaenzen Sie im Data Frame trapdata eine Variable succession.color, 
# die pro Wert von succession eine andere Farbe enthaelt: 
# "black" fuer Gravel, "brown" fuer S1, "red" fuer S2, "orange" fuer S3

trapdata = trapdata %>%
  mutate(succession.color = ifelse(succession == "Gravel", "black", ifelse(succession == "S1", "brown", ifelse(succession == "S2", "red", ifelse(succession=="S3", "orange")))))

head(trapdata)

# Falls Sie Teilaufgabe 4 (c) nicht loesen konnten, koennen Sie den 
# ergaenzten Data Frame trapdata auch direkt aus der Datei trapdata_h2.txt 
# importieren: 
# trapdata <- read.delim('trapdata_h2.txt')


#### 4 (d) (0.5 Punkte) ####
# Stellen Sie die Punkte im Scatterplot mit diesen Farben dar, um die 
# succession-Werte farblich zu unterscheiden. Verwenden Sie dabei 
# ausgefuellte Punkte.

plot(trapdata$ycoor, trapdata$xcoor, col=trapdata$succession.color, pch=16)

#### 4 (e) (1 Punkt) ####
# Fuegen Sie eine passende Legende hinzu. Platzieren Sie diese so, dass keine 
# Punkte verdeckt werden.

plot(trapdata$ycoor, trapdata$xcoor, col=trapdata$succession.color, pch=16)
legend(x="bottomright",legend =unique(trapdata$succession), fill = c("orange","red","brown","black"))


#### 4 (f) (1.5 Punkte*) ####
# Zeichnen Sie nochmals einen Scatterplot der gleichen Variablen. Nun soll 
# keine farbliche Unterscheidung in Abhaengigkeit vom succession-Wert mehr 
# verwendet werden, sondern es soll anstelle eines Punktes ein Buchstabe 
# oder eine Ziffer an den entsprechenden Koordinaten verwendet werden, um 
# den Wert von succession anzugeben.
# 
# Vorueberlegungen dazu:
# Wie koennen Sie aus allen Elementen von trapdata$succession jeweils nur 
# das zweite Zeichen bekommen? (0.5 Punkte*)
# Aus dem stringr package kann eine substring function benutzt werden
#str_sub(trapdata$succession

plot(trapdata$ycoor, trapdata$xcoor, pch=str_sub(trapdata$succession, 2,2))

# Wie koennen Sie einen character-Vektor erzeugen, der je nach dem Wert von 
# trapdata$succession den Wert "G", "1", "2" oder "3" hat? (0.5 Punkte*)

ifelse(str_sub(trapdata$succession, 1,1)=="G","G", str_sub(trapdata$succession, 2,2))

# Erzeugen Sie nun den erwaehnten Scatterplot mit den Buchstaben/Ziffern.
# (0.5 Punkte*)

plot(trapdata$ycoor, trapdata$xcoor, pch=ifelse(str_sub(trapdata$succession, 1,1)=="G","G", str_sub(trapdata$succession, 2,2)))


#### 4 (g) (1 Punkt) ####
# Zeichnen Sie in Ihren letzten Scatterplot eine gestrichelte Linie ein, 
# welche die Punkte (2'603'256, 1'196'766), (2'603'464, 1'196'952), 
# (2'603'503, 1'196'929) und (2'603'665, 1'197'075) linear verbindet. 
# (Dies ist ungefaehr der Verlauf eines Stuecks einer Gemeindegrenze.)

gemeinde = data.frame(ycoor = c(2603256, 2603464, 2603503, 2603665), xcoor =c(1196766, 1196952, 1196929, 1197075))
plot(trapdata$ycoor, trapdata$xcoor, pch=ifelse(str_sub(trapdata$succession, 1,1)=="G","G", str_sub(trapdata$succession, 2,2)))
lines(gemeinde$ycoor, gemeinde$xcoor, type="l", lty=3)

#### 4 (h) (1 Punkt) ####
# Bringen Sie bei den Koordinaten (2'603'244, 1'196'972) die Beschriftung 
# "Im Zopfe" an.

plot(trapdata$ycoor, trapdata$xcoor, pch=ifelse(str_sub(trapdata$succession, 1,1)=="G","G", str_sub(trapdata$succession, 2,2)))
lines(gemeinde$ycoor, gemeinde$xcoor, type="l", lty=3)
text(2603244,1196972, "Im Zopfe")


#### 4 (i) (1 Punkt) ####
# Zeichnen Sie gepunktete Hilfslinien bei allen auf der "Karte" sichtbaren 
# Vielfachen von 100 auf den beiden Achsen ein.

plot(trapdata$ycoor, trapdata$xcoor, pch=ifelse(str_sub(trapdata$succession, 1,1)=="G","G", str_sub(trapdata$succession, 2,2)))
lines(gemeinde$ycoor, gemeinde$xcoor, type="l", lty=3)
text(2603244,1196972, "Im Zopfe")
abline(v=seq(2602600, 2603600, by=100), h=seq(119600, 1197300, by=100),col = "lightgray", lty = 2)


#### 4 (j) (1 Punkt*) ####
# Schlagen Sie in der R-Hilfe nach, was der Parameter "asp" in der Funktion 
# plot bewirkt (empfohlener Einstieg: ?plot und dann in der Auswahl "The 
# Default Scatterplot Function" anklicken).
# Verbessern Sie die Kartendarstellung mit Hilfe dieses Parameters.

plot(trapdata$ycoor, trapdata$xcoor, pch=ifelse(str_sub(trapdata$succession, 1,1)=="G","G", str_sub(trapdata$succession, 2,2)), asp = 1.3)
lines(gemeinde$ycoor, gemeinde$xcoor, type="l", lty=3)
text(2603244,1196972, "Im Zopfe")
abline(v=seq(2602600, 2603600, by=100), h=seq(119600, 1197300, by=100),col = "lightgray", lty = 2)


#### 4 (k) (1 Punkt) ####
# Bestimmen Sie im Data Frame trapdata die Pearson- und die Spearman-
# Korrelation von ycoor und xcoor. (Was faellt auf?)

cor(trapdata$xcoor, trapdata$ycoor, method = "pearson",use = "complete.obs")
cor(trapdata$xcoor, trapdata$ycoor, method = "spearman", use = "complete.obs")

#Starke Korrelation und kaum Abweichung bei beiden Methoden.

#### 4 (l) (2 Punkte) ####
# Stellen Sie die totale Anzahl Tiere pro Falle in Abhaengigkeit von der 
# Variable succession dar - mit einem Boxplot und mit einer Alternative dazu.

library(vioplot)
boxplot(trapdata$individuals.per.trap ~ trapdata$succession)
vioplot(trapdata$individuals.per.trap ~ trapdata$succession)



##############################################################
#### Aufgabe 5: Simulation vereinfachter Daten (6 Punkte) ####
##############################################################


# Stellen Sie sich vor, Sie haetten die realen Daten noch nicht. Erzeugen Sie 
# einen leicht vereinfachten, simulierten Data Frame trapdata.sim, den Sie zu 
# Testzwecken verwenden koennten. Dieser Data Frame soll 47 Zeilen umfassen 
# und folgende Variablen enthalten:
# - trapnum mit den Werten "Sel01", ..., "Sel47" (1.5 Punkte*)
#   (oder allenfalls ohne die fuehrenden Nullen, also "Sel1", ..., "Sel9", 
#   "Sel10", ..., "Sel47" - diese Variante ergibt 1 Punkt)
# - succession: 2x "Gravel" und je 15x "S1", "S2" und "S3", in zufaelliger 
#   Reihenfolge (1.5 Punkte)
# - ycoor: uniformverteilt auf [2602650, 2603600], gerundet auf ganze Zahlen 
#   (1 Punkt)
# - xcoor: uniformverteilt auf [1196800, 1197200], gerundet auf ganze Zahlen 
#   (1 Punkt)
# - tot_plants: Poisson-verteilt mit Parameter lambda=15 (0.5 Punkte)
# - tot_individuals: Poisson-verteilt mit Parameter lambda=200 (0.5 Punkte)

trapdata.sim = data.frame(trapnum = str_c("Sel", str_pad(seq(1, 47, by=1), 2, pad="0")), 
                          succession = sample(rep(c("Gravel","S1","S2","S3"),times=c(2,15,15,15))),
                          ycoor = runif(1:47, min = 2602650, max=2603600),
                          xcoor = runif(1:47, min = 1196800, max=1197200),
                          tot_plants = rpois(1:47, 15),
                          tot_individuals = rpois(1:47, 200))
head(trapdata.sim)


