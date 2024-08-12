CREATE DATABASE OgrenciVeritabani;

USE OgrenciVeritabani;

CREATE TABLE Ogrenciler (
    OgrenciID INT AUTO_INCREMENT PRIMARY KEY,
    Ad VARCHAR(50) NOT NULL,
    Soyad VARCHAR(50) NOT NULL,
    OgrenciNumarasi VARCHAR(20) UNIQUE NOT NULL,
    Bolum VARCHAR(50) NOT NULL
);

CREATE TABLE Dersler (
    DersID INT AUTO_INCREMENT PRIMARY KEY,
    DersAdi VARCHAR(100) NOT NULL,
    DersKodu VARCHAR(10) UNIQUE NOT NULL
);

CREATE TABLE Notlar (
    NotID INT AUTO_INCREMENT PRIMARY KEY,
    OgrenciID INT,
    DersID INT,
    Notu DECIMAL(5, 2),
    FOREIGN KEY (OgrenciID) REFERENCES Ogrenciler(OgrenciID),
    FOREIGN KEY (DersID) REFERENCES Dersler(DersID)
);

INSERT INTO Ogrenciler (Ad, Soyad, OgrenciNumarasi, Bolum) VALUES
('Ali', 'Yılmaz', '123456', 'Bilgisayar Mühendisliği'),
('Ayşe', 'Kara', '654321', 'Elektrik Mühendisliği');

INSERT INTO Dersler (DersAdi, DersKodu) VALUES
('Veritabanı Yönetimi', 'CS101'),
('Algoritmalar', 'CS102');

INSERT INTO Notlar (OgrenciID, DersID, Notu) VALUES
(1, 1, 85.50),
(1, 2, 90.00),
(2, 1, 78.00);

INSERT INTO Ogrenciler (Ad, Soyad, OgrenciNumarasi, Bolum) VALUES ('Mehmet', 'Öztürk', '789012', 'Makine Mühendisliği');

UPDATE Ogrenciler SET Bolum = 'Yazılım Mühendisliği' WHERE OgrenciNumarasi = '123456';

DELETE FROM Ogrenciler WHERE OgrenciNumarasi = '654321';

SELECT O.Ad, O.Soyad, D.DersAdi, N.Notu
FROM Ogrenciler O
JOIN Notlar N ON O.OgrenciID = N.OgrenciID
JOIN Dersler D ON N.DersID = D.DersID
WHERE O.OgrenciNumarasi = '123456';
