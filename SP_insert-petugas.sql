DROP PROCEDURE IF EXISTS insertPetugas
--cara kerja sama dengan `insertPenduduk`, hanya berbeda parameter
CREATE PROCEDURE insertPetugas
	@nik varchar(50), 
	@nama varchar(50),
	@email varchar(50),
	@noHP varchar(50),
	@tanggalLahir date,
	@alamat varchar(50),
	@kota varchar(50)
AS
	DECLARE @idKotaTemp int=0
	DECLARE @idAlamatTemp int=0

	SELECT @idKotaTemp = idKota
	FROM TB_Kota
	WHERE namaKota = @kota

	INSERT INTO TB_Alamat (namaAlamat, fk_idKota) VALUES (@alamat, @idKotaTemp)
	SELECT @idAlamatTemp = idAlamat
	FROM TB_Alamat
	WHERE idAlamat = @@IDENTITY

	INSERT INTO TB_Petugas (nik, nama, email, noHP, tanggalLahir, fk_idAlamat)
	VALUES (@nik, @nama, @email, @noHP, @tanggalLahir, @idAlamatTemp)

EXEC insertPetugas '0001', 'Nama Petugas 3', 'email.pentugas3@gmail.com', '089415226984', '2000/04/01', 'Jl. Alamat 4', 'Bandung'

