DROP PROCEDURE IF EXISTS cariVaksinasi

CREATE PROCEDURE cariVaksinasi
	@input varchar(MAX)
AS
	DECLARE @temp TABLE(
		kata varchar(50)
	)

	INSERT INTO @temp
	SELECT kata
	FROM split_string(@input, '&')

	DECLARE @querySELECT nvarchar(400)
	SET @querySELECT = 'SELECT idVaksinasi, tanggalWaktu, tahap, namaFaskes, nik, nama, email, noHP, tanggalLahir, pekerjaan '
	
	DECLARE @queryFROM nvarchar(400)
	SET @queryFROM = ' FROM TB_Vaksinasi INNER JOIN TB_Penduduk ON TB_Vaksinasi.fk_nik = TB_Penduduk.nik INNER JOIN TB_Faskes ON TB_Vaksinasi.fk_idFaskes = TB_Faskes.idFaskes'

	DECLARE @queryWHERE nvarchar(400)
	SET @queryWHERE = ' WHERE'

	DECLARE @query nvarchar(400)
	SET @query = ''

	DECLARE cursorInput CURSOR
	FOR 
	SELECT kata
	FROM @temp

	OPEN cursorInput

	DECLARE @temp_input varchar(50)
	DECLARE @col_name varchar(50)
	DECLARE @col_op varchar(50)
	DECLARE @col_value varchar(50)

	FETCH NEXT FROM cursorInput INTO @temp_input
	WHILE @@FETCH_STATUS = 0
	BEGIN
		DECLARE cursorSplit CURSOR
		FOR 
		SELECT value
		FROM string_split(@temp_input, '|')

		OPEN cursorSplit

		FETCH NEXT FROM cursorSplit INTO @col_name		
		FETCH NEXT FROM cursorSplit INTO @col_op
		FETCH NEXT FROM cursorSplit INTO @col_value
		CLOSE cursorSplit
		DEALLOCATE cursorSplit

		SELECT @col_name
		SELECT @col_op
		SELECT @col_value

		IF(@col_op = 'LIKE')
		BEGIN
			SET @queryWHERE = concat(@queryWHERE, ' ',@col_name, ' ', @col_op, ' ''%', @col_value, '%''', ' AND')
		END
		ELSE
		BEGIN
			SET @queryWHERE = concat(@queryWHERE, ' ',@col_name, ' ', @col_op, ' ''', @col_value, '''', ' AND')
		END

		FETCH NEXT FROM cursorInput INTO @temp_input
	END

	CLOSE cursorInput
	DEALLOCATE cursorInput

	SET @queryWHERE = concat(@queryWHERE, ' 1>0')

	SET @query = concat(@querySELECT, @queryFROM, @queryWHERE)

	EXEC sp_executesql @query


EXEC cariVaksinasi 'nama|LIKE|aa&nik|=|10000000'

SELECT idVaksinasi, tanggalWaktu, tahap, namaFaskes, nik, nama, email, noHP, tanggalLahir, pekerjaan  FROM TB_Vaksinasi INNER JOIN TB_Penduduk ON TB_Vaksinasi.fk_nik = TB_Penduduk.nik INNER JOIN TB_Faskes ON TB_Vaksinasi.fk_idFaskes = TB_Faskes.idFaskes WHERE namaLIKE'%aa%' AND 1>0

