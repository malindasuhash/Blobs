﻿-- Database
USE [master]
GO

/****** Object:  Database [BlobReader]    Script Date: 24/03/2013 17:36:53 ******/
CREATE DATABASE [BlobReader]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BlobReader', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\BlobReader.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BlobReader_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\BlobReader_log.ldf' , SIZE = 6912KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [BlobReader] SET COMPATIBILITY_LEVEL = 110
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BlobReader].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [BlobReader] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [BlobReader] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [BlobReader] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [BlobReader] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [BlobReader] SET ARITHABORT OFF 
GO

ALTER DATABASE [BlobReader] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [BlobReader] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [BlobReader] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [BlobReader] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [BlobReader] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [BlobReader] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [BlobReader] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [BlobReader] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [BlobReader] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [BlobReader] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [BlobReader] SET  DISABLE_BROKER 
GO

ALTER DATABASE [BlobReader] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [BlobReader] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [BlobReader] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [BlobReader] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [BlobReader] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [BlobReader] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [BlobReader] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [BlobReader] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [BlobReader] SET  MULTI_USER 
GO

ALTER DATABASE [BlobReader] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [BlobReader] SET DB_CHAINING OFF 
GO

ALTER DATABASE [BlobReader] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [BlobReader] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [BlobReader] SET  READ_WRITE 
GO




-- Table
USE [BlobReader]
GO

/****** Object:  Table [dbo].[Blob]    Script Date: 24/03/2013 17:36:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Blob](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[Payload] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_Blob] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


