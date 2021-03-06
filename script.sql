USE [master]
GO
/****** Object:  Database [MVCDigiKeyStore]    Script Date: 9/13/2017 10:43:57 AM ******/
CREATE DATABASE [MVCDigiKeyStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MVCDigiKeyStore', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\MVCDigiKeyStore.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MVCDigiKeyStore_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\MVCDigiKeyStore_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MVCDigiKeyStore] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MVCDigiKeyStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MVCDigiKeyStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MVCDigiKeyStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MVCDigiKeyStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MVCDigiKeyStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MVCDigiKeyStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [MVCDigiKeyStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MVCDigiKeyStore] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [MVCDigiKeyStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MVCDigiKeyStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MVCDigiKeyStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MVCDigiKeyStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MVCDigiKeyStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MVCDigiKeyStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MVCDigiKeyStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MVCDigiKeyStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MVCDigiKeyStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MVCDigiKeyStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MVCDigiKeyStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MVCDigiKeyStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MVCDigiKeyStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MVCDigiKeyStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MVCDigiKeyStore] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [MVCDigiKeyStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MVCDigiKeyStore] SET RECOVERY FULL 
GO
ALTER DATABASE [MVCDigiKeyStore] SET  MULTI_USER 
GO
ALTER DATABASE [MVCDigiKeyStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MVCDigiKeyStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MVCDigiKeyStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MVCDigiKeyStore] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MVCDigiKeyStore', N'ON'
GO
USE [MVCDigiKeyStore]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 9/13/2017 10:43:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 9/13/2017 10:43:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[CartId] [nvarchar](max) NULL,
	[ProductId] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Carts] PRIMARY KEY CLUSTERED 
(
	[RecordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 9/13/2017 10:43:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_dbo.OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 9/13/2017 10:43:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[Username] [nvarchar](max) NULL,
	[FirstName] [nvarchar](160) NOT NULL,
	[LastName] [nvarchar](160) NOT NULL,
	[Address] [nvarchar](70) NOT NULL,
	[City] [nvarchar](40) NOT NULL,
	[State] [nvarchar](40) NOT NULL,
	[PostalCode] [nvarchar](10) NOT NULL,
	[Country] [nvarchar](40) NOT NULL,
	[Phone] [nvarchar](24) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_dbo.Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 9/13/2017 10:43:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[TypeId] [int] NOT NULL,
	[SupplierId] [int] NOT NULL,
	[ProductName] [nvarchar](160) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Stock] [int] NOT NULL,
	[ProductUrl] [nvarchar](1024) NULL,
 CONSTRAINT [PK_dbo.Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 9/13/2017 10:43:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Types]    Script Date: 9/13/2017 10:43:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Types](
	[TypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Types] PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [IX_ProductId]    Script Date: 9/13/2017 10:43:57 AM ******/
CREATE NONCLUSTERED INDEX [IX_ProductId] ON [dbo].[Carts]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderId]    Script Date: 9/13/2017 10:43:57 AM ******/
CREATE NONCLUSTERED INDEX [IX_OrderId] ON [dbo].[OrderDetails]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductId]    Script Date: 9/13/2017 10:43:57 AM ******/
CREATE NONCLUSTERED INDEX [IX_ProductId] ON [dbo].[OrderDetails]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SupplierId]    Script Date: 9/13/2017 10:43:57 AM ******/
CREATE NONCLUSTERED INDEX [IX_SupplierId] ON [dbo].[Products]
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TypeId]    Script Date: 9/13/2017 10:43:57 AM ******/
CREATE NONCLUSTERED INDEX [IX_TypeId] ON [dbo].[Products]
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Carts_dbo.Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_dbo.Carts_dbo.Products_ProductId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderDetails_dbo.Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_dbo.OrderDetails_dbo.Orders_OrderId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderDetails_dbo.Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_dbo.OrderDetails_dbo.Products_ProductId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Products_dbo.Suppliers_SupplierId] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Suppliers] ([SupplierId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_dbo.Products_dbo.Suppliers_SupplierId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Products_dbo.Types_TypeId] FOREIGN KEY([TypeId])
REFERENCES [dbo].[Types] ([TypeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_dbo.Products_dbo.Types_TypeId]
GO
USE [master]
GO
ALTER DATABASE [MVCDigiKeyStore] SET  READ_WRITE 
GO
