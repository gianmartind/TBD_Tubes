DROP PROCEDURE IF EXISTS insertFaskes
GO
--cara kerja sama dengan `insertPenduduk`, hanya berbeda parameter
CREATE PROCEDURE insertFaskes
	@nama varchar(50),
	@kapasitas int,
	@alamat varchar(50),
	@kota varchar(50)
AS
	DECLARE @idKotaTemp int=0
	DECLARE @idAlamatTemp int=0

	SELECT @idKotaTemp = idKota
	FROM TB_Kota
	WHERE namaKota = @kota

	INSERT INTO TB_Alamat (namaAlamat, fk_idKota) VALUES (@alamat, @idKotaTemp)
	SELECT @idAlamatTemp = idAlamatFaskes
	FROM TB_AlamatFaskes
	WHERE idAlamatFaskes = @@IDENTITY

	INSERT INTO TB_Faskes (namaFaskes, kapasitas, fk_idAlamatFaskes)
	VALUES (@nama, @kapasitas, @idAlamatTemp)
GO

EXEC insertFaskes 'RS Bandung', 50, 'Jl. Contoh 2', 'Bandung'