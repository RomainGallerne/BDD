--Exo1-1
SELECT titre FROM film WHERE (nbspectateurs>(SELECT AVG(nbspectateurs) AS Moy FROM film));

--Exo1-2
SELECT DISTINCT nom, prenom FROM realisateur, film WHERE (realisateur.idR=film.idRealisateur AND nbspectateurs>(SELECT AVG(nbspectateurs) AS Moy FROM film));

--Exo1-3
SELECT DISTINCT nom, prenom FROM acteur, film, jouer WHERE (acteur.idA=jouer.idActeur AND jouer.idFilm=film.idF AND film.nbspectateurs=(SELECT MAX(nbspectateurs) AS Moy FROM film));

--Exo1-4
SELECT DISTINCT nom, prenom FROM acteur, jouer WHERE (acteur.idA=jouer.idActeur AND acteur.idA NOT IN(SELECT idActeur FROM jouer));

--Exo1-5
SELECT DISTINCT description FROM genre WHERE idG NOT IN(SELECT idGenre FROM film);

--Exo1-6
SELECT DISTINCT nom, prenom FROM realisateur, film WHERE (realisateur.idR=film.idRealisateur AND realisateur.idR NOT IN (SELECT idR FROM film, realisateur WHERE realisateur.idR=film.idRealisateur AND film.annee>2002 AND film.idRealisateur NOT NULL));

--Exo1-7
SELECT idG, description FROM genre, film WHERE (genre.idG=film.idGenre) GROUP BY idG, description HAVING (MIN(nbspectateurs)>50000);