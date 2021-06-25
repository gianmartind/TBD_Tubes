USE [master]
GO

/****** Object:  Table [dbo].[TB_Vaksinasi]    Script Date: 22/06/2021 20:07:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_Vaksinasi](
	[idVaksinasi] [int] IDENTITY(1,1) NOT NULL,
	[tanggalWaktu] [datetime] NOT NULL,
	[tahap] [int] NOT NULL,
	[fk_nik] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TB_Vaksinasi] PRIMARY KEY CLUSTERED 
(
	[idVaksinasi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TB_Vaksinasi]  WITH CHECK ADD  CONSTRAINT [FK_TB_Vaksinasi_nik] FOREIGN KEY([fk_nik])
REFERENCES [dbo].[TB_Penduduk] ([nik])
GO

ALTER TABLE [dbo].[TB_Vaksinasi] CHECK CONSTRAINT [FK_TB_Vaksinasi_nik]
GO

