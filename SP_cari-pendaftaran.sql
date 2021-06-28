DROP PROCEDURE IF EXISTS cariPendaftaran
GO

CREATE PROCEDURE cariPendaftaran
	@input varchar(MAX) --input kolom yang akan di-filter
AS
	DECLARE @temp TABLE(
		kata varchar(50)
	)

	--split input berdasarkan '&' menjadi bentuk tabel
	INSERT INTO @temp
	SELECT kata
	FROM split_string(@input, '&')

	--string query untuk bagian SELECT
	DECLARE @querySELECT nvarchar(400)
	SET @querySELECT = 'SELECT idPendaftaran, tanggalWaktu, nik, nama, namaFaskes '
	
	--string query untuk bagian FROM, hasil INNER JOIN TB_Pendafataran, TB_Penduduk, dan TB_Faskes
	DECLARE @queryFROM nvarchar(400)
	SET @queryFROM = ' FROM TB_Pendaftaran INNER JOIN TB_Penduduk ON TB_Pendaftaran.fk_nik = TB_Penduduk.nik INNER JOIN TB_Faskes ON TB_Pendaftaran.fk_idFaskes = TB_Faskes.idFaskes'

	--string query untuk bagian WHERE
	DECLARE @queryWHERE nvarchar(400)
	SET @queryWHERE = ' WHERE'

	--string query keseluruhan
	DECLARE @query nvarchar(400)
	SET @query = ''

	--buat cursor dari hasil split
	DECLARE cursorInput CURSOR
	FOR 
	SELECT kata
	FROM @temp

	OPEN cursorInput

	DECLARE @temp_input varchar(50) --untuk menyimpan hasil iterasi dari `cursorInput`
	DECLARE @col_name varchar(50) 
	DECLARE @col_op varchar(50)
	DECLARE @col_value varchar(50)

	FETCH NEXT FROM cursorInput INTO @temp_input
	WHILE @@FETCH_STATUS = 0
	BEGIN
		--untuk setiap baris dari `cursorSplit`, split berdasarkan '|' menjadi nama kolom, operand, dan nilai
		DECLARE cursorSplit CURSOR
		FOR 
		SELECT value
		FROM string_split(@temp_input, '|')

		OPEN cursorSplit

		--kolom yang akan di-filter
		FETCH NEXT FROM cursorSplit INTO @col_name --baris pertama `cursorSplit` berisi nama kolom	
		FETCH NEXT FROM cursorSplit INTO @col_op --baris kedua berisi operand
		FETCH NEXT FROM cursorSplit INTO @col_value --baris ketiga berisi nilai
		CLOSE cursorSplit
		DEALLOCATE cursorSplit

		--masukkan hasil dari `cursorSplit` ke dalam @queryWHERE 
		IF(@col_op = 'LIKE') --jika operand merupakan `LIKE`
		BEGIN
			SET @queryWHERE = concat(@queryWHERE, ' ',@col_name, ' ', @col_op, ' ''%', @col_value, '%''', ' AND') --tambahkan '%' sebelum nilai
		END
		ELSE --jika bukan merupakan `LIKE`
		BEGIN
			SET @queryWHERE = concat(@queryWHERE, ' ',@col_name, ' ', @col_op, ' ''', @col_value, '''', ' AND')
		END

		FETCH NEXT FROM cursorInput INTO @temp_input
	END

	CLOSE cursorInput
	DEALLOCATE cursorInput

	SET @queryWHERE = concat(@queryWHERE, ' 1>0') --untuk melengkapi syntax

	SET @query = concat(@querySELECT, @queryFROM, @queryWHERE) --gabungkan ketiga query (SELECT, FROM, WHERE)

	EXEC sp_executesql @query
GO

EXEC cariPendaftaran 'namaFaskes|LIKE|aa'

