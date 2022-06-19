USE [master]
GO
/****** Object:  Database [Manage Grade System]    Script Date: 6/20/2022 12:16:02 AM ******/
CREATE DATABASE [Manage Grade System]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Manage Grade System', FILENAME = N'D:\SQL2019\MSSQL15.SQLEXPRESS\MSSQL\DATA\Manage Grade System.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Manage Grade System_log', FILENAME = N'D:\SQL2019\MSSQL15.SQLEXPRESS\MSSQL\DATA\Manage Grade System_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Manage Grade System] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Manage Grade System].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Manage Grade System] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Manage Grade System] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Manage Grade System] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Manage Grade System] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Manage Grade System] SET ARITHABORT OFF 
GO
ALTER DATABASE [Manage Grade System] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Manage Grade System] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Manage Grade System] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Manage Grade System] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Manage Grade System] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Manage Grade System] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Manage Grade System] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Manage Grade System] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Manage Grade System] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Manage Grade System] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Manage Grade System] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Manage Grade System] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Manage Grade System] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Manage Grade System] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Manage Grade System] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Manage Grade System] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Manage Grade System] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Manage Grade System] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Manage Grade System] SET  MULTI_USER 
GO
ALTER DATABASE [Manage Grade System] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Manage Grade System] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Manage Grade System] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Manage Grade System] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Manage Grade System] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Manage Grade System] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Manage Grade System] SET QUERY_STORE = OFF
GO
USE [Manage Grade System]
GO
/****** Object:  Table [dbo].[Assesment]    Script Date: 6/20/2022 12:16:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assesment](
	[Asses.ID] [char](10) NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
	[Part] [int] NOT NULL,
	[Weight] [decimal](5, 2) NOT NULL,
	[Completion Criteria] [smallint] NOT NULL,
	[Duration] [nvarchar](50) NOT NULL,
	[No Question] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Assesment_Subject]    Script Date: 6/20/2022 12:16:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assesment_Subject](
	[Sub.ID] [char](10) NOT NULL,
	[Ass.ID] [char](10) NOT NULL,
 CONSTRAINT [PK_Assesment_Subject] PRIMARY KEY CLUSTERED 
(
	[Sub.ID] ASC,
	[Ass.ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grade]    Script Date: 6/20/2022 12:16:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grade](
	[Gra.ID] [char](10) NOT NULL,
	[Stu.ID] [char](10) NOT NULL,
	[Asses.ID] [char](10) NOT NULL,
	[Sub.ID] [char](10) NOT NULL,
	[Lec.ID] [char](10) NOT NULL,
	[Mark] [smallint] NOT NULL,
 CONSTRAINT [PK_Grade] PRIMARY KEY CLUSTERED 
(
	[Gra.ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 6/20/2022 12:16:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[G.ID] [char](10) NOT NULL,
	[Sub.ID] [char](10) NOT NULL,
	[Lec.ID] [char](10) NOT NULL,
	[Sem.ID] [char](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group_Student]    Script Date: 6/20/2022 12:16:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group_Student](
	[Stu.ID] [char](10) NOT NULL,
	[G.ID] [char](10) NOT NULL,
 CONSTRAINT [PK_Group_Student] PRIMARY KEY CLUSTERED 
(
	[Stu.ID] ASC,
	[G.ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lecturer]    Script Date: 6/20/2022 12:16:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lecturer](
	[Lec.ID] [char](10) NOT NULL,
	[FName] [nvarchar](50) NOT NULL,
	[LName] [nvarchar](50) NULL,
	[Gender] [bit] NULL,
	[PhoneNumber] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Semester]    Script Date: 6/20/2022 12:16:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Semester](
	[Sem.ID] [nchar](10) NOT NULL,
	[SemesterName] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 6/20/2022 12:16:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Stu.ID] [char](10) NOT NULL,
	[FName] [nvarchar](50) NULL,
	[LName] [nvarchar](50) NOT NULL,
	[Major] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 6/20/2022 12:16:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[Sub.ID] [char](10) NOT NULL,
	[SubName] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Manage Grade System] SET  READ_WRITE 
GO
