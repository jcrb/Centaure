## ------------------------------------------------------------------------

nom.col<- c("dossier","Libelle","Date","Age_en_clair","Age_en_annees","Age_en_jours","Nombre","Mission","Moyen","Commune","Etablissement_intervention","Sexe","Devenir","Moyen_evac","Commune_destination","Etablissement_destination","Service_destination")

path <- "../"

file <- paste0(path, "data/activite_helico_2013.csv")
he <- read.csv(file)
colnames(he) <- nom.col
h2 <- he[!duplicated(he$dossier),]
H2013 <- h2

file <- paste0(path, "data/activite_helico_2012.csv")
he <- read.csv(file)
colnames(he) <- nom.col
h2 <- he[!duplicated(he$dossier),]
H2012 <- h2


## ------------------------------------------------------------------------
h2 <- rbind(H2012, H2013)


## ------------------------------------------------------------------------
h2$Jour <- as.Date(substr(h2$Date, 1, 10), "%d/%m/%Y")
h2$heure <- substr(h2$Date, 12, 17) # heures/minutes

h2$he <- substr(h2$Date, 12, 13) # heures pleines
barplot(table(as.factor(h2$he))) # primaires et secondaires
barplot(table(h2$Mission, as.factor(h2$he))) # primaireset secondaires séparées
barplot(table(h2$Mission, as.factor(h2$he)), beside = TRUE)



## ------------------------------------------------------------------------
n.missions <- nrow(h2)
n.missions.jour <- n.missions/365

table(h2$Mission)
prop.table(table(h2$Mission))

table(h2$Sexe)
table(h2$Devenir)
table(h2$Devenir, h2$Mission)

table(h2$Commune_destination)
table(h2$Commune_destination, h2$Mission)


## ------------------------------------------------------------------------
summary(h2$Age_en_annees)
hist(h2$Age_en_annees)
boxplot(h2$Age_en_annees ~ h2$Sexe)


## ------------------------------------------------------------------------
table(h2$Commune[h2$Mission == "Primaire"])


