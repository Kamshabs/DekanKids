USE [master]
GO
/****** Object:  Database [dekandb]    Script Date: 31-May-16 8:30:52 AM ******/
CREATE DATABASE [dekandb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dekandb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\dekandb.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'dekandb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\dekandb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [dekandb] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dekandb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dekandb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dekandb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dekandb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dekandb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dekandb] SET ARITHABORT OFF 
GO
ALTER DATABASE [dekandb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dekandb] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [dekandb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dekandb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dekandb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dekandb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dekandb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dekandb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dekandb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dekandb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dekandb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dekandb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dekandb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dekandb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dekandb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dekandb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dekandb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dekandb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dekandb] SET RECOVERY FULL 
GO
ALTER DATABASE [dekandb] SET  MULTI_USER 
GO
ALTER DATABASE [dekandb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dekandb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dekandb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dekandb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'dekandb', N'ON'
GO
USE [dekandb]
GO
/****** Object:  Table [dbo].[Admins]    Script Date: 31-May-16 8:30:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admins](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[AdminName] [nvarchar](50) NULL,
	[AdminPassword] [nvarchar](500) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Admins] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Brand]    Script Date: 31-May-16 8:30:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[BrandID] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](50) NULL,
	[BrandNameAR] [nvarchar](500) NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[BrandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 31-May-16 8:30:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[ParentID] [int] NULL,
	[Title] [varchar](50) NOT NULL,
	[TitleAr] [nvarchar](100) NOT NULL,
	[Url] [varchar](200) NOT NULL,
	[OrderNumber] [int] NOT NULL,
	[Isdeleted] [bit] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK__Menus__3214EC2783D43414] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Color]    Script Date: 31-May-16 8:30:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Color](
	[ColorId] [int] IDENTITY(1,1) NOT NULL,
	[ColorName] [nvarchar](50) NULL,
	[ColorNameAR] [nvarchar](500) NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Color] PRIMARY KEY CLUSTERED 
(
	[ColorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Currency]    Script Date: 31-May-16 8:30:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Currency](
	[CurrencyId] [int] IDENTITY(1,1) NOT NULL,
	[CurrencyName] [nvarchar](50) NULL,
	[CurrencyNameAR] [nvarchar](500) NULL,
	[CurrencySymbol] [nvarchar](50) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Currency] PRIMARY KEY CLUSTERED 
(
	[CurrencyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Gender]    Script Date: 31-May-16 8:30:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[GenderId] [int] IDENTITY(1,1) NOT NULL,
	[GenderType] [nvarchar](50) NULL,
	[GenderTypeAR] [nvarchar](500) NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[GenderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Parent]    Script Date: 31-May-16 8:30:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parent](
	[ParentID] [int] IDENTITY(1,1) NOT NULL,
	[ParentName] [nvarchar](50) NULL,
	[ParentNameAR] [nvarchar](500) NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Parent] PRIMARY KEY CLUSTERED 
(
	[ParentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PaymentCards]    Script Date: 31-May-16 8:30:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentCards](
	[CardTypeID] [int] NOT NULL,
	[CardTypename] [nvarchar](50) NULL,
	[CardTypeNameAR] [nvarchar](500) NULL,
	[CardLogo] [nvarchar](max) NULL,
 CONSTRAINT [PK_PaymentCards] PRIMARY KEY CLUSTERED 
(
	[CardTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductDetails]    Script Date: 31-May-16 8:30:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductDetails](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductMasterID] [int] NULL,
	[ParentID] [int] NULL,
	[SizeId] [int] NOT NULL,
	[ColorId] [int] NOT NULL,
	[BrandID] [int] NULL,
	[SKUID] [varchar](100) NULL,
	[ProductName] [varchar](100) NOT NULL,
	[ProductNameAr] [nvarchar](100) NOT NULL,
	[ProductDesc] [varchar](200) NULL,
	[ProductDescAr] [nvarchar](200) NULL,
	[ImagePath] [varchar](100) NULL,
	[MSRP] [float] NOT NULL,
	[Discount] [float] NULL,
	[Ranking] [int] NULL,
	[ProductAvailable] [bit] NOT NULL,
	[CurrentOrder] [varchar](50) NULL,
	[DateAdded] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductMaster]    Script Date: 31-May-16 8:30:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductMaster](
	[ProductMasterID] [int] IDENTITY(1,1) NOT NULL,
	[MasterName] [nvarchar](max) NULL,
	[Price] [decimal](18, 3) NULL,
	[Ranking] [nvarchar](50) NULL,
	[Quantity] [int] NULL,
	[imagepath] [nvarchar](max) NOT NULL,
	[CategoryID] [int] NULL,
	[SubCategoryID] [int] NOT NULL,
 CONSTRAINT [PK_ProductMaster] PRIMARY KEY CLUSTERED 
(
	[ProductMasterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Size]    Script Date: 31-May-16 8:30:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[SizeId] [int] IDENTITY(1,1) NOT NULL,
	[SizeName] [nvarchar](50) NULL,
	[SizeNameAR] [nvarchar](500) NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Size] PRIMARY KEY CLUSTERED 
(
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 31-May-16 8:30:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SubCategory](
	[SubCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[ParentID] [int] NULL,
	[SubCategoryName] [varchar](100) NOT NULL,
	[SubCategoryNameAr] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NULL,
	[Isdeleted] [bit] NULL,
 CONSTRAINT [PK_SubCategory] PRIMARY KEY CLUSTERED 
(
	[SubCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 31-May-16 8:30:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserProfile](
	[RegId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Role] [varchar](10) NOT NULL,
	[Email] [varchar](25) NOT NULL,
	[Gender] [char](6) NULL,
	[Address] [nvarchar](500) NULL,
	[Area] [nvarchar](100) NULL,
	[Country] [nvarchar](50) NULL,
	[Contact] [int] NOT NULL,
	[Acontact] [int] NULL,
	[GoogleCo] [nvarchar](50) NULL,
	[ShipAddress] [nvarchar](100) NULL,
	[ShipContact] [int] NULL,
	[CreditCardNmbr] [int] NULL,
	[CreditCardTypeID] [varchar](50) NULL,
	[CreditCardExpMo] [date] NULL,
	[CreditCardExpYr] [date] NULL,
	[DateJoined] [date] NULL,
	[Isdeleted] [bit] NOT NULL,
 CONSTRAINT [PK_UserProfile] PRIMARY KEY CLUSTERED 
(
	[RegId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [ParentID], [Title], [TitleAr], [Url], [OrderNumber], [Isdeleted], [IsActive]) VALUES (1, NULL, N'Home', N'الرئيسية', N'/', 1, 0, 1)
INSERT [dbo].[Category] ([CategoryID], [ParentID], [Title], [TitleAr], [Url], [OrderNumber], [Isdeleted], [IsActive]) VALUES (2, NULL, N'Swaddle', N'قماط', N'#', 2, 0, 1)
INSERT [dbo].[Category] ([CategoryID], [ParentID], [Title], [TitleAr], [Url], [OrderNumber], [Isdeleted], [IsActive]) VALUES (3, NULL, N'Baby', N'طفل', N'#', 3, 0, 1)
INSERT [dbo].[Category] ([CategoryID], [ParentID], [Title], [TitleAr], [Url], [OrderNumber], [Isdeleted], [IsActive]) VALUES (4, NULL, N'Girl', N'بنت', N'#', 4, 0, 1)
INSERT [dbo].[Category] ([CategoryID], [ParentID], [Title], [TitleAr], [Url], [OrderNumber], [Isdeleted], [IsActive]) VALUES (5, NULL, N'Boy', N'ولـد', N'#', 5, 0, 1)
INSERT [dbo].[Category] ([CategoryID], [ParentID], [Title], [TitleAr], [Url], [OrderNumber], [Isdeleted], [IsActive]) VALUES (6, NULL, N'Bags', N'أكياس', N'#', 6, 0, 1)
INSERT [dbo].[Category] ([CategoryID], [ParentID], [Title], [TitleAr], [Url], [OrderNumber], [Isdeleted], [IsActive]) VALUES (7, NULL, N'Shoes', N'أحذية', N'#', 7, 0, 1)
INSERT [dbo].[Category] ([CategoryID], [ParentID], [Title], [TitleAr], [Url], [OrderNumber], [Isdeleted], [IsActive]) VALUES (8, NULL, N'About Us', N'من نحن', N'#', 8, 0, 1)
INSERT [dbo].[Category] ([CategoryID], [ParentID], [Title], [TitleAr], [Url], [OrderNumber], [Isdeleted], [IsActive]) VALUES (9, NULL, N'Contact Us', N'اتصل بنا', N'/default/contactus', 9, 0, 1)
INSERT [dbo].[Category] ([CategoryID], [ParentID], [Title], [TitleAr], [Url], [OrderNumber], [Isdeleted], [IsActive]) VALUES (10, 3, N'Babysuits', N'الدعاوى طفل', N'#', 1, 0, 1)
INSERT [dbo].[Category] ([CategoryID], [ParentID], [Title], [TitleAr], [Url], [OrderNumber], [Isdeleted], [IsActive]) VALUES (11, 4, N'Dresses', N'فساتين', N'/default/productlist', 1, 0, 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[ProductDetails] ON 

INSERT [dbo].[ProductDetails] ([ProductId], [ProductMasterID], [ParentID], [SizeId], [ColorId], [BrandID], [SKUID], [ProductName], [ProductNameAr], [ProductDesc], [ProductDescAr], [ImagePath], [MSRP], [Discount], [Ranking], [ProductAvailable], [CurrentOrder], [DateAdded], [IsActive], [IsDeleted]) VALUES (2, NULL, NULL, 1, 1, NULL, N'2BE456987', N'Sweet Dress', N'اللباس الحلو', N'Demo Sample for the Application', N'نموذج تجريبي لتطبيق', N'/Contents/img/product/SweetGirl1.jpg', 45, 5, 1, 1, N'5', CAST(N'2016-05-12 00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductMasterID], [ParentID], [SizeId], [ColorId], [BrandID], [SKUID], [ProductName], [ProductNameAr], [ProductDesc], [ProductDescAr], [ImagePath], [MSRP], [Discount], [Ranking], [ProductAvailable], [CurrentOrder], [DateAdded], [IsActive], [IsDeleted]) VALUES (7, NULL, NULL, 1, 1, NULL, N'3CH89658', N'Morning Lily', N'صباح الزنبق', N'Demo Sample From Application', N'نموذج تجريبي من تطبيق', N'/Contents/img/product/MorningLily.jpg', 80, 10, 1, 1, N'6', CAST(N'2016-05-12 00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductMasterID], [ParentID], [SizeId], [ColorId], [BrandID], [SKUID], [ProductName], [ProductNameAr], [ProductDesc], [ProductDescAr], [ImagePath], [MSRP], [Discount], [Ranking], [ProductAvailable], [CurrentOrder], [DateAdded], [IsActive], [IsDeleted]) VALUES (8, NULL, NULL, 1, 1, NULL, N'3CH89659', N'Afternoon Flower', N'صباح الزنبق', N'Demo Sample From Application', N'نموذج تجريبي من تطبيق', N'/Contents/img/product/MorningLily.jpg', 70, 10, 1, 1, N'6', CAST(N'2016-05-12 00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductMasterID], [ParentID], [SizeId], [ColorId], [BrandID], [SKUID], [ProductName], [ProductNameAr], [ProductDesc], [ProductDescAr], [ImagePath], [MSRP], [Discount], [Ranking], [ProductAvailable], [CurrentOrder], [DateAdded], [IsActive], [IsDeleted]) VALUES (9, NULL, NULL, 1, 1, NULL, N'3CH89658', N'Morning Lily', N'صباح الزنبق', N'Demo Sample From Application', N'نموذج تجريبي من تطبيق', N'/Contents/img/product/MorningLily.jpg', 80, 10, 1, 1, N'6', CAST(N'2016-05-12 00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductMasterID], [ParentID], [SizeId], [ColorId], [BrandID], [SKUID], [ProductName], [ProductNameAr], [ProductDesc], [ProductDescAr], [ImagePath], [MSRP], [Discount], [Ranking], [ProductAvailable], [CurrentOrder], [DateAdded], [IsActive], [IsDeleted]) VALUES (10, NULL, NULL, 1, 1, NULL, N'3CH89658', N'Morning Lily', N'صباح الزنبق', N'Demo Sample From Application', N'نموذج تجريبي من تطبيق', N'/Contents/img/product/MorningLily.jpg', 80, 10, 1, 1, N'6', CAST(N'2016-05-12 00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductMasterID], [ParentID], [SizeId], [ColorId], [BrandID], [SKUID], [ProductName], [ProductNameAr], [ProductDesc], [ProductDescAr], [ImagePath], [MSRP], [Discount], [Ranking], [ProductAvailable], [CurrentOrder], [DateAdded], [IsActive], [IsDeleted]) VALUES (11, NULL, NULL, 1, 1, NULL, N'3CH89658', N'Morning Lily', N'صباح الزنبق', N'Demo Sample From Application', N'نموذج تجريبي من تطبيق', N'/Contents/img/product/MorningLily.jpg', 80, 10, 1, 1, N'6', CAST(N'2016-05-12 00:00:00.000' AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[ProductDetails] OFF
SET IDENTITY_INSERT [dbo].[SubCategory] ON 

INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [ParentID], [SubCategoryName], [SubCategoryNameAr], [IsActive], [Isdeleted]) VALUES (1, 11, NULL, N'Special Occasion', N'مناسبة خاصة', 1, 0)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [ParentID], [SubCategoryName], [SubCategoryNameAr], [IsActive], [Isdeleted]) VALUES (2, 11, NULL, N'Casual', N'عرضي', 1, 0)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [ParentID], [SubCategoryName], [SubCategoryNameAr], [IsActive], [Isdeleted]) VALUES (3, 11, NULL, N'Dress Set', N'مجموعة اللباس', 1, 0)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [ParentID], [SubCategoryName], [SubCategoryNameAr], [IsActive], [Isdeleted]) VALUES (5, 10, NULL, N'Small Pattern', N'مجموعة اللباس', 1, 0)
SET IDENTITY_INSERT [dbo].[SubCategory] OFF
SET IDENTITY_INSERT [dbo].[UserProfile] ON 

INSERT [dbo].[UserProfile] ([RegId], [FullName], [Username], [Password], [Role], [Email], [Gender], [Address], [Area], [Country], [Contact], [Acontact], [GoogleCo], [ShipAddress], [ShipContact], [CreditCardNmbr], [CreditCardTypeID], [CreditCardExpMo], [CreditCardExpYr], [DateJoined], [Isdeleted]) VALUES (2, N'shabbir Ismail Salumberwala', N'shabbir7252', N'Saif@786', N'member', N'shabbir7252@live.com', NULL, NULL, NULL, NULL, 60978652, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[UserProfile] OFF
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK__Menus__ParentID__173876EA] FOREIGN KEY([ParentID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK__Menus__ParentID__173876EA]
GO
ALTER TABLE [dbo].[ProductDetails]  WITH CHECK ADD  CONSTRAINT [FK_ProductDetails_ProductMaster] FOREIGN KEY([ProductMasterID])
REFERENCES [dbo].[ProductMaster] ([ProductMasterID])
GO
ALTER TABLE [dbo].[ProductDetails] CHECK CONSTRAINT [FK_ProductDetails_ProductMaster]
GO
ALTER TABLE [dbo].[ProductMaster]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaster_SubCategory] FOREIGN KEY([SubCategoryID])
REFERENCES [dbo].[SubCategory] ([SubCategoryID])
GO
ALTER TABLE [dbo].[ProductMaster] CHECK CONSTRAINT [FK_ProductMaster_SubCategory]
GO
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [FK_SubCategory_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [FK_SubCategory_Category]
GO
USE [master]
GO
ALTER DATABASE [dekandb] SET  READ_WRITE 
GO
