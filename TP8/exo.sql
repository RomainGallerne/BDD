/*Question 1*/
SELECT acteur.nom, acteur.prenom, F1.titre FROM acteur, film F1, jouer J1 WHERE acteur.idA = J1.idActeur AND F1.idF = J1.idFilm AND nbspectateurs >= ALL(SELECT F2.nbspectateurs FROM film F2, jouer J2 WHERE F2.idF = J2.idFilm AND J2.idActeur = idA);

/*Question 2*/
SELECT acteur.nom, acteur.prenom, F1.titre FROM acteur, film F1, jouer J1 WHERE acteur.idA = J1.idActeur AND F1.idF = J1.idFilm AND salaire >= ALL(SELECT J2.salaire FROM film F2, jouer J2 WHERE F2.idF = J2.idFilm AND J2.idActeur = idA);

/*Question 3*/
SELECT nom, prenom, F1.titre FROM realisateur, film F1 WHERE F1.idRealisateur = realisateur.idR AND nbspectateurs >= ALL(SELECT F2.nbspectateurs FROM film F2 WHERE F2.idRealisateur = idR);

/*Question 4*/
SELECT genre.description FROM genre WHERE 