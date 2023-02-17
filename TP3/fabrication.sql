prompt "Suppression des relations"
BEGIN
EXECUTE IMMEDIATE 'DROP TABLE OPERATEUR';
EXCEPTION
 WHEN OTHERS THEN
	IF SQLCODE != -942 THEN
	RAISE;
	END IF;
END;
/


BEGIN
EXECUTE IMMEDIATE 'DROP TABLE MACHINE';
EXCEPTION
 WHEN OTHERS THEN
	IF SQLCODE != -942 THEN
	RAISE;
	END IF;
END;
/

BEGIN
EXECUTE IMMEDIATE 'DROP TABLE PIECE';
EXCEPTION
 WHEN OTHERS THEN
	IF SQLCODE != -942 THEN
	RAISE;
	END IF;
END;
/

BEGIN
EXECUTE IMMEDIATE 'DROP TABLE QUALIFIE_SUR';
EXCEPTION
 WHEN OTHERS THEN
	IF SQLCODE != -942 THEN
	RAISE;
	END IF;
END;
/

/********************************************/

CREATE TABLE Operateur (
  numero VARCHAR(50),
  nom VARCHAR(50),
  PRIMARY KEY (numero)
);

CREATE TABLE Machine (
  referenceM VARCHAR(50),
  designationM VARCHAR(100),
  PRIMARY KEY (referenceM)
);

CREATE TABLE Piece (
  referenceP VARCHAR(50),
  designationP VARCHAR(100),
  reference_machine VARCHAR(50) REFERENCES Machine(referenceM),
  numero_operateur VARCHAR(50) REFERENCES Operateur(numero),
  quantite INT,
  PRIMARY KEY (referenceP)
);

ALTER SESSION SET NLS_DATE_FORMAT='DD/MM/YYYY';
--SELECT to_char(dateNaiss,'DD') from personnes;
--to_date('20/01/03','DD/MM/YY');

CREATE TABLE Qualifie_sur (
  numero_operateur VARCHAR(50) REFERENCES Operateur(numero),
  reference_machine VARCHAR(50) REFERENCES Machine(referenceM),
  date_f date,
  PRIMARY KEY (numero_operateur,reference_machine)
) ;

INSERT INTO Operateur VALUES('OP42','Robert',32);
INSERT INTO Operateur VALUES('OP10','Sophie',41);
INSERT INTO Operateur VALUES('OP78','Lucette',25);
INSERT INTO Operateur VALUES('OP22','Albert',25);
INSERT INTO Operateur VALUES('OP57','Marc',38);

INSERT INTO Machine VALUES('M12','Perceuse');
INSERT INTO Machine VALUES('M13','Ponceuse');
INSERT INTO Machine VALUES('M14','Tour numérique');

INSERT INTO Piece VALUES('P1','Pièce 1','M12', 'OP10', 250);
INSERT INTO Piece VALUES('P2','Pièce 2','M12', 'OP22', 600);
INSERT INTO Piece VALUES('P3','Pièce 3','M14', 'OP22', 200);
INSERT INTO Piece VALUES('P4','Pièce 4','M13', 'OP78', 150);

INSERT INTO Qualifie_sur VALUES('OP10','M12',15/01/2000);
INSERT INTO Qualifie_sur VALUES('OP22','M12',20/05/2001);
INSERT INTO Qualifie_sur VALUES('OP10','M13',10/10/1999);
INSERT INTO Qualifie_sur VALUES('OP42','M13',17/01/2002);
INSERT INTO Qualifie_sur VALUES('OP78','M12',19/07/1998);
INSERT INTO Qualifie_sur VALUES('OP10','M14',04/05/2001);