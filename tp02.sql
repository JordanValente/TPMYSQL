CREATE TABLE ARTICLE (
                       ID INT(11) KEY,
                       REF VARCHAR(50),
                       DESIGNATION VARCHAR(255),
                       PRIX DECIMAL(7,2),
                       ID_FOU INT(11)
);
CREATE TABLE FOURNISSEUR (
                           ID INT(11) PRIMARY KEY,
                           NOM VARCHAR(25)
);
CREATE TABLE COMPO (
                     ID INT(11) PRIMARY KEY,
                     QTE DECIMAL(7,2),
                     ID_ART INT(11),
                     ID_BON INT(11)
);
CREATE TABLE BON (
                   ID INT(11) PRIMARY KEY,
                   NUMERO VARCHAR(20),
                   DATE_CMDE DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                   DELAI INT(11),
                   ID_FOU INT(11),
                   FOREIGN KEY (ID_FOU) REFERENCES FOURNISSEUR(ID)
);

ALTER TABLE article ADD constraint foreign key  (ID_FOU) references FOURNISSEUR(ID)
ALTER TABLE bon ADD constraint foreign key  (ID_FOU) references article(ID)
ALTER TABLE compo ADD constraint foreign key  (ID_ART) references COMPO(ID)
ALTER TABLE COMPO ADD constraint foreign key  (ID_BON) references BON(ID)

INSERT INTO FOURNISSEUR (ID, NOM) VALUES
                                    (1, 'Française d''Imports'),
                                    (2, 'FDM SA'),
                                    (3, 'Dubois & Fils');


INSERT INTO ARTICLE (ID, REF, DESIGNATION, PRIX, ID_FOU) VALUES
                                                           (1, 'A01', 'Perceuse P1', 74.99, 1),
                                                           (2, 'F01', 'Boulon laiton 4 x 40 mm (sachet de 10)', 2.25, 2),
                                                           (3, 'F02', 'Boulon laiton 5 x 40 mm (sachet de 10) - A', 4.45, 2),
                                                           (4, 'D01', 'Boulon laiton 5 x 40 mm (sachet de 10) - B', 4.40, 3),
                                                           (5, 'A02', 'Meuleuse 125mm', 37.85, 1),
                                                           (6, 'D03', 'Boulon acier zingué 4 x 40mm (sachet de 10)', 1.80, 3),
                                                           (7, 'A03', 'Perceuse à colonne', 185.25, 1),
                                                           (8, 'D04', 'Coffret mêches à bois', 12.25, 3),
                                                           (9, 'F03', 'Coffret mêches plates', 6.25, 2),
                                                           (10, 'F04', 'Fraises d''encastrement', 8.14, 2);

INSERT INTO BON (NUMERO, DATE_CMDE, DELAI, ID_FOU)
VALUES ('001', '2025-10-23', 3, 1);
INSERT INTO COMPO (ID_ART, ID_BON, QTE) VALUES
                                          (1, 1, 3),  -- 3 Perceuses P1
                                          (5, 1, 4),  -- 4 Meuleuses 125mm
                                          (7, 1, 1);  -- 1 Perceuse à colonne

