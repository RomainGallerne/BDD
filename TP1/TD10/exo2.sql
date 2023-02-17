/*Question 1*/
SELECT titre FROM Publication ORDER BY date;

/*Question 2*/
SELECT nom, prenom, COUNT(*) AS nbPubA FROM Chercheur, TypePublication, Publication, Chercheur-Publication WHERE (TypoePublication.typePub = Publication.typePub) AND (Publication.codePub = Chercheur-Publication.codePub) AND (Chercheur-Publication.codeChe = Chercheur.codeChe) AND (TypePublication.rang = 'A') GROUP BY nom,prenom,Chercheur.codeChe;

/*Question 3*/
SELECT nom, prenom FROM Chercheur, Chercheur-Publication, Publication WHERE (Chercheur.codeChe = Chercheur-Publication.codeChe) AND (Chercheur-Publication.codePub = Publication.codePub) AND (Publication.codePub NOT IN (SELECT codePub FROM Publication WHERE (date = 2019)) GROUP BY nom,prenom,Chercheur.codeChe;

/*Question 4*/
SELECT nom, prenom FROM Chercheur C1, Chercheur-Publication, Publication WHERE (C1.codeChe = Chercheur-Publication.codeChe) AND (Chercheur-Publication.codePub = Publication.codePub) AND (Publication.date = 2019) GROUP BY nom, prenom, codeChe HAVING COUNT(*)>=2;

/*Question 5*/
SELECT nom, prenom, titre FROM Chercherur C1, Chercheur-Publication CP1, Publication P1 WHERE (C1.codeChe = CP1.codeChe) AND (CP1.codePub = P1.codePub) AND (P1.date >= ALL(SELECT date FROM Publication P2, Chercheur-Publication CP2 WHERE (CP2.codePub = P2.codePub) AND (CP2.codeChe = C1.codeChe))) GROUP BY C1.nom, C1.prenom, C1.codeChe;