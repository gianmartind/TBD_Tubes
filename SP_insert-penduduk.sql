DROP PROCEDURE IF EXISTS insertPenduduk
GO

CREATE PROCEDURE insertPenduduk
	@nik varchar(50), --nik penduduk
	@nama varchar(50), --nama penduduk
	@email varchar(50), --email penduduk
	@noHP varchar(50), --noHP penduduk
	@tanggalLahir date, --tanggalLahir penduduk
	@pekerjaan varchar(50), --pekerjaan 
	@alamat varchar(50), --alamat penduduk
	@kota varchar(50) --nama kota
AS
	DECLARE @idKotaTemp int=0
	DECLARE @idAlamatTemp int=0

	SELECT @idKotaTemp = idKota --set @idKotaTemp dengan idKota dari kota dengan nama @kota
	FROM TB_Kota
	WHERE namaKota = @kota

	--buat alamat baru dengan nama @alamat, dan id kota @idKotaTemp
	INSERT INTO TB_Alamat (namaAlamat, fk_idKota) VALUES (@alamat, @idKotaTemp)
	SELECT @idAlamatTemp = idAlamat --ambil id dari alamat yang baru di-insert masukkan ke @idAlamatTemp
	FROM TB_Alamat
	WHERE idAlamat = @@IDENTITY 

	INSERT INTO TB_Penduduk --insert ke tabel TB_Penduduk
	VALUES (@nik, @nama, @email, @noHP, @tanggalLahir, @pekerjaan, @idAlamatTemp)
GO

EXEC insertPenduduk '0006', 'Nama Penduduk 3', 'email.penduduk3@gmail.com', '089415226984', '2000/04/01', 'Menganggur', 'Jl. Alamat 4', 'Bandung'

