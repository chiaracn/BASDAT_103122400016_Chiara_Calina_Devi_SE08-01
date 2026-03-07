-- =========================================
-- FILE : TP_MODUL3_SQL_MAHASISWA.sql
-- DESKRIPSI : Tugas Pendahuluan Modul 3
-- DB : Oracle SQL / LiveSQL
-- =========================================

-- HAPUS TABLE JIKA SUDAH ADA
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE mahasiswa';
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;
/
-- =========================================
-- 1. MEMBUAT TABLE MAHASISWA
-- =========================================
CREATE TABLE mahasiswa (
    id             VARCHAR2(10) PRIMARY KEY,
    nama           VARCHAR2(100) NOT NULL,
    tempat_lahir   VARCHAR2(50) NOT NULL,
    tanggal_lahir  DATE NOT NULL,
    nomor_hp       VARCHAR2(15) NOT NULL,
    email          VARCHAR2(100) NOT NULL,
    tinggi_badan   NUMBER(5,2) NOT NULL,
    berat_badan    NUMBER(5,2) NOT NULL
);

-- =========================================
-- 2. INSERT DATA 15 BARIS
-- =========================================
INSERT INTO mahasiswa VALUES ('M001', 'citra ayu lestari', 'Yogyakarta', TO_DATE('2004-01-12','YYYY-MM-DD'), '081234567801', 'citra.ayu@email.com', 158.5, 48.2);
INSERT INTO mahasiswa VALUES ('M002', 'dimas pratama', 'Sleman', TO_DATE('2003-03-25','YYYY-MM-DD'), '081234567802', 'dimas.pratama@email.com', 170.0, 62.5);
INSERT INTO mahasiswa VALUES ('M003', 'nabila putri ramadhani', 'Bantul', TO_DATE('2004-07-08','YYYY-MM-DD'), '081234567803', 'nabila.putri@email.com', 160.2, 50.7);
INSERT INTO mahasiswa VALUES ('M004', 'fajar nur hidayat', 'Klaten', TO_DATE('2002-11-19','YYYY-MM-DD'), '081234567804', 'fajar.hidayat@email.com', 172.4, 64.1);
INSERT INTO mahasiswa VALUES ('M005', 'rahma santi', 'Magelang', TO_DATE('2003-05-02','YYYY-MM-DD'), '081234567805', 'rahma.santi@email.com', 155.0, 47.0);
INSERT INTO mahasiswa VALUES ('M006', 'andika saputra', 'Solo', TO_DATE('2004-09-14','YYYY-MM-DD'), '081234567806', 'andika.saputra@email.com', 168.3, 59.4);
INSERT INTO mahasiswa VALUES ('M007', 'dewi anggraini', 'Semarang', TO_DATE('2003-12-30','YYYY-MM-DD'), '081234567807', 'dewi.anggraini@email.com', 157.8, 49.5);
INSERT INTO mahasiswa VALUES ('M008', 'bagus maulana', 'Purwokerto', TO_DATE('2002-06-11','YYYY-MM-DD'), '081234567808', 'bagus.maulana@email.com', 173.5, 66.0);
INSERT INTO mahasiswa VALUES ('M009', 'salsa oktaviani', 'Kebumen', TO_DATE('2004-02-27','YYYY-MM-DD'), '081234567809', 'salsa.oktaviani@email.com', 159.4, 51.2);
INSERT INTO mahasiswa VALUES ('M010', 'reza adityawan', 'Madiun', TO_DATE('2003-08-17','YYYY-MM-DD'), '081234567810', 'reza.adityawan@email.com', 171.2, 63.3);
INSERT INTO mahasiswa VALUES ('M011', 'intan permatasari', 'Ngawi', TO_DATE('2004-10-05','YYYY-MM-DD'), '081234567811', 'intan.permata@email.com', 156.7, 46.8);
INSERT INTO mahasiswa VALUES ('M012', 'galih wicaksono', 'Pacitan', TO_DATE('2002-04-21','YYYY-MM-DD'), '081234567812', 'galih.w@email.com', 174.1, 67.9);
INSERT INTO mahasiswa VALUES ('M013', 'amelia kusuma dewi', 'Wonogiri', TO_DATE('2003-01-09','YYYY-MM-DD'), '081234567813', 'amelia.kusuma@email.com', 161.5, 52.1);
INSERT INTO mahasiswa VALUES ('M014', 'rendy firmansyah', 'Salatiga', TO_DATE('2004-11-13','YYYY-MM-DD'), '081234567814', 'rendy.f@email.com', 169.6, 60.5);
INSERT INTO mahasiswa VALUES ('M015', 'tiara anindita', 'Temanggung', TO_DATE('2003-07-28','YYYY-MM-DD'), '081234567815', 'tiara.anindita@email.com', 158.9, 48.9);

