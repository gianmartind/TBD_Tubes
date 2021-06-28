DROP PROCEDURE IF EXISTS dataKesehatan
GO

CREATE PROCEDURE dataKesehatan
	@suhuTubuh float,
	@tekananDarah varchar(50),
	@tahap int,
	@tanggalWaktu datetime,
	@nik varchar(50),
	@idPetugas int,
	@idFaskes int
AS
	DECLARE @status varchar(50) = 'PASS' --status awal

	IF(@tanggalWaktu IS NULL) --jika @tanggalWaktu null, maka gunakan tanggal waktu saat ini
	BEGIN
		SET @tanggalWaktu = getdate()
	END

	--cek suhu tubuh
	IF(@suhuTubuh > 37.5) --jika lebih dari 37.5 maka status menjadi 'FAIL'
	BEGIN
		SET @status = 'FAIL'
	END

	set @tekananDarah = replace(@tekananDarah, '/', '.'); --ubah '/' pada tekanan darah menjadi '.' untuk dapat digunakan `parsename`
	DECLARE @sistolik int = parsename(@tekananDarah, 2) --masukkan angka pertama ke variabel @sistolik
	DECLARE @diastolik int = parsename(@tekananDarah, 1) --masukkan angka kedua ke variabel @diastolik

	--cek tekanan darah
	IF((@sistolik > 139 OR @sistolik < 90) --cek apakah angka sistolik di luar batas normal
		AND (@diastolik > 89 OR @diastolik <60)) --cek apakah angka diastolik di luar batas normal
	BEGIN
		SET @status = 'FAIL' --ubah status menjadi 'FAIL' 
	END

	INSERT INTO TB_DataKesehatan (suhuTubuh, tekananDarah, tahap, status, tanggalWaktu, fk_nik, fk_idPetugas, fk_idFaskes)
	VALUES (@suhuTubuh, @tekananDarah, @tahap, @status, @tanggalWaktu, @nik, @idPetugas, @idFaskes)
GO


