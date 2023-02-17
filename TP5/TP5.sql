/*prompt "Suppression des relations"
********************************************
BEGIN
EXECUTE IMMEDIATE 'DROP TABLE CLIENT';
EXCEPTION
 WHEN OTHERS THEN
	IF SQLCODE != -942 THEN
	RAISE;
	END IF;
END;
/

BEGIN
EXECUTE IMMEDIATE 'DROP TABLE LOCAL';
EXCEPTION
 WHEN OTHERS THEN
	IF SQLCODE != -942 THEN
	RAISE;
	END IF;
END;
/

BEGIN
EXECUTE IMMEDIATE 'DROP TABLE ACTIVITE';
EXCEPTION
 WHEN OTHERS THEN
	IF SQLCODE != -942 THEN
	RAISE;
	END IF;
END;
/

BEGIN
EXECUTE IMMEDIATE 'DROP TABLE RUE';
EXCEPTION
 WHEN OTHERS THEN
	IF SQLCODE != -942 THEN
	RAISE;
	END IF;
END;
/

BEGIN
EXECUTE IMMEDIATE 'DROP TABLE DEMANDE';
EXCEPTION
 WHEN OTHERS THEN
	IF SQLCODE != -942 THEN
	RAISE;
	END IF;
END;
/

BEGIN
EXECUTE IMMEDIATE 'DROP TABLE PROPOSE';
EXCEPTION
 WHEN OTHERS THEN
	IF SQLCODE != -942 THEN
	RAISE;
	END IF;
END;
/

BEGIN
EXECUTE IMMEDIATE 'DROP TABLE FACADE';
EXCEPTION
 WHEN OTHERS THEN
	IF SQLCODE != -942 THEN
	RAISE;
	END IF;
END;
/

BEGIN
EXECUTE IMMEDIATE 'DROP TABLE ENGLOBE';
EXCEPTION
 WHEN OTHERS THEN
	IF SQLCODE != -942 THEN
	RAISE;
	END IF;
END;
/

********************************************
prompt "Creation des tables"
*/
CREATE TABLE client (
  numC INT NOT NULL,
  nom VARCHAR(50) NOT NULL,
  prenom VARCHAR(50) NOT NULL,
  numTel INT NOT NULL,
  enseigne VARCHAR(50),
  PRIMARY KEY (numC)
);

CREATE TABLE local (
  adresse VARCHAR(100) NOT NULL,
  superficie INT NOT NULL,
  code INT REFERENCES activite(code),
  PRIMARY KEY (adresse)
);

CREATE TABLE activite (
  code INT,
  libelle VARCHAR(100),
  PRIMARY KEY (code)
);

CREATE TABLE rue (
  nom VARCHAR(100),
  type VARCHAR(100),
  clientele VARCHAR(100),
  PRIMARY KEY (nom) 
) ;

CREATE TABLE demande (
  numClient INT REFERENCES client(numC) NOT NULL,
  nomRue VARCHAR(100) REFERENCES rue(nom) NOT NULL,
  codeActivite INT REFERENCES activite(code) NOT NULL,
  numD INT,
  surfaceMin INT,
  surfaceMax INT,
  etat VARCHAR(50) NOT NULL,
  traitant VARCHAR(50),
  PRIMARY KEY (numD)
);

CREATE TABLE propose (
  numClient INT REFERENCES client(numC),
  adresseLocal VARCHAR(100) REFERENCES local(adresse),
  loyer INT,
  etat VARCHAR(50),
  traitant VARCHAR(50),
  PRIMARY KEY (numClient,adresseLocal)
);

CREATE TABLE facade (
  adresseLocal VARCHAR(100) REFERENCES local(adresse),
  nomRue VARCHAR(100) REFERENCES rue(nom),
  surfaceVitre INT,
  nbPortes INT,
  PRIMARY KEY (adresseLocal,nomRue)
);

CREATE TABLE englobe (
  codeEnglobante INT REFERENCES activite(code),
  codeEnglobe INT REFERENCES activite(code),
  PRIMARY KEY (codeEnglobante,codeEnglobe)
);