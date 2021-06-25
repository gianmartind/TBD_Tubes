USE [master]
GO

/****** Object:  Table [dbo].[TB_Penduduk]    Script Date: 22/06/2021 20:06:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_Penduduk](
	[nik] [varchar](50) NOT NULL,
	[nama] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[noHP] [varchar](50) NOT NULL,
	[tanggalLahir] [date] NOT NULL,
	[pekerjaan] [varchar](50) NOT NULL,
	[fk_idAlamat] [int] NOT NULL,
 CONSTRAINT [PK_TB_Penduduk] PRIMARY KEY CLUSTERED 
(
	[nik] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TB_Penduduk]  WITH CHECK ADD  CONSTRAINT [FK_TB_Penduduk_idAlamat] FOREIGN KEY([fk_idAlamat])
REFERENCES [dbo].[TB_Alamat] ([idAlamat])
GO

ALTER TABLE [dbo].[TB_Penduduk] CHECK CONSTRAINT [FK_TB_Penduduk_idAlamat]
GO

