USE [master]
GO
/****** Object:  Database [AtlasBooks]    Script Date: 29/9/2023 12:39:36 ******/
CREATE DATABASE [AtlasBooks]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AtlasBooks', FILENAME = N'/var/opt/mssql/data/AtlasBooks.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AtlasBooks_log', FILENAME = N'/var/opt/mssql/data/AtlasBooks_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AtlasBooks] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AtlasBooks].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AtlasBooks] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AtlasBooks] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AtlasBooks] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AtlasBooks] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AtlasBooks] SET ARITHABORT OFF 
GO
ALTER DATABASE [AtlasBooks] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AtlasBooks] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AtlasBooks] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AtlasBooks] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AtlasBooks] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AtlasBooks] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AtlasBooks] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AtlasBooks] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AtlasBooks] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AtlasBooks] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AtlasBooks] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AtlasBooks] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AtlasBooks] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AtlasBooks] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AtlasBooks] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AtlasBooks] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AtlasBooks] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AtlasBooks] SET RECOVERY FULL 
GO
ALTER DATABASE [AtlasBooks] SET  MULTI_USER 
GO
ALTER DATABASE [AtlasBooks] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AtlasBooks] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AtlasBooks] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AtlasBooks] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AtlasBooks] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AtlasBooks] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AtlasBooks', N'ON'
GO
ALTER DATABASE [AtlasBooks] SET QUERY_STORE = OFF
GO
USE [AtlasBooks]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 29/9/2023 12:39:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[bookId] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](100) NOT NULL,
	[synopsis] [varchar](255) NOT NULL,
	[rating] [decimal](3, 1) NOT NULL,
	[sectionId] [int] NOT NULL,
	[isAvailable] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[modifiedAt] [datetime] NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[bookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Branch]    Script Date: 29/9/2023 12:39:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branch](
	[branchId] [int] IDENTITY(1,1) NOT NULL,
	[branchCode] [varchar](10) NOT NULL,
	[description] [varchar](255) NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[modifiedAt] [datetime] NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_Branch] PRIMARY KEY CLUSTERED 
