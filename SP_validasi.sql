DROP PROCEDURE IF EXISTS validasi

CREATE PROCEDURE validasi
	@nik varchar(50), --nik pendaftar
	@idFaskes int --id faskes
AS
	DECLARE @currentDate date --ambil tanggal saat ini

	SET @currentDate = convert(date, getdate()) --convert menjadi format date

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

EXEC validasi '1', 2
	


