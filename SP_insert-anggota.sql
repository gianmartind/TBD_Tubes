DROP PROCEDURE IF EXISTS insertAnggota
GO

CREATE PROCEDURE insertAnggota
	@anggota varchar(50), --tabel yang dituju
	@nik varchar(50),   
	@nama varchar(50), 
	@email varchar(50),
	@noHP varchar(50),
	@tanggalLahir date,
	@alamat varchar(50), --nama alamat baru
	@kota varchar(50) --nama kota tempat alamat
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

	IF(@anggota = 'Pimpinan')
	BEGIN
		INSERT INTO TB_Pimpinan (nik, nama, email, noHP, tanggalLahir, fk_idAlamat)
		VALUES (@nik, @nama, @email, @noHP, @tanggalLahir, @idAlamatTemp)
	END
	ELSE IF(@anggota = 'Admin')
	BEGIN
		INSERT INTO TB_Admin (nik, nama, email, noHP, tanggalLahir, fk_idAlamat)
		VALUES (@nik, @nama, @email, @noHP, @tanggalLahir, @idAlamatTemp)
	END
	ELSE IF(@anggota = 'Petugas')
	BEGIN
		INSERT INTO TB_Petugas (nik, nama, email, noHP, tanggalLahir, fk_idAlamat)
		VALUES (@nik, @nama, @email, @noHP, @tanggalLahir, @idAlamatTemp)
	END
	
GO

EXEC insertAnggota 'Petugas', '0001', 'Nama Petugas 3', 'email.pentugas3@gmail.com', '089415226984', '2000/04/01', 'Jl. Alamat 4', 'Kabupaten Bandung'

