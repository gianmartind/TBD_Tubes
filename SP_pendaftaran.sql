DROP PROCEDURE IF EXISTS pendaftaran
GO

CREATE PROCEDURE pendaftaran
	@nik varchar(50), --nik pendaftar
	@idFaskes int, --id Fasilitas kesehatan
	@hari int, --minimal berapa hari setelah mendaftar 
	@jumlah int, --jumlah jadwal (1 atau 2)
	@interval int --jarak antara jadwal 1 dan jadwal 2
AS
	DECLARE @kapasitas int=0 --untuk menyimpan kapasitas dari faskes yang dipilih

	SELECT @kapasitas = kapasitas --masukkan kapasitas faskes
	FROM TB_Faskes
	WHERE idFaskes = @idFaskes

	DECLARE @countDate int=0 --hitung jumlah pendaftaran aktif yang dimiliki oleh pendaftar
	SELECT @countDate = count(*)
	FROM TB_Pendaftaran
	WHERE fk_nik = @nik AND fk_idFaskes = @idFaskes AND tanggalWaktu >= getdate() --cek nik pendaftar, idFaskes, dan tanggal yang lebih dari tanggal saat ini 

	IF(@countDate > 0) --
	BEGIN
		SELECT 'Anda masih memiliki jadwal'
		RETURN
	END

	DECLARE @date date=convert(date, getdate()) --tanggal untuk diiterasi
	SET @date = dateadd(day, @hari, @date) --dimulai dari tanggal sekarang ditambah nilai dari paramater @hari

	DECLARE @countPendaftar int=0 --jumlah pendaftar pada pada tanggal @date

	DECLARE @datetime datetime --variabel untuk mengubah format `date` pada @date menjadi `datetime`

	WHILE(1>0)
	BEGIN
		SELECT @countPendaftar = count(*) --hitung jumlah pendaftar pada Faskes @idFaskes dan tanggal @date
		FROM TB_Pendaftaran INNER JOIN (SELECT * FROM TB_Faskes WHERE idFaskes = @idFaskes) as Faskes ON TB_Pendaftaran.fk_idFaskes = Faskes.idFaskes
		WHERE convert(date, TB_Pendaftaran.tanggalWaktu) = @date

		IF(@countPendaftar < @kapasitas) --jika masih terdapat slot 
		BEGIN
			SET @datetime = convert(datetime, (convert(varchar(50), @date) + ' 08:00:00')) --buat variabel datetime dari @date, dengan jam 08:00

			INSERT INTO TB_Pendaftaran (tanggalWaktu, tanggalDaftar, fk_nik, fk_idFaskes) --masukkan ke dalam tabel TB_Pendaftaran
			VALUES (@datetime, getdate(), @nik, @idFaskes)

			SELECT 'Tanggal Vaksinasi (1) - ' + convert(varchar(50), @datetime)

			BREAK --keluar dari while
		END
		--jika pada tanggal @date, kapasitas sudah penuh
		SET @date = dateadd(day, 1, @date) --tambah satu hari ke variabel @date
	END

	IF(@jumlah = 2) --jika diinginkan 2 tanggal 
	BEGIN
		SET @date = dateadd(day, @interval, @date) --tambah hari di variabel @date dengan @interval
		WHILE(1>0) --lakukan iterasi yang sama seperti di atas
		BEGIN
			SELECT @countPendaftar = count(*)
			FROM TB_Pendaftaran INNER JOIN (SELECT * FROM TB_Faskes WHERE idFaskes = @idFaskes) as Faskes ON TB_Pendaftaran.fk_idFaskes = Faskes.idFaskes
			WHERE convert(date, TB_Pendaftaran.tanggalWaktu) = @date

			IF(@countPendaftar < @kapasitas)
			BEGIN
				SET @datetime = convert(datetime, (convert(varchar(50), @date) + ' 08:00:00'))

				INSERT INTO TB_Pendaftaran (tanggalWaktu, tanggalDaftar, fk_nik, fk_idFaskes)
				VALUES (@datetime, getdate(), @nik, @idFaskes)

				SELECT 'Tanggal Vaksinasi (2) - ' + convert(varchar(50), @datetime)

				BREAK
			END

			SET @date = dateadd(day, 1, @date)
		END
	END
GO

EXEC pendaftaran '0006', 2, 7, 2, 14

