DROP PROCEDURE IF EXISTS insertPenduduk

CREATE PROCEDURE insertPenduduk
	@nik varchar(50),
	@nama varchar(50),
	@email varchar(50),
	@noHP varchar(50),
	@tanggalLahir date,
	@pekerjaan varchar(50),
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

	INSERT INTO TB_Penduduk
	VALUES (@nik, @nama, @email, @noHP, @tanggalLahir, @pekerjaan, @idAlamatTemp)

EXEC insertPenduduk '0006', 'Nama Penduduk 3', 'email.penduduk3@gmail.com', '089415226984', '2000/04/01', 'Menganggur', 'Jl. Alamat 4', 'Bandung'

