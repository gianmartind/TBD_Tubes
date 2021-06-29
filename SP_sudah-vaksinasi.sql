DROP PROCEDURE IF EXISTS sudahVaksinasi
GO

CREATE PROCEDURE sudahVaksinasi
AS
	DECLARE @tahap1 table( --tabel untuk data vaksinasi tahap 1
		idVaksinasi int,
		tanggalWaktu datetime,
		tahap int,
		nik varchar(50),
		idFaskes int
	)

	DECLARE @tahap2 table( --tabel untuk data vaksinasi tahap 2
		idVaksinasi int,
		tanggalWaktu datetime,
		tahap int,
		nik varchar(50),
		idFaskes int
	)

	INSERT INTO @tahap1 --masukkan data dari TB_Vaksinasi dengan tahap = 1 ke @tahap1
	SELECT *
	FROM TB_Vaksinasi
	WHERE tahap = 1

	INSERT INTO @tahap2 --masukkan data dari TB_Vaksinasi dengan tahap = 2 ke @tahap2
	SELECT *
	FROM TB_Vaksinasi
	WHERE tahap = 2

	--join tabel @tahap1 dan @tahap2 berdasarkan nik, juga join dengan tabel TB_Penduduk untuk menampilkan nama penduduk
	SELECT t1.idVaksinasi as [id tahap 1], t2.idVaksinasi as [id tahap 2], t1.tanggalWaktu as [tanggal tahap 1], t2.tanggalWaktu as [tanggal tahap 2], TB_Penduduk.nik, TB_Penduduk.nama
	FROM @tahap1 as t1 INNER JOIN @tahap2 as t2 ON t1.nik = t2.nik INNER JOIN TB_Penduduk ON t1.nik = TB_Penduduk.nik
GO

EXEC sudahVaksinasi