
DROP  TABLE IF EXISTS [dbo].[MULTI_TAX_CustomerInformation]
GO

IF NOT EXISTS (
    SELECT 1
    FROM sys.columns
    WHERE object_id = OBJECT_ID('StatementGenerator')
    AND name = 'isMulti'
)
BEGIN
	ALTER TABLE StatementGenerator
	ADD isMulti bit
		CONSTRAINT SG_isMulti DEFAULT '0';
END

drop table if exists  [dbo].[MULTI_TAX_CustomerInformation]
CREATE TABLE [dbo].[MULTI_TAX_CustomerInformation](
	[DataID] [int] IDENTITY(1,1) NOT NULL primary key,
	[cif] [varchar](30) NOT NULL,
	[customer_name] [varchar](150) NOT NULL,
	[account_no] [varchar](30) NOT NULL,
	[branch_code] [smallint] NOT NULL,
	[postal_code] [varchar](6) NOT NULL,
	[fk_taxrequestlist] [bigint] NULL,
	[DATE_BIRTH] [varchar](6) NULL
) ON [PRIMARY]
GO


DROP TABLE IF EXISTS [dbo].[MULTI_TAX_MappingStatementGenerator]
CREATE TABLE [dbo].[MULTI_TAX_MappingStatementGenerator](
	[DataID] [int] IDENTITY(1,1) NOT NULL primary key,
	[FK_StatementGenerator] [int]  NOT NULL,
	[FK_StatementGenerator_Child] [int]  NOT NULL,
	Is_Active bit CONSTRAINT SG_isActive DEFAULT 1 
) ON [PRIMARY]
GO


USE [Enginestatement_BDI]
GO
/****** Object:  Table [dbo].[STGMULTI_TAX_1]    Script Date: 12/3/2024 2:35:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [dbo].[STGMULTI_TAX_1]
CREATE TABLE [dbo].[STGMULTI_TAX_1](
	[PK_Table_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CIFNo] [varchar](50) NULL,
	[Nama] [varchar](max) NULL,
	[Branch] [varchar](50) NULL,
	[PostalCode] [varchar](50) NULL,
	[Amount] [decimal](18, 2) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STGMULTI_TAX_2]    Script Date: 12/3/2024 2:35:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [dbo].[STGMULTI_TAX_2]
CREATE TABLE [dbo].[STGMULTI_TAX_2](
	[PK_Table_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CIFNo] [varchar](50) NULL,
	[Nama] [varchar](max) NULL,
	[Branch] [varchar](50) NULL,
	[PostalCode] [varchar](50) NULL,
	[Saldo] [decimal](18, 2) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STGMULTI_TAX_3]    Script Date: 12/3/2024 2:35:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

DROP TABLE IF EXISTS [dbo].[STGMULTI_TAX_3]
CREATE TABLE [dbo].[STGMULTI_TAX_3](
	[PK_Table_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CIFNo] [varchar](50) NULL,
	[Nama] [varchar](max) NULL,
	[Branch] [varchar](50) NULL,
	[PostalCode] [varchar](50) NULL,
	[Tax] [decimal](18, 2) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[STGMULTI_TAX_1] ON 

INSERT [dbo].[STGMULTI_TAX_1] ([PK_Table_ID], [CIFNo], [Nama], [Branch], [PostalCode], [Amount]) VALUES (1, N'5796246', N'Cintia', N'KC Gunung Sahari', N'22345', CAST(3000000.00 AS Decimal(18, 2)))
INSERT [dbo].[STGMULTI_TAX_1] ([PK_Table_ID], [CIFNo], [Nama], [Branch], [PostalCode], [Amount]) VALUES (2, N'5796212', N'Melati', N'KC Rasuna Sahid', N'11234', CAST(1200000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[STGMULTI_TAX_1] OFF
GO
SET IDENTITY_INSERT [dbo].[STGMULTI_TAX_2] ON 

INSERT [dbo].[STGMULTI_TAX_2] ([PK_Table_ID], [CIFNo], [Nama], [Branch], [PostalCode], [Saldo]) VALUES (1, N'1202212', N'Pieter', N'KC Setia Budi', N'21001', CAST(20000000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[STGMULTI_TAX_2] OFF
GO
SET IDENTITY_INSERT [dbo].[STGMULTI_TAX_3] ON 

INSERT [dbo].[STGMULTI_TAX_3] ([PK_Table_ID], [CIFNo], [Nama], [Branch], [PostalCode], [Tax]) VALUES (1, N'1230987', N'Mikael', N'KC Margonda', N'63242', CAST(2300.00 AS Decimal(18, 2)))
INSERT [dbo].[STGMULTI_TAX_3] ([PK_Table_ID], [CIFNo], [Nama], [Branch], [PostalCode], [Tax]) VALUES (2, N'1231188', N'Nadia', N'KC Pancoran Mas', N'11092', CAST(5000.00 AS Decimal(18, 2)))
INSERT [dbo].[STGMULTI_TAX_3] ([PK_Table_ID], [CIFNo], [Nama], [Branch], [PostalCode], [Tax]) VALUES (3, N'1200989', N'Kevin', N'KC Tananh Abang', N'23512', CAST(6300.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[STGMULTI_TAX_3] OFF
GO

--sesuaikan table
--di tiap rdl manggil table [STGMULTI_TAX_1] - [STGMULTI_TAX_3]
--bikin 3 child
--bikin ssis 3 isinya

CREATE OR ALTER PROC USP_STGMULTI_TAX_1
AS
TRUNCATE TABLE STGMULTI_TAX_1
INSERT INTO [dbo].[STGMULTI_TAX_1] ( [CIFNo], [Nama], [Branch], [PostalCode], [Amount]) VALUES ( '5796246', 'Cintia', 'KC Gunung Sahari', '22345', 3000000.00);
INSERT INTO [dbo].[STGMULTI_TAX_1] ( [CIFNo], [Nama], [Branch], [PostalCode], [Amount]) VALUES ( '5796212', 'Melati', 'KC Rasuna Sahid', '11234', 1200000.00);
GO

CREATE OR ALTER PROC USP_STGMULTI_TAX_2
AS
TRUNCATE TABLE STGMULTI_TAX_1
INSERT INTO [dbo].[STGMULTI_TAX_1] ( [CIFNo], [Nama], [Branch], [PostalCode], [Amount]) VALUES ( '5796246', 'Cintia', 'KC Gunung Sahari', '22345', 3000000.00);
INSERT INTO [dbo].[STGMULTI_TAX_1] ( [CIFNo], [Nama], [Branch], [PostalCode], [Amount]) VALUES ( '5796212', 'Melati', 'KC Rasuna Sahid', '11234', 1200000.00);
GO

CREATE OR ALTER PROC USP_STGMULTI_TAX_3
AS
TRUNCATE TABLE STGMULTI_TAX_1
INSERT INTO [dbo].[STGMULTI_TAX_1] ( [CIFNo], [Nama], [Branch], [PostalCode], [Amount]) VALUES ( '5796246', 'Cintia', 'KC Gunung Sahari', '22345', 3000000.00);
INSERT INTO [dbo].[STGMULTI_TAX_1] ( [CIFNo], [Nama], [Branch], [PostalCode], [Amount]) VALUES ( '5796212', 'Melati', 'KC Rasuna Sahid', '11234', 1200000.00);
go