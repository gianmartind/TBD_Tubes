DROP PROCEDURE IF EXISTS vaksinasi
GO

CREATE PROCEDURE vaksinasi
	@tanggalWaktu datetime, --tanggal waktu vaksinasi
	@tahap int, --tahap (1 atau 2)
	@nik varchar(50), --nik penduduk
	@idFaskes int --id Faskes
AS
	IF(@tanggalWaktu IS NULL) --jika @tanggalWaktu null, maka gunakan tanggal waktu saat ini
	BEGIN
		SET @tanggalWaktu = getdate()
	END

	--masukkan parameter ke tabel TB_Vaksinasi
	INSERT INTO TB_Vaksinasi(tanggalWaktu, tahap, fk_nik, fk_idFaskes)
	VALUES (@tanggalWaktu, @tahap, @nik, @idFaskes)
GO