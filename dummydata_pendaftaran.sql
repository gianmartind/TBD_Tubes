USE [master]
GO

INSERT INTO [dbo].[TB_Pendaftaran]
           ([tanggalWaktu]
           ,[tanggalDaftar]
           ,[fk_nik]
           ,[fk_idFaskes])
     VALUES
           ('2021-06-25 08:00:00', '2021-06-20 10:10:14.000', '10000000', 1),
		   ('2021-06-26 08:00:00', '2021-06-24 11:11:00.000', '10000001', 2),
		   ('2021-06-27 08:00:00', '2021-06-22 07:06:26.000', '10000002', 3)
GO


