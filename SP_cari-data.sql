DROP PROCEDURE IF EXISTS cariData

CREATE PROCEDURE cariData
	@input varchar(MAX)
AS
	DECLARE @temp TABLE(
		kata varchar(50)
	)

	DECLARE @temp2 TABLE(
		temp varchar(50)
	)

	INSERT INTO @temp
	SELECT kata
	FROM split_string(@input, '&')

	DECLARE @querySELECT nvarchar(400)
	SET @querySELECT = 'SELECT idPendaftaran, tanggalWaktu, nik, nama, namaFaskes '
	
	DECLARE @queryFROM nvarchar(400)
	SET @queryFROM = ' FROM TB_Pendaftaran INNER JOIN TB_Penduduk ON TB_Pendaftaran.fk_nik = TB_Penduduk.nik INNER JOIN TB_Faskes ON TB_Pendaftaran.fk_idFaskes = TB_Faskes.idFaskes'

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
		FROM string_split(@temp_input, ' ')

		OPEN cursorSplit

		FETCH NEXT FROM cursorSplit INTO @col_name		
		FETCH NEXT FROM cursorSplit INTO @col_op
		FETCH NEXT FROM cursorSplit INTO @col_value
		CLOSE cursorSplit
		DEALLOCATE cursorSplit

		INSERT INTO @temp2
		SELECT @col_name
		INSERT INTO @temp2
		SELECT @col_op
		INSERT INTO @temp2
		SELECT @col_value

		--SET @querySELECT = concat(@querySELECT, ' ', @col_name, ',')
		SET @queryWHERE = concat(@queryWHERE, ' ',@col_name, @col_op, '''', @col_value, '''', ' AND')

		FETCH NEXT FROM cursorInput INTO @temp_input
	END

	CLOSE cursorInput
	DEALLOCATE cursorInput

	--SET @querySELECT = LEFT(@querySELECT, len(@querySELECT) - 1)
	SET @queryWHERE = concat(@queryWHERE, ' 1>0')

	SET @query = concat(@querySELECT, @queryFROM, @queryWHERE)

	EXEC sp_executesql @query


EXEC cariData 'namaFaskes|=|RS Bandung&nik|=|&;tanggalWaktu|<|2021-06-25'