(
	[branchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Branch_branchCode] UNIQUE NONCLUSTERED 
(
	[branchCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loan]    Script Date: 29/9/2023 12:39:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loan](
	[loanId] [int] IDENTITY(1,1) NOT NULL,
	[loanDate] [datetime] NOT NULL,
	[returnDate] [datetime] NOT NULL,
	[userId] [int] NOT NULL,
	[bookId] [int] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[modifiedAt] [datetime] NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_Loan] PRIMARY KEY CLUSTERED 
(
	[loanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 29/9/2023 12:39:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[roleId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](255) NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[modifiedAt] [datetime] NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Role_name] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 29/9/2023 12:39:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[roomId] [int] IDENTITY(1,1) NOT NULL,
	[roomCode] [varchar](10) NOT NULL,
	[description] [varchar](255) NOT NULL,
	[branchId] [int] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[modifiedAt] [datetime] NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[roomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Room_roomCode] UNIQUE NONCLUSTERED 
(
	[roomCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Section]    Script Date: 29/9/2023 12:39:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Section](
	[sectionId] [int] IDENTITY(1,1) NOT NULL,
	[sectionCode] [varchar](10) NOT NULL,
	[description] [varchar](255) NOT NULL,
	[shelfId] [int] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[modifiedAt] [datetime] NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_Section] PRIMARY KEY CLUSTERED 
(
	[sectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Section_sectionCode] UNIQUE NONCLUSTERED 
(
	[sectionCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shelf]    Script Date: 29/9/2023 12:39:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shelf](
	[shelfId] [int] IDENTITY(1,1) NOT NULL,
	[shelfCode] [varchar](10) NOT NULL,
	[description] [varchar](255) NOT NULL,
	[shelvingId] [int] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[modifiedAt] [datetime] NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_Shelf] PRIMARY KEY CLUSTERED 
(
	[shelfId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Shelf_shelfCode] UNIQUE NONCLUSTERED 
(
	[shelfCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shelving]    Script Date: 29/9/2023 12:39:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shelving](
	[shelvingId] [int] IDENTITY(1,1) NOT NULL,
	[shelvingCode] [varchar](10) NOT NULL,
	[description] [varchar](255) NOT NULL,
	[roomId] [int] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[modifiedAt] [datetime] NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_Shelving] PRIMARY KEY CLUSTERED 
(
	[shelvingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Shelving_shelvingCode] UNIQUE NONCLUSTERED 
(
	[shelvingCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 29/9/2023 12:39:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[personalIdNumber] [varchar](20) NOT NULL,
	[firstName] [varchar](50) NOT NULL,
	[lastName] [varchar](50) NOT NULL,
	[bornDate] [date] NOT NULL,
	[phoneNumber] [varchar](15) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[roleId] [int] NOT NULL,
	[isLoanFree] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[modifiedAt] [datetime] NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_User_email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_User_phoneNumber] UNIQUE NONCLUSTERED 
(
	[phoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_User_UQ_User_personalIdNumber] UNIQUE NONCLUSTERED 
(
	[personalIdNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Book] ADD  CONSTRAINT [DF_Book_rating]  DEFAULT ((0)) FOR [rating]
GO
ALTER TABLE [dbo].[Book] ADD  CONSTRAINT [DF_Book_isAvailable]  DEFAULT ((1)) FOR [isAvailable]
GO
ALTER TABLE [dbo].[Book] ADD  CONSTRAINT [DF_Book_createdAt]  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Book] ADD  CONSTRAINT [DF_Book_modifiedAt]  DEFAULT (getdate()) FOR [modifiedAt]
GO
ALTER TABLE [dbo].[Book] ADD  CONSTRAINT [DF_Book_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Branch] ADD  CONSTRAINT [DF_Branch_createdAt]  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Branch] ADD  CONSTRAINT [DF_Branch_modifiedAt]  DEFAULT (getdate()) FOR [modifiedAt]
GO
ALTER TABLE [dbo].[Branch] ADD  CONSTRAINT [DF_Branch_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Loan] ADD  CONSTRAINT [DF_Loan_loanDate]  DEFAULT (getdate()) FOR [loanDate]
GO
ALTER TABLE [dbo].[Loan] ADD  CONSTRAINT [DF_Loan_createdAt]  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Loan] ADD  CONSTRAINT [DF_Loan_modifiedAt]  DEFAULT (getdate()) FOR [modifiedAt]
GO
ALTER TABLE [dbo].[Loan] ADD  CONSTRAINT [DF_Loan_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_createdAt]  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_modifiedAt]  DEFAULT (getdate()) FOR [modifiedAt]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Room] ADD  CONSTRAINT [DF_Room_createdAt]  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Room] ADD  CONSTRAINT [DF_Room_modifiedAt]  DEFAULT (getdate()) FOR [modifiedAt]
GO
ALTER TABLE [dbo].[Room] ADD  CONSTRAINT [DF_Room_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Section] ADD  CONSTRAINT [DF_Section_createdAt]  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Section] ADD  CONSTRAINT [DF_Section_modifiedAt]  DEFAULT (getdate()) FOR [modifiedAt]
GO
ALTER TABLE [dbo].[Section] ADD  CONSTRAINT [DF_Section_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Shelf] ADD  CONSTRAINT [DF_Shelf_createdAt]  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Shelf] ADD  CONSTRAINT [DF_Shelf_modifiedAt]  DEFAULT (getdate()) FOR [modifiedAt]
GO
ALTER TABLE [dbo].[Shelf] ADD  CONSTRAINT [DF_Shelf_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Shelving] ADD  CONSTRAINT [DF_Shelving_createdAt]  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Shelving] ADD  CONSTRAINT [DF_Shelving_modifiedAt]  DEFAULT (getdate()) FOR [modifiedAt]
GO
ALTER TABLE [dbo].[Shelving] ADD  CONSTRAINT [DF_Shelving_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_isLoanFree]  DEFAULT ((1)) FOR [isLoanFree]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_createdAt]  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_modifiedAt]  DEFAULT (getdate()) FOR [modifiedAt]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_sectionId] FOREIGN KEY([sectionId])
REFERENCES [dbo].[Section] ([sectionId])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_sectionId]
GO
ALTER TABLE [dbo].[Loan]  WITH CHECK ADD  CONSTRAINT [FK_Loan_bookId] FOREIGN KEY([bookId])
REFERENCES [dbo].[Book] ([bookId])
GO
ALTER TABLE [dbo].[Loan] CHECK CONSTRAINT [FK_Loan_bookId]
GO
ALTER TABLE [dbo].[Loan]  WITH CHECK ADD  CONSTRAINT [FK_Loan_userId] FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([userId])
GO
ALTER TABLE [dbo].[Loan] CHECK CONSTRAINT [FK_Loan_userId]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_branchId] FOREIGN KEY([branchId])
REFERENCES [dbo].[Branch] ([branchId])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_branchId]
GO
ALTER TABLE [dbo].[Section]  WITH CHECK ADD  CONSTRAINT [FK_Section_shelfId] FOREIGN KEY([shelfId])
REFERENCES [dbo].[Shelf] ([shelfId])
GO
ALTER TABLE [dbo].[Section] CHECK CONSTRAINT [FK_Section_shelfId]
GO
ALTER TABLE [dbo].[Shelf]  WITH CHECK ADD  CONSTRAINT [FK_Shelf_shelvingId] FOREIGN KEY([shelvingId])
REFERENCES [dbo].[Shelving] ([shelvingId])
GO
ALTER TABLE [dbo].[Shelf] CHECK CONSTRAINT [FK_Shelf_shelvingId]
GO
ALTER TABLE [dbo].[Shelving]  WITH CHECK ADD  CONSTRAINT [FK_Shelving_roomId] FOREIGN KEY([roomId])
REFERENCES [dbo].[Room] ([roomId])
GO
ALTER TABLE [dbo].[Shelving] CHECK CONSTRAINT [FK_Shelving_roomId]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_roleId] FOREIGN KEY([roleId])
REFERENCES [dbo].[Role] ([roleId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_roleId]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [CK_Book_rating] CHECK  (([rating]>=(0) AND [rating]<=(10)))
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [CK_Book_rating]
GO
USE [master]
GO
ALTER DATABASE [AtlasBooks] SET  READ_WRITE 
GO
