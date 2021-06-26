USE [master]
GO

/****** Object:  Table [dbo].[TB_Pimpinan]    Script Date: 25/06/2021 20:17:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_Pimpinan](
	[nik] [varchar](50) NOT NULL,
	[idPimpinan] [int] IDENTITY(1,1) NOT NULL,
	[nama] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[noHP] [varchar](50) NOT NULL,
	[tanggalLahir] [date] NOT NULL,
	[fk_idAlamat] [int] NOT NULL,
 CONSTRAINT [PK_TB_Pimpinan] PRIMARY KEY CLUSTERED 
(
	[nik] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TB_Pimpinan]  WITH CHECK ADD  CONSTRAINT [FK_TB_Pimpinan_idAlamat] FOREIGN KEY([fk_idAlamat])
REFERENCES [dbo].[TB_Alamat] ([idAlamat])
GO

ALTER TABLE [dbo].[TB_Pimpinan] CHECK CONSTRAINT [FK_TB_Pimpinan_idAlamat]
GO


