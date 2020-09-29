Create Table "Roles"(
    "ID" smallint IDENTITY(1, 1) NOT NULL PRIMARY KEY ,
    "RoleName" nvarchar(30),
)
Create Table "Semesters"(
    "ID" smallint IDENTITY(1, 1) NOT NULL PRIMARY KEY,
    "SemesterName" nvarchar(80),
    "State" nvarchar(80),
    "Capacity" int NULL
)
Create Table "Users"(
    "ID" smallint IDENTITY(1, 1) NOT NULL PRIMARY KEY,
    "FullName" nvarchar(60)NULL,
    "Email" nvarchar(80)NULL,
    "Password" nvarchar(40)NULL,
    "RoleID" smallint NULL FOREIGN KEY REFERENCES Roles(ID)
)
Create Table "Academicians"(
    "ID" smallint IDENTITY(1, 1) NOT NULL PRIMARY KEY,
    "Academician" nvarchar(60)NULL,
    "Email" nvarchar(80)NULL,
    "Password" nvarchar(40)NULL,
    "RoleID" smallint NULL FOREIGN KEY REFERENCES Roles(ID)
)

Create Table "Options"(
    "ID" smallint IDENTITY(1, 1) NOT NULL PRIMARY KEY,
    "RegistrationDate" nvarchar(40) NULL,
    "UserID" smallint NULL FOREIGN KEY REFERENCES Users(ID),
    "SemesterID" smallint NULL FOREIGN KEY REFERENCES Semesters(ID),
    "AcademicianID" smallint NULL FOREIGN KEY REFERENCES Academicians(ID)
)

INSERT INTO Semesters(SemesterName,Capacity,State) VALUES
('2020-2021 Yılı Bilgisayar Mühendisliği Uygulamaları 2 Dersi', 60,'ON'),
('2020-2021 Yılı Bilgisayar Mühendisliği Uygulamaları 1 Dersi', 80,'OFF')

INSERT INTO Roles(RoleName) VALUES
('Admin'),
('Academician'),
('Authorized'),
('Student')

INSERT INTO Users(FullName,Email,Password,RoleID) VALUES
('Test User','test@test.com','test',4)

INSERT INTO Academicians(Academician,Email,Password,RoleID) VALUES
('Admin Acd','admin@test.com','admin',1),
('Test Acd','testacd2@test.com','test',2),
('Yetkili Acd','yetkili@test.com','yetkili',3)

