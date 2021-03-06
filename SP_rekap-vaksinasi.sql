DROP PROCEDURE IF EXISTS rekapVaksinasi
GO

CREATE PROCEDURE rekapVaksinasi
	@groupby varchar(MAX), --kolom untuk groupby
	@tanggalAwal date, --batas bawah tanggal
	@tanggalAkhir date --batas atas tanggal
AS
	DECLARE @query nvarchar(MAX)

	DECLARE
		--query untuk select, tampilkan kolom yang di groupby dan jumlah per kelompok
		@querySELECT varchar(50) = concat('SELECT ', @groupby, ',count(*) as Jumlah '),
		--inner join tabel TB_Vaksinasi, TB_Penduduk, dan TB_Faskes
		@queryFROM varchar(MAX) = 'FROM TB_Vaksinasi INNER JOIN TB_Penduduk ON TB_Vaksinasi.fk_nik = TB_Penduduk.nik INNER JOIN TB_Faskes ON TB_Vaksinasi.fk_idFaskes = TB_Faskes.idFaskes INNER JOIN TB_AlamatFaskes ON TB_Faskes.fk_idAlamatFaskes = TB_AlamatFaskes.idAlamatFaskes INNER JOIN TB_Kota ON TB_AlamatFaskes.fk_idKota = TB_Kota.idKota INNER JOIN TB_Provinsi ON TB_Kota.fk_idProvinsi = TB_Provinsi.idProvinsi ',
		--filter tanggal
		@queryWHERE varchar(MAX) = concat('WHERE tanggalWaktu >= ''', @tanggalAwal, ''' AND tanggalWaktu <= ''', @tanggalAkhir, ''' '),
		--group sesuai paramter
		@queryGROUPBY varchar(MAX) = concat('GROUP BY ', @groupby)

	--gabungkan ke empat query
	SET @query = concat(@querySELECT, @queryFROM, @queryWHERE, @queryGROUPBY)
	
	SELECT @query

	--jalankan query
	EXEC sp_executesql @query
GO


EXEC rekapVaksinasi 'namaProvinsi', '2021-01-01', '2022-01-01'
