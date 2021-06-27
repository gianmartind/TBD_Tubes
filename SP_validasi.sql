DROP PROCEDURE IF EXISTS validasi
GO

CREATE PROCEDURE validasi
	@tanggalWaktu datetime,
	@nik varchar(50), --nik pendaftar
	@idFaskes int --id faskes
AS
	DECLARE @currentDate date --ambil tanggal saat ini

	IF(@tanggalWaktu IS NULL)
	BEGIN
		SET @currentDate = convert(date, getdate()) --convert menjadi format date
	END
	ELSE
	BEGIN
		SET @currentDate = @tanggalWaktu
	END

	DECLARE @countEntry int = 0

	SELECT @countEntry = count(*) --hitung jumlah pendaftaran oleh pada tanggal saat ini
	FROM TB_Pendaftaran
	WHERE fk_nik = @nik AND fk_idFaskes = @idFaskes AND convert(date, tanggalWaktu) = @currentDate

	IF(@countEntry > 0) --jika jumlah lebih dari 0
	BEGIN
		--penduduk telah mendaftar, insert ke dalam tabel TB_Validasi dengan keterangan 'VALID'
		INSERT INTO TB_Validasi (tanggalWaktu, keterangan, fk_nik, fk_idFaskes)
		VALUES (getdate(), 'VALID', @nik, @idFaskes)

		SELECT 'VALID'
	END
	ELSE --jika jumlah tidak lebih dari 0
	BEGIN
		--penduduk belum mendaftar, insert ke dalam tabel TB_Validasi dengan keterangan 'TIDAK VALID'
		INSERT INTO TB_Validasi (tanggalWaktu, keterangan, fk_nik, fk_idFaskes)
		VALUES (getdate(), 'TIDAK VALID', @nik, @idFaskes)

		SELECT 'TIDAK VALID'
	END
GO

EXEC validasi null, '10000000', 2
	


