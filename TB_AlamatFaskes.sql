USE [master]
GO

/****** Object:  Table [dbo].[TB_AlamatFaskes]    Script Date: 22/06/2021 20:05:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_AlamatFaskes](
	[idAlamatFaskes] [int] IDENTITY(1,1) NOT NULL,
	[namaAlamatFaskes] [varchar](50) NOT NULL,
	[fk_idKota] [int] NOT NULL,
 CONSTRAINT [PK_TB_AlamatFaskes] PRIMARY KEY CLUSTERED 
(
	[idAlamatFaskes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TB_AlamatFaskes]  WITH CHECK ADD  CONSTRAINT [FK_TB_AlamatFaskes_idKota] FOREIGN KEY([fk_idKota])
REFERENCES [dbo].[TB_Kota] ([idKota])
GO

ALTER TABLE [dbo].[TB_AlamatFaskes] CHECK CONSTRAINT [FK_TB_AlamatFaskes_idKota]
GO