COMMIT;

-- =========================================
-- MENAMPILKAN DATA AWAL
-- =========================================
SELECT * FROM mahasiswa;

-- =========================================
-- 3A. FUNGSI KARAKTER DAN STRING
-- LOWER, UPPER, INITCAP, CONCAT,
-- LENGTH, SUBSTR, LPAD/RPAD, LTRIM, RTRIM,
-- INSTR, REPLACE
-- =========================================

-- LOWER
SELECT id, nama, LOWER(nama) AS nama_lower
FROM mahasiswa;

-- UPPER
SELECT id, nama, UPPER(nama) AS nama_upper
FROM mahasiswa;

-- INITCAP
SELECT id, nama, INITCAP(nama) AS nama_initcap
FROM mahasiswa;

-- CONCAT
SELECT id, CONCAT(nama, ' - mahasiswa aktif') AS hasil_concat
FROM mahasiswa;

-- LENGTH
SELECT id, nama, LENGTH(nama) AS panjang_nama
FROM mahasiswa;

-- SUBSTR
SELECT id, nama, SUBSTR(nama, 1, 5) AS potong_nama
FROM mahasiswa;

-- LPAD
SELECT id, nama, LPAD(id, 8, '0') AS id_lpad
FROM mahasiswa;

-- RPAD
SELECT id, nama, RPAD(id, 8, '*') AS id_rpad
FROM mahasiswa;

-- LTRIM
SELECT LTRIM('     SQL ORACLE') AS hasil_ltrim
FROM dual;

-- RTRIM
SELECT RTRIM('ORACLE SQL     ') AS hasil_rtrim
FROM dual;

-- INSTR
SELECT id, nama, INSTR(nama, 'a') AS posisi_huruf_a
FROM mahasiswa;

-- REPLACE
SELECT id, nama, REPLACE(nama, 'a', '@') AS nama_replace
FROM mahasiswa;

-- =========================================
-- 3B. FUNGSI TANGGAL DAN WAKTU
-- MM/MON/MONTH, DD/DY, YYYY/YY/RR,
-- AM(or PM)/HH/HH24, MI/SS,
-- ADD_MONTHS(d,n), SYSDATE,
-- LAST_DAY(d), NEXT_DAY(d,day_name),
-- MONTHS_BETWEEN(d1,d2),
-- ROUND(d,[MONTH|YEAR])
-- =========================================

-- Format tanggal: MM, MON, MONTH, DD, DY, YYYY, YY, RR
SELECT
    id,
    nama,
    tanggal_lahir,
    TO_CHAR(tanggal_lahir, 'MM')    AS bulan_angka,
    TO_CHAR(tanggal_lahir, 'MON')   AS bulan_singkat,
    TO_CHAR(tanggal_lahir, 'MONTH') AS bulan_panjang,
    TO_CHAR(tanggal_lahir, 'DD')    AS hari_angka,
    TO_CHAR(tanggal_lahir, 'DY')    AS hari_singkat,
    TO_CHAR(tanggal_lahir, 'YYYY')  AS tahun_yyyy,
    TO_CHAR(tanggal_lahir, 'YY')    AS tahun_yy,
    TO_CHAR(tanggal_lahir, 'RR')    AS tahun_rr
FROM mahasiswa;

-- Format waktu AM/PM, HH, HH24, MI, SS dari SYSDATE
SELECT
    SYSDATE AS waktu_sekarang,
    TO_CHAR(SYSDATE, 'DD-MON-YYYY HH:MI:SS AM') AS format_am_pm,
    TO_CHAR(SYSDATE, 'HH')   AS jam_12,
    TO_CHAR(SYSDATE, 'HH24') AS jam_24,
    TO_CHAR(SYSDATE, 'MI')   AS menit,
    TO_CHAR(SYSDATE, 'SS')   AS detik
