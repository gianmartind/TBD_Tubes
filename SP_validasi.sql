DROP PROCEDURE IF EXISTS validasi

CREATE PROCEDURE validasi
	@nik varchar(50),
	@idFaskes int
AS
	DECLARE @currentDate date

	SET @currentDate = convert(date, getdate())

	DECLARE @countEntry int = 0

	SELECT @countEntry = count(*)
	FROM TB_Pendaftaran
	WHERE fk_nik = @nik AND fk_idFaskes = @idFaskes AND convert(date, tanggalWaktu) = @currentDate

	IF(@countEntry > 0)
	BEGIN
		INSERT INTO TB_Validasi (tanggalWaktu, keterangan, fk_nik)
		VALUES (getdate(), 'VALID', @nik)

		SELECT 'VALID'
	END
	ELSE
	BEGIN
		INSERT INTO TB_Validasi (tanggalWaktu, keterangan, fk_nik)
		VALUES (getdate(), 'TIDAK VALID', @nik)

		SELECT 'TIDAK VALID'
	END

EXEC validasi '1', 2
	


