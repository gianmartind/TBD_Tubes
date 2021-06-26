DROP PROCEDURE IF EXISTS dataPendaftar

CREATE PROCEDURE dataPendaftar
	@input varchar(50) --input, kolom yang ingin ditampilkan
AS
	DECLARE @temp TABLE( --tabel untuk menyimpan hasil split @input
		kata varchar(50)
	)

	--split input berdasarkan ';', masukkan ke tabel @temp
	INSERT INTO @temp 
	SELECT kata
	FROM split_string(@input, ';')

	DECLARE @query nvarchar(400) --variabel query untuk menyimpan perintah query
	SET @query = 'SELECT '

	--buat cursor dari @temp
	DECLARE cursorTemp CURSOR
	FOR 
	SELECT kata
	FROM @temp

	OPEN cursorTemp

	DECLARE @temp2 varchar(50) --variabel untuk menyimpan hasil iterasi cursor `cursorTemp`

	--tambahkan hasil iterasi pertama cursor ke dalam @query, untuk mempermudah penggunaan ',' pada iterasi selanjutnya
	FETCH NEXT FROM cursorTemp INTO @temp2
	SET @query = concat(@query, @temp2) 

	--iterasi `cursorTemp`
	FETCH NEXT FROM cursorTemp INTO @temp2 
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @query = concat(@query, ',', @temp2) --tambahkan hasil iterasi ke @query, dengan tanda ',' di sebelumnya

		FETCH NEXT FROM cursorTemp INTO @temp2
	END

	CLOSE cursorTemp
	DEALLOCATE cursorTemp

	--tambahkan FROM ke @query, dari INNER JOIN tabel TB_Pendaftaran, TB_Penduduk, dan TB_idFaskes
	SET @query = concat(@query, ' FROM TB_Pendaftaran INNER JOIN TB_Penduduk ON TB_Pendaftaran.fk_nik = TB_Penduduk.nik INNER JOIN TB_Faskes ON TB_Pendaftaran.fk_idFaskes = TB_Faskes.idFaskes INNER JOIN TB_Alamat ON TB_Penduduk.fk_idAlamat = TB_Alamat.idAlamat')

	EXEC sp_executesql @query

EXEC dataPendaftar 'nama;namaFaskes;namaAlamat;nik'
