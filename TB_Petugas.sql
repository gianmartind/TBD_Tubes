USE [master]
GO

/****** Object:  Table [dbo].[TB_Petugas]    Script Date: 22/06/2021 20:06:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_Petugas](
	[nik] [varchar](50) NOT NULL,
	[idPetugas] [int] IDENTITY(1,1) NOT NULL,
	[nama] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[noHP] [varchar](50) NOT NULL,
	[tanggalLahir] [date] NOT NULL,
	[fk_idAlamat] [int] NOT NULL,
 CONSTRAINT [PK_TB_Petugas] PRIMARY KEY CLUSTERED 
(
	[nik] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[idPetugas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TB_Petugas]  WITH CHECK ADD  CONSTRAINT [FK_TB_Petugas_idAlamat] FOREIGN KEY([fk_idAlamat])
REFERENCES [dbo].[TB_Alamat] ([idAlamat])
GO

ALTER TABLE [dbo].[TB_Petugas] CHECK CONSTRAINT [FK_TB_Petugas_idAlamat]
GO

