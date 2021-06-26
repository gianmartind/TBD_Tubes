DROP PROCEDURE IF EXISTS dataPendaftar

CREATE PROCEDURE dataPendaftar
	@input varchar(50)
AS
	DECLARE @temp TABLE(
		kata varchar(50)
	)

	INSERT INTO @temp
	SELECT kata
	FROM split_string(@input, ';')

	DECLARE @query nvarchar(400)
	SET @query = 'SELECT '

	DECLARE cursorTemp CURSOR
	FOR 
	SELECT kata
	FROM @temp

	OPEN cursorTemp

	DECLARE @temp2 varchar(50)

	FETCH NEXT FROM cursorTemp INTO @temp2
	SET @query = concat(@query, @temp2)

	FETCH NEXT FROM cursorTemp INTO @temp2
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @query = concat(@query, ',', @temp2)

		FETCH NEXT FROM cursorTemp INTO @temp2
	END

	CLOSE cursorTemp
	DEALLOCATE cursorTemp

	SET @query = concat(@query, ' FROM TB_Pendaftaran INNER JOIN TB_Penduduk ON TB_Pendaftaran.fk_nik = TB_Penduduk.nik INNER JOIN TB_Faskes ON TB_Pendaftaran.fk_idFaskes = TB_Faskes.idFaskes INNER JOIN TB_Alamat ON TB_Penduduk.fk_idAlamat = TB_Alamat.idAlamat')

	EXEC sp_executesql @query

EXEC dataPendaftar 'nama;namaFaskes;namaAlamat;nik'
