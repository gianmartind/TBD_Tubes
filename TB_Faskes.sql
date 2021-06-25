USE [master]
GO

/****** Object:  Table [dbo].[TB_Faskes]    Script Date: 22/06/2021 20:06:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_Faskes](
	[idFaskes] [int] IDENTITY(1,1) NOT NULL,
	[namaFaskes] [varchar](50) NOT NULL,
	[kapasitas] [int] NOT NULL,
	[fk_idAlamatFaskes] [int] NOT NULL,
	[tipe] [varchar](50) NULL,
 CONSTRAINT [PK_TB_Faskes] PRIMARY KEY CLUSTERED 
(
	[idFaskes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TB_Faskes]  WITH CHECK ADD  CONSTRAINT [FK_TB_Faskes_idAlamat] FOREIGN KEY([fk_idAlamatFaskes])
REFERENCES [dbo].[TB_AlamatFaskes] ([idAlamatFaskes])
GO

ALTER TABLE [dbo].[TB_Faskes] CHECK CONSTRAINT [FK_TB_Faskes_idAlamat]
GO

