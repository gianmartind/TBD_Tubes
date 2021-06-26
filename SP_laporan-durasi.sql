DROP PROCEDURE IF EXISTS laporanDurasi

CREATE PROCEDURE laporanDurasi
AS
	DECLARE @result table( --tabel untuk menyimpan hasil akhir
		nik varchar(50),
		nama varchar(50),
		durasi_validasi int, --durasi menunggu dari validasi hingga cek kesehatan (dalam menit)
		durasi_cek int --durasi menunggu dari cek kesehatan hingga vaksinasi (dalam menit)
	)

	DECLARE cursorDurasi CURSOR --buat cursor berisi nik, nama, waktu validasi, waktu cek, dan waktu vaksinasi
	FOR 
	SELECT nik, nama, convert(time, TB_Validasi.tanggalWaktu) as waktu_validasi, convert(time, TB_DataKesehatan.tanggalWaktu) as waktu_cek, convert(time, TB_Vaksinasi.tanggalWaktu) as waktu_vaksin
	FROM TB_Penduduk LEFT OUTER JOIN TB_Validasi ON TB_Penduduk.nik = TB_Validasi.fk_nik 
					LEFT OUTER JOIN TB_DataKesehatan ON TB_Penduduk.nik = TB_DataKesehatan.fk_nik 
					LEFT OUTER JOIN TB_Vaksinasi ON TB_Penduduk.nik = TB_Vaksinasi.fk_nik
	WHERE convert(date, TB_Validasi.tanggalWaktu) = convert(date, TB_DataKesehatan.tanggalWaktu) --filter data, hanya di tanggal yang sama
			AND convert(date, TB_DataKesehatan.tanggalWaktu) = convert(date, TB_Vaksinasi.tanggalWaktu)

	DECLARE --variabel untuk menyimpan value dari cursor
		@temp_nik varchar(50),
		@temp_nama varchar(50),
		@temp_validasi time, 
		@temp_cek time, 
		@temp_vaksin time

	OPEN cursorDurasi
	--iterasi `cursorDurasi`
	FETCH NEXT FROM cursorDurasi INTO @temp_nik, @temp_nama, @temp_validasi, @temp_cek, @temp_vaksin
	WHILE @@FETCH_STATUS = 0
	BEGIN
		INSERT INTO @result 
		SELECT @temp_nik, @temp_nama, abs(datediff(minute, @temp_validasi, @temp_cek)), abs(datediff(minute, @temp_cek, @temp_vaksin)) --hitung selisih waktu: validasi dan cek, cek dan vaksinasi

		FETCH NEXT FROM cursorDurasi INTO @temp_nik, @temp_nama, @temp_validasi, @temp_cek, @temp_vaksin
	END

	CLOSE cursorDurasi
	DEALLOCATE cursorDurasi

	SELECT *
	FROM @result

EXEC laporanDurasi


