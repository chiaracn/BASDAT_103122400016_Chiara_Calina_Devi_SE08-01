BEGIN EXECUTE IMMEDIATE 'DROP TABLE transaksi CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE inventaris CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE jadwal CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE member CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE theater CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE film CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

-- =========================
-- 1) DDL - CREATE TABLE
-- =========================

CREATE TABLE film (
  id_film   CHAR(4) PRIMARY KEY,
  judul     VARCHAR2(100) NOT NULL,
  sinopsis  VARCHAR2(255),
  tahun     NUMBER(4),
  durasi    NUMBER(4)
);

CREATE TABLE theater (
  id_theater CHAR(4) PRIMARY KEY,
  harga      NUMBER(10) NOT NULL,
  kapasitas  NUMBER(10) NOT NULL,
  kelas      VARCHAR2(20) NOT NULL
);

CREATE TABLE member (
  id_member CHAR(4) PRIMARY KEY,
  nama      VARCHAR2(100) NOT NULL,
  no_hp     VARCHAR2(20),
  tgl_lahir DATE,
  email     VARCHAR2(100)
);

CREATE TABLE jadwal (
  id_jadwal     CHAR(4) PRIMARY KEY,
  id_film       CHAR(4) NOT NULL,
  id_theater    CHAR(4) NOT NULL,
  periode_start DATE NOT NULL,
  periode_end   DATE NOT NULL,
  CONSTRAINT fk_jadwal_film
    FOREIGN KEY (id_film) REFERENCES film(id_film),
  CONSTRAINT fk_jadwal_theater
    FOREIGN KEY (id_theater) REFERENCES theater(id_theater),
  CONSTRAINT ck_periode
    CHECK (periode_end >= periode_start)
);

CREATE TABLE inventaris (
  id_inventaris CHAR(4) PRIMARY KEY,
  id_theater    CHAR(4) NOT NULL,
  nomor_kursi   NUMBER(5) NOT NULL,
  CONSTRAINT fk_inventaris_theater
    FOREIGN KEY (id_theater) REFERENCES theater(id_theater)
);

CREATE TABLE transaksi (
  kode_pemesanan CHAR(5) PRIMARY KEY,
  id_jadwal      CHAR(4) NOT NULL,
  id_member      CHAR(4) NOT NULL,
  status         VARCHAR2(20) NOT NULL,
  tanggal        DATE NOT NULL,
  total_harga    NUMBER(12) NOT NULL,
  CONSTRAINT fk_transaksi_jadwal
    FOREIGN KEY (id_jadwal) REFERENCES jadwal(id_jadwal),
  CONSTRAINT fk_transaksi_member
    FOREIGN KEY (id_member) REFERENCES member(id_member)
);

-- =========================
-- 2) DML - INSERT DATA (unik & lebih banyak)
-- =========================

-- FILM (8 data)
INSERT INTO film VALUES ('F101','Interstellar','Misi penyelamatan umat manusia ke luar angkasa',2014,169);
INSERT INTO film VALUES ('F102','The Batman','Detektif Gotham menghadapi jaringan korupsi',2022,176);
INSERT INTO film VALUES ('F103','Parasite','Ketimpangan sosial dalam keluarga dua kelas',2019,132);
INSERT INTO film VALUES ('F104','Top Gun: Maverick','Aksi pilot tempur dan misi berisiko tinggi',2022,130);
INSERT INTO film VALUES ('F105','Coco','Petualangan musik di dunia arwah',2017,105);
INSERT INTO film VALUES ('F106','Dune','Perang dan politik di planet gurun',2021,155);
INSERT INTO film VALUES ('F107','1917','Misi penyampaian pesan di garis perang',2019,119);
INSERT INTO film VALUES ('F108','Knives Out','Kasus misteri keluarga dan pembunuhan',2020,130);

-- THEATER (4 data)
INSERT INTO theater VALUES ('T201',55000,120,'VIP');
INSERT INTO theater VALUES ('T202',45000,100,'REGULER');
INSERT INTO theater VALUES ('T203',65000,80,'PREMIUM');
INSERT INTO theater VALUES ('T204',30000,70,'EKONOMI');

-- MEMBER (8 data)
INSERT INTO member VALUES ('M301','Rizky Aditya Pratama','081234000111',DATE '2001-03-10','rizky.pratama@mail.com');
INSERT INTO member VALUES ('M302','Nadia Putri','081298777666',DATE '2000-07-21','nadia.putri@mail.com');
INSERT INTO member VALUES ('M303','Dimas Saputra','082211334455',DATE '1999-01-15','dimas.saputra@mail.com');
INSERT INTO member VALUES ('M304','Salsa Maharani','081355889900',DATE '2002-11-05','salsa.m@mail.com');
INSERT INTO member VALUES ('M305','Fajar Nugraha','082199887766',DATE '1998-09-17','fajar.n@mail.com');
INSERT INTO member VALUES ('M306','Alya Nurfadila','085210001122',DATE '2001-12-02','alya.n@mail.com');
INSERT INTO member VALUES ('M307','Bagas Ramadhan','081377700088',DATE '1997-04-19','bagas.r@mail.com');
INSERT INTO member VALUES ('M308','Keisha Amalia','082155566677',DATE '2003-08-30','keisha.a@mail.com');