FROM dual;

-- ADD_MONTHS
SELECT
    id,
    nama,
    tanggal_lahir,
    ADD_MONTHS(tanggal_lahir, 6) AS tambah_6_bulan
FROM mahasiswa;

-- SYSDATE
SELECT SYSDATE AS tanggal_hari_ini
FROM dual;

-- LAST_DAY
SELECT
    id,
    nama,
    tanggal_lahir,
    LAST_DAY(tanggal_lahir) AS akhir_bulan_lahir
FROM mahasiswa;

-- NEXT_DAY
SELECT
    id,
    nama,
    tanggal_lahir,
    NEXT_DAY(tanggal_lahir, 'MONDAY') AS senin_berikutnya
FROM mahasiswa;

-- MONTHS_BETWEEN
SELECT
    id,
    nama,
    ROUND(MONTHS_BETWEEN(SYSDATE, tanggal_lahir), 2) AS selisih_bulan
FROM mahasiswa;

-- ROUND tanggal ke bulan
SELECT
    id,
    nama,
    tanggal_lahir,
    ROUND(tanggal_lahir, 'MONTH') AS round_bulan
FROM mahasiswa;

-- ROUND tanggal ke tahun
SELECT
    id,
    nama,
    tanggal_lahir,
    ROUND(tanggal_lahir, 'YEAR') AS round_tahun
FROM mahasiswa;

-- =========================================
-- 3C. FUNGSI KONVERSI
-- TO_NUMBER(char), TO_CHAR(date), TO_CHAR(number), TO_DATE(char)
-- =========================================

-- TO_NUMBER(char)
SELECT TO_NUMBER('2025') + 25 AS hasil_to_number
FROM dual;

-- TO_CHAR(date)
SELECT
    id,
    nama,
    TO_CHAR(tanggal_lahir, 'DD MONTH YYYY') AS tanggal_lahir_text
FROM mahasiswa;

-- TO_CHAR(number)
SELECT
    id,
    nama,
    TO_CHAR(tinggi_badan, '999.99') AS tinggi_text,
    TO_CHAR(berat_badan, '999.99') AS berat_text
FROM mahasiswa;

-- TO_DATE(char)
SELECT
    TO_DATE('17-08-2025', 'DD-MM-YYYY') AS hasil_to_date
FROM dual;

-- =========================================
-- 3D. FUNGSI NUMERIK
-- ABS(n), MOD(m,n), FLOOR(n), POWER(m,n), ROUND(n[,m]), CEIL(n)
-- =========================================

-- ABS
SELECT ABS(-15) AS hasil_abs
FROM dual;

-- MOD
SELECT MOD(17, 5) AS hasil_mod
FROM dual;

-- FLOOR
SELECT FLOOR(12.98) AS hasil_floor
FROM dual;

-- POWER
SELECT POWER(3, 4) AS hasil_power
FROM dual;

-- ROUND
SELECT ROUND(123.4567, 2) AS hasil_round
FROM dual;

-- CEIL
SELECT CEIL(12.01) AS hasil_ceil
FROM dual;

-- CONTOH NUMERIK DARI DATA MAHASISWA
SELECT
    id,
    nama,
    tinggi_badan,
    berat_badan,
    ROUND(berat_badan / POWER((tinggi_badan / 100), 2), 2) AS bmi
FROM mahasiswa;

-- =========================================
-- UPDATE / PERUBAHAN DATA (UNTUK SCREENSHOT HASIL PERUBAHAN TABLE)
-- =========================================
UPDATE mahasiswa
SET email = 'citra.lestari@kampus.ac.id'
WHERE id = 'M001';

UPDATE mahasiswa
SET nomor_hp = '089900112233'
WHERE id = 'M005';

COMMIT;

-- TAMPILKAN HASIL SETELAH PERUBAHAN
SELECT * FROM mahasiswa;

-- =========================================
-- SELESAI
-- =========================================