USE [master]
GO

/****** Object:  Table [dbo].[TB_DataKesehatan]    Script Date: 22/06/2021 20:05:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_DataKesehatan](
	[idDataKesehatan] [int] IDENTITY(1,1) NOT NULL,
	[suhuTubuh] [float] NOT NULL,
	[tekananDarah] [varchar](50) NOT NULL,
	[tahap] [int] NOT NULL,
	[status] [varchar](50) NOT NULL,
	[tanggalWaktu] [datetime] NOT NULL,
	[fk_nik] [varchar](50) NOT NULL,
	[fk_idPetugas] [int] NOT NULL,
 CONSTRAINT [PK_TB_DataKesehatan] PRIMARY KEY CLUSTERED 
(
	[idDataKesehatan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TB_DataKesehatan]  WITH CHECK ADD  CONSTRAINT [FK_TB_DataKesehatan_idPetugas] FOREIGN KEY([fk_idPetugas])
REFERENCES [dbo].[TB_Petugas] ([idPetugas])
GO

ALTER TABLE [dbo].[TB_DataKesehatan] CHECK CONSTRAINT [FK_TB_DataKesehatan_idPetugas]
GO

ALTER TABLE [dbo].[TB_DataKesehatan]  WITH CHECK ADD  CONSTRAINT [FK_TB_DataKesehatan_nik] FOREIGN KEY([fk_nik])
REFERENCES [dbo].[TB_Penduduk] ([nik])
GO

ALTER TABLE [dbo].[TB_DataKesehatan] CHECK CONSTRAINT [FK_TB_DataKesehatan_nik]
GO

