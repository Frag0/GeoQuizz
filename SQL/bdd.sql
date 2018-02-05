#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Serie
#------------------------------------------------------------

CREATE TABLE Serie(
        Id        int (11) Auto_increment  NOT NULL ,
        Id_Niveau Int NOT NULL ,
        Id_Ville  Int NOT NULL ,
        PRIMARY KEY (Id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Ville
#------------------------------------------------------------

CREATE TABLE Ville(
        Id        int (11) Auto_increment  NOT NULL ,
        Nom       Varchar (25) NOT NULL ,
        Longitude Varchar (52) NOT NULL ,
        Latitude  Varchar (52) NOT NULL ,
        PRIMARY KEY (Id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Niveau
#------------------------------------------------------------

CREATE TABLE Niveau(
        Id         int (11) Auto_increment  NOT NULL ,
        Nom        Varchar (25) NOT NULL ,
        Nbr_photos Int NOT NULL ,
        PRIMARY KEY (Id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Photo
#------------------------------------------------------------

CREATE TABLE Photo(
        Id        int (11) Auto_increment  NOT NULL ,
        Url       Varchar (500) NOT NULL ,
        Longitude Varchar (250) NOT NULL ,
        Latitude  Varchar (250) NOT NULL ,
        Id_Ville  Int NOT NULL ,
        PRIMARY KEY (Id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Score
#------------------------------------------------------------

CREATE TABLE Score(
        Id       int (11) Auto_increment  NOT NULL ,
        Pseudo   Varchar (250) ,
        Nombre   Int NOT NULL ,
        Id_Serie Int NOT NULL ,
        PRIMARY KEY (Id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: User
#------------------------------------------------------------

CREATE TABLE User(
        Id          int (11) Auto_increment  NOT NULL ,
        Identifiant Varchar (250) NOT NULL ,
        Password    Varchar (250) NOT NULL ,
        Mail        Varchar (250) ,
        PRIMARY KEY (Id )
)ENGINE=InnoDB;

ALTER TABLE Serie ADD CONSTRAINT FK_Serie_Id_Niveau FOREIGN KEY (Id_Niveau) REFERENCES Niveau(Id);
ALTER TABLE Serie ADD CONSTRAINT FK_Serie_Id_Ville FOREIGN KEY (Id_Ville) REFERENCES Ville(Id);
ALTER TABLE Photo ADD CONSTRAINT FK_Photo_Id_Ville FOREIGN KEY (Id_Ville) REFERENCES Ville(Id);
ALTER TABLE Score ADD CONSTRAINT FK_Score_Id_Serie FOREIGN KEY (Id_Serie) REFERENCES Serie(Id);
