USE [master]
GO

/****** Object:  Table [dbo].[TB_Pendaftaran]    Script Date: 26/06/2021 17:23:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_Pendaftaran](
	[idPendaftaran] [int] IDENTITY(1,1) NOT NULL,
	[tanggalWaktu] [datetime] NOT NULL,
	[tanggalDaftar] [datetime] NOT NULL,
	[fk_nik] [varchar](50) NOT NULL,
	[fk_idFaskes] [int] NOT NULL,
 CONSTRAINT [PK_TB_Pendaftaran] PRIMARY KEY CLUSTERED 
(
	[idPendaftaran] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TB_Pendaftaran]  WITH CHECK ADD  CONSTRAINT [FK_TB_Pendaftaran_idFaskes] FOREIGN KEY([fk_idFaskes])
REFERENCES [dbo].[TB_Faskes] ([idFaskes])
GO

ALTER TABLE [dbo].[TB_Pendaftaran] CHECK CONSTRAINT [FK_TB_Pendaftaran_idFaskes]
GO

ALTER TABLE [dbo].[TB_Pendaftaran]  WITH CHECK ADD  CONSTRAINT [FK_TB_Pendaftaran_nik] FOREIGN KEY([fk_nik])
REFERENCES [dbo].[TB_Penduduk] ([nik])
GO

ALTER TABLE [dbo].[TB_Pendaftaran] CHECK CONSTRAINT [FK_TB_Pendaftaran_nik]
GO