-- JADWAL (8 data)
INSERT INTO jadwal VALUES ('J401','F101','T201',DATE '2024-06-01',DATE '2024-06-07');
INSERT INTO jadwal VALUES ('J402','F102','T202',DATE '2024-06-02',DATE '2024-06-08');
INSERT INTO jadwal VALUES ('J403','F103','T203',DATE '2024-06-03',DATE '2024-06-09');
INSERT INTO jadwal VALUES ('J404','F104','T201',DATE '2024-06-04',DATE '2024-06-10');
INSERT INTO jadwal VALUES ('J405','F105','T204',DATE '2024-06-05',DATE '2024-06-11');
INSERT INTO jadwal VALUES ('J406','F106','T202',DATE '2024-06-06',DATE '2024-06-12');
INSERT INTO jadwal VALUES ('J407','F107','T203',DATE '2024-06-07',DATE '2024-06-13');
INSERT INTO jadwal VALUES ('J408','F108','T201',DATE '2024-06-08',DATE '2024-06-14');

-- INVENTARIS (12 data)
INSERT INTO inventaris VALUES ('I501','T201',1);
INSERT INTO inventaris VALUES ('I502','T201',2);
INSERT INTO inventaris VALUES ('I503','T201',3);
INSERT INTO inventaris VALUES ('I504','T202',5);
INSERT INTO inventaris VALUES ('I505','T202',6);
INSERT INTO inventaris VALUES ('I506','T202',7);
INSERT INTO inventaris VALUES ('I507','T203',10);
INSERT INTO inventaris VALUES ('I508','T203',11);
INSERT INTO inventaris VALUES ('I509','T203',12);
INSERT INTO inventaris VALUES ('I510','T204',15);
INSERT INTO inventaris VALUES ('I511','T204',16);
INSERT INTO inventaris VALUES ('I512','T204',17);

-- TRANSAKSI (10 data)
INSERT INTO transaksi VALUES ('TR601','J401','M301','LUNAS',  DATE '2024-06-01',55000);
INSERT INTO transaksi VALUES ('TR602','J402','M302','LUNAS',  DATE '2024-06-02',45000);
INSERT INTO transaksi VALUES ('TR603','J403','M303','PENDING',DATE '2024-06-03',65000);
INSERT INTO transaksi VALUES ('TR604','J404','M304','LUNAS',  DATE '2024-06-04',55000);
INSERT INTO transaksi VALUES ('TR605','J405','M305','LUNAS',  DATE '2024-06-05',30000);
INSERT INTO transaksi VALUES ('TR606','J406','M306','LUNAS',  DATE '2024-06-06',45000);
INSERT INTO transaksi VALUES ('TR607','J407','M307','BATAL',  DATE '2024-06-07',65000);
INSERT INTO transaksi VALUES ('TR608','J408','M308','LUNAS',  DATE '2024-06-08',55000);
INSERT INTO transaksi VALUES ('TR609','J402','M301','LUNAS',  DATE '2024-06-02',45000);
INSERT INTO transaksi VALUES ('TR610','J405','M302','PENDING',DATE '2024-06-05',30000);

COMMIT;

-- =========================
-- 3) UPDATE (minimal 5)
-- =========================
UPDATE film SET durasi = 172 WHERE id_film = 'F101';
UPDATE film SET tahun  = 2020 WHERE id_film = 'F108';
UPDATE theater SET harga = 70000 WHERE id_theater = 'T203';
UPDATE member SET nama = 'Rizky A. Pratama' WHERE id_member = 'M301';
UPDATE transaksi SET status = 'LUNAS' WHERE kode_pemesanan = 'TR603';
UPDATE inventaris SET nomor_kursi = 18 WHERE id_inventaris = 'I512';

COMMIT;

-- =========================
-- 4) DELETE (minimal 2)
-- =========================
DELETE FROM inventaris WHERE id_inventaris = 'I502';
DELETE FROM transaksi  WHERE kode_pemesanan = 'TR607';

COMMIT;

-- =========================
-- 5) OUTPUT (cek data / untuk screenshot)
-- =========================
SELECT * FROM film;
SELECT * FROM theater;
SELECT * FROM member;
SELECT * FROM jadwal;
SELECT * FROM inventaris;
SELECT * FROM transaksi;

-- BONUS (JOIN)
SELECT
  t.kode_pemesanan,
  m.nama AS nama_member,
  f.judul AS judul_film,
  th.kelas AS kelas_theater,
  t.status,
  t.tanggal,
  t.total_harga
FROM transaksi t
JOIN member  m  ON t.id_member = m.id_member
JOIN jadwal  j  ON t.id_jadwal = j.id_jadwal
JOIN film    f  ON j.id_film = f.id_film
JOIN theater th ON j.id_theater = th.id_theater
ORDER BY t.kode_pemesanan;