DROP PROCEDURE IF EXISTS pendaftaran

CREATE PROCEDURE pendaftaran
	@nik varchar(50), --nik pendaftar
	@idFaskes int, --id Fasilitas kesehatan
	@hari int, --minimal berapa hari setelah mendaftar 
	@jumlah int, --jumlah jadwal (1 atau 2)
	@interval int --jarak antara jadwal 1 dan jadwal 2
AS
	DECLARE @kapasitas int=0

	SELECT @kapasitas = kapasitas
	FROM TB_Faskes
	WHERE idFaskes = @idFaskes

	DECLARE @countDate int=0
	SELECT @countDate = count(*)
	FROM TB_Pendaftaran
	WHERE fk_nik = @nik AND tanggalWaktu >= getdate() 

	IF(@countDate > 0)
	BEGIN
		SELECT 'Anda masih memiliki jadwal'
		RETURN
	END

	DECLARE @date date=convert(date, getdate())
	SET @date = dateadd(day, @hari, @date)

	DECLARE @countPendaftar int=0

	DECLARE @datetime datetime='2021/06/22 22:38:14'

	WHILE(1>0)
	BEGIN
		SELECT @countPendaftar = count(*)
		FROM TB_Pendaftaran INNER JOIN (SELECT * FROM TB_Faskes WHERE idFaskes = @idFaskes) as Faskes ON TB_Pendaftaran.fk_idFaskes = Faskes.idFaskes
		WHERE convert(date, TB_Pendaftaran.tanggalWaktu) = @date

		IF(@countPendaftar < @kapasitas)
		BEGIN
			SET @datetime = convert(datetime, (convert(varchar(50), @date) + ' 08:00:00'))

			INSERT INTO TB_Pendaftaran (tanggalWaktu, fk_nik, fk_idFaskes)
			VALUES (@datetime, @nik, @idFaskes)

			SELECT 'Tanggal Vaksinasi (1) - ' + convert(varchar(50), @datetime)

			BREAK
		END

		SET @date = dateadd(day, 1, @date)
	END

	IF(@jumlah = 2)
	BEGIN
		SET @date = dateadd(day, @interval, @date)
		WHILE(1>0)
		BEGIN
			SELECT @countPendaftar = count(*)
			FROM TB_Pendaftaran INNER JOIN (SELECT * FROM TB_Faskes WHERE idFaskes = @idFaskes) as Faskes ON TB_Pendaftaran.fk_idFaskes = Faskes.idFaskes
			WHERE convert(date, TB_Pendaftaran.tanggalWaktu) = @date

			IF(@countPendaftar < @kapasitas)
			BEGIN
				SET @datetime = convert(datetime, (convert(varchar(50), @date) + ' 08:00:00'))

				INSERT INTO TB_Pendaftaran (tanggalWaktu, fk_nik, fk_idFaskes)
				VALUES (@datetime, @nik, @idFaskes)

				SELECT 'Tanggal Vaksinasi (2) - ' + convert(varchar(50), @datetime)

				BREAK
			END

			SET @date = dateadd(day, 1, @date)
		END
	END
	
EXEC pendaftaran '0006', 2, 7, 2, 14

