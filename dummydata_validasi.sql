USE [master]
GO

INSERT INTO [dbo].[TB_Validasi]
           ([tanggalWaktu]
           ,[keterangan]
           ,[fk_nik]
		   ,[fk_idFaskes])
     VALUES
           ('2021-6-25 10:10:14','VALID','10000000',1),
			('2021-6-26 11:13:17','VALID','10000001',2),
			('2021-6-27 12:16:20','VALID','10000002',3),
			('2021-7-23 13:19:23','VALID','10000000',1),
			('2021-7-24 14:22:26','VALID','10000001',2),
			('2021-7-25 15:25:29','VALID','10000002',3)

GO


