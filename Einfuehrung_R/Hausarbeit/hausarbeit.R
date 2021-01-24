############################################################################
# CAS SDS 2020-2021
# Modul: Statistik-Software und Visualisierung von Daten
# Leistungskontrolle, abzugeben bis am 05.02.2021
#
# Name: 
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

...


#### 1 (b) (1 Punkt) ####
# Verschaffen Sie sich einen Ueberblick ueber die vorhandenen Variablen.
# Welche eigentlich numerischen Variablen sollte man bearbeiten, bevor man 
# sie verwendet, da sie nicht als Zahlen importiert wurden? Weshalb wurden 
# diese Variablen nicht wie gewuenscht importiert?

...

# ...


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

...


# Falls Sie einen Teil der obenstehenden Aufgaben nicht loesen konnten, 
# koennen Sie die soweit aufbereiteten Daten auch direkt aus der Datei 
# spinnen_h1.txt importieren: 
# spinnen <- read.delim('spinnen_h1.txt')


#### 1 (d) (1 Punkt) ####
# Entfernen Sie alle Zeilen, bei denen die Angabe zu tot_individuals NA ist, 
# aus dem Data Frame spinnen.
# (Dies sind Eintraege zu Fallen, die zum entsprechenden Zeitpunkt nicht 
# besucht werden konnten.)

...


#### 1 (e) (1 Punkt) ####
# Welche Werte kommen in der Variable month vor, und wie oft?

...


#### 1 (f) (1 Punkt) ####
# Erzeugen Sie aus der Variable month eine neue Faktor-Variable month2 im 
# Data Frame spinnen. Die Levels dieses Faktors ("Monatsnamen") sollen 
# sinnvoll geordnet sind.
# (Hinweis: "Dez" bezieht sich auf den Dezember 2018, alle anderen Eintraege 
# aufs Jahr 2019.)
# Lassen Sie sich nun mit dieser Variable nochmals die Haeufigkeiten anzeigen.

...



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

...


#### 2 (b) (1 Punkt) ####
# Bestimmen Sie im Data Frame spinnen zur gefundenen Anzahl von Spinnen pro 
# Falle und Zeitpunkt (Variable tot_individuals) das Minimum, das untere 
# Quartil, den Median, das obere Quartil und das Maximum ueber alle 
# Beobachtungen.

...


#### 2 (c) (1 Punkt) ####
# Bestimmen Sie den Mittelwert und die Standardabweichung von tot_individuals. 
# (Was faellt beim Mittelwert im Vergleich zu den Quartilen auf?)

...


#### 2 (d) (1 Punkt) ####
# Zeichnen Sie ein Histogramm von tot_individuals ueber alle Beobachtungen 
# im Data Frame spinnen. Die Daten sollen dabei in ca. 30 Klassen eingeteilt 
# werden.

...


#### 2 (e) (2 Punkte*) ####
# Erzeugen Sie ein Histogramm der Quadratwurzel von tot_individuals.
# Fuegen Sie beim Histogramm oben eine zusaetzliche Achse hinzu, welche die 
# entsprechenden untransformierten Werte von tot_individuals angibt (mit 
# "Ticks" an den Stellen 0, 1, 5, 10, 20, 30, 40, 60, 80, 100, 140).
# Entfernen Sie den Standard-Titel (d.h. setzen Sie einen "leeren" Titel), 
# damit Platz fuer diese Achse bleibt.

...



##################################################################
#### Aufgabe 3: Aggregieren der Daten pro Falle (11.5 Punkte) ####
##################################################################

# Nun soll ein neuer Data Frame erzeugt werden, der gewisse gleichbleibende 
# Angaben zu jeder einzelnen Falle enthaelt, wobei in diesem Data Frame pro 
# Falle nur noch eine Zeile vorkommen soll.


#### 3 (a) (1 Punkt) ####
# Erzeugen Sie dazu zunaechst einen Vektor mit allen Zeilennummern zum Data 
# Frame spinnen (also mit den ganzen Zahlen von 1 bis zur Anzahl Zeilen).

...


#### 3 (b) (1 Punkt) ####
# Waehlen Sie aus diesem Vektor die Zeilennummern aus, bei denen die 
# dazugehoerigen Zeilen in spinnen zur Falle 'Sel02' gehoeren.

...


#### 3 (c) (0.5 Punkte) ####
# Bestimmen Sie die kleinste solche Zeilennummer.

...


#### 3 (d) (1 Punkt) ####
# Definieren Sie eine Funktion trap.first.row.number, der man als Parameter 
# eine Fallenbezeichnung uebergibt. Die Funktion soll die Nummer der Zeile 
# im Data Frame spinnen zurueckgeben, in der die erste Beobachtung zu dieser 
# Falle steht.

...


#### 3 (e) (0.5 Punkte) ####
# Testen Sie Ihre Funktion: Was ist die erste Zeilennummer, in der eine 
# Beobachtung zur Falle "Sel03" vorkommt?

...


#### 3 (f) (1.5 Punkte*) ####
# Wenden Sie Ihre Funktion auf jede vorkommende Fallenbezeichnung an 
# und fassen Sie die resultierenden Zeilennummern zu einem Vektor 
# zusammen.

...


