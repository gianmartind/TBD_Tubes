DROP PROCEDURE IF EXISTS insertFaskes
GO
--cara kerja sama dengan `insertPenduduk`, hanya berbeda parameter
CREATE PROCEDURE insertFaskes
	@nama varchar(50), --nama faskes
	@kapasitas int, --kapasitas maksimal faskes
	@alamat varchar(50), --nama alamat
	@kota varchar(50) --nama kota
AS
	DECLARE @idKotaTemp int=0
	DECLARE @idAlamatTemp int=0

	SELECT @idKotaTemp = idKota --set @idKotaTemp dengan idKota dari kota dengan nama @kota
	FROM TB_Kota
	WHERE namaKota = @kota

	--buat alamat baru dengan nama @alamat, dan id kota @idKotaTemp
	INSERT INTO TB_Alamat (namaAlamat, fk_idKota) VALUES (@alamat, @idKotaTemp)
	SELECT @idAlamatTemp = idAlamatFaskes --ambil id dari alamat yang baru di-insert masukkan ke @idAlamatTemp
	FROM TB_AlamatFaskes
	WHERE idAlamatFaskes = @@IDENTITY

	INSERT INTO TB_Faskes (namaFaskes, kapasitas, fk_idAlamatFaskes) --insert ke tabel TB_Faskes
	VALUES (@nama, @kapasitas, @idAlamatTemp)
GO

EXEC insertFaskes 'RS Bandung', 50, 'Jl. Contoh 2', 'Bandung'