#### 3 (g) (1 Punkt) ####
# Erstellen Sie nun den neuen Data Frame "trapdata", der pro Falle nur eine 
# einzige Zeile enthaelt, mit folgenden Variablen aus dem Data Frame spinnen:
# trapnum, succession, ycoor, xcoor, latitude, longitude, height, tot_plants
# (Falls Sie Teil (f) nicht loesen konnten, nehmen Sie fuer den Moment an, die 
# gewuenschten Zeilennummern waeren in einem Vektor the.rows gespeichert.)

...


# Falls Sie einen Teil der obenstehenden Aufgaben nicht loesen konnten, 
# koennen Sie den Data Frame trapdata auch direkt mit folgendem Code aus dem 
# Data Frame spinnen erzeugen:
# trapdata <- unique(spinnen[, c('trapnum', 'succession', 'ycoor', 'xcoor', 'latitude', 'longitude', 'height', 'tot_plants')])


#### 3 (h) (1 Punkt) ####
# Sortieren Sie den ganzen Data Frame trapdata nach den Fallennummern 
# (trapnum, aufsteigend).

...



#### 3 (i) (2 Punkte) ####
# Bestimmen Sie mit dem Data Frame spinnen die Anzahl Tiere, die 
# insgesamt in jeder Falle gefunden wurden - also die Summe der Eintraege 
# in der Variable tot_individuals ueber alle Zeilen, die zur gleichen 
# Falle gehoeren. Speichern Sie diese Anzahlen in einem Vektor 
# individuals.per.trap, dessen Elemente mit den Fallenbezeichnungen 
# benannt sind.

...


#### 3 (j) (1 Punkt) ####
# Stellen Sie diese totale Anzahl der Tiere pro Falle in einem Barplot dar.
# Beschriften Sie die Achse mit den Fallenbezeichnungen mit "Falle".

...


#### 3 (k) (1 Punkt) ####
# Fuegen Sie die totale Anzahl der Tiere pro Falle als neue Variable 
# tot_individuals zum Data Frame trapdata hinzu. Stellen Sie dabei sicher, 
# dass die Eintraege den richtigen Fallen zugeordnet werden.

...



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

...


#### 4 (b) (1 Punkt) ####
# Zeichnen Sie mit dem Data Frame trapdata einen Scatterplot mit ycoor 
# auf der x-Achse und xcoor auf der y-Achse [!].

...


#### 4 (c) (1.5 Punkte*) ####
# Ergaenzen Sie im Data Frame trapdata eine Variable succession.color, 
# die pro Wert von succession eine andere Farbe enthaelt: 
# "black" fuer Gravel, "brown" fuer S1, "red" fuer S2, "orange" fuer S3

...


# Falls Sie Teilaufgabe 4 (c) nicht loesen konnten, koennen Sie den 
# ergaenzten Data Frame trapdata auch direkt aus der Datei trapdata_h2.txt 
# importieren: 
# trapdata <- read.delim('trapdata_h2.txt')


#### 4 (d) (0.5 Punkte) ####
# Stellen Sie die Punkte im Scatterplot mit diesen Farben dar, um die 
# succession-Werte farblich zu unterscheiden. Verwenden Sie dabei 
# ausgefuellte Punkte.

...


#### 4 (e) (1 Punkt) ####
# Fuegen Sie eine passende Legende hinzu. Platzieren Sie diese so, dass keine 
# Punkte verdeckt werden.

...


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

...

# Wie koennen Sie einen character-Vektor erzeugen, der je nach dem Wert von 
# trapdata$succession den Wert "G", "1", "2" oder "3" hat? (0.5 Punkte*)

...

# Erzeugen Sie nun den erwaehnten Scatterplot mit den Buchstaben/Ziffern.
# (0.5 Punkte*)

...


#### 4 (g) (1 Punkt) ####
# Zeichnen Sie in Ihren letzten Scatterplot eine gestrichelte Linie ein, 
# welche die Punkte (2'603'256, 1'196'766), (2'603'464, 1'196'952), 
# (2'603'503, 1'196'929) und (2'603'665, 1'197'075) linear verbindet. 
# (Dies ist ungefaehr der Verlauf eines Stuecks einer Gemeindegrenze.)

...


#### 4 (h) (1 Punkt) ####
# Bringen Sie bei den Koordinaten (2'603'244, 1'196'972) die Beschriftung 
# "Im Zopfe" an.

...


#### 4 (i) (1 Punkt) ####
# Zeichnen Sie gepunktete Hilfslinien bei allen auf der "Karte" sichtbaren 
# Vielfachen von 100 auf den beiden Achsen ein.

...


#### 4 (j) (1 Punkt*) ####
# Schlagen Sie in der R-Hilfe nach, was der Parameter "asp" in der Funktion 
# plot bewirkt (empfohlener Einstieg: ?plot und dann in der Auswahl "The 
# Default Scatterplot Function" anklicken).
# Verbessern Sie die Kartendarstellung mit Hilfe dieses Parameters.

...


#### 4 (k) (1 Punkt) ####
# Bestimmen Sie im Data Frame trapdata die Pearson- und die Spearman-
# Korrelation von ycoor und xcoor. (Was faellt auf?)

...


#### 4 (l) (2 Punkte) ####
# Stellen Sie die totale Anzahl Tiere pro Falle in Abhaengigkeit von der 
# Variable succession dar - mit einem Boxplot und mit einer Alternative dazu.

...



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

...

