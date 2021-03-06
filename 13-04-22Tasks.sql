USE [master]
GO
/****** Object:  Database [Pasha]    Script Date: 14.04.2022 3:56:04 ******/
CREATE DATABASE [Pasha] ON  PRIMARY 
( NAME = N'Pasha', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\Pasha.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Pasha_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\Pasha_log.LDF' , SIZE = 576KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Pasha] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Pasha].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Pasha] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Pasha] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Pasha] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Pasha] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Pasha] SET ARITHABORT OFF 
GO
ALTER DATABASE [Pasha] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Pasha] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Pasha] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Pasha] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Pasha] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Pasha] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Pasha] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Pasha] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Pasha] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Pasha] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Pasha] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Pasha] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Pasha] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Pasha] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Pasha] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Pasha] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Pasha] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Pasha] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Pasha] SET  MULTI_USER 
GO
ALTER DATABASE [Pasha] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Pasha] SET DB_CHAINING OFF 
GO
USE [Pasha]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 14.04.2022 3:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[EmployeCoun] [int] NOT NULL,
	[DirectorId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Directors]    Script Date: 14.04.2022 3:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Directors](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](20) NULL,
	[Surname] [nvarchar](30) NULL,
	[Position] [nvarchar](100) NULL,
	[Salary] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 14.04.2022 3:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Surname] [nvarchar](30) NULL,
	[Position] [nvarchar](100) NULL,
	[Salary] [int] NULL,
	[DepartmentId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Departments] ([Id], [Name], [EmployeCoun], [DirectorId]) VALUES (1, N'Muhasibat', 10, 1)
INSERT [dbo].[Departments] ([Id], [Name], [EmployeCoun], [DirectorId]) VALUES (2, N'Kadr', 5, 2)
INSERT [dbo].[Departments] ([Id], [Name], [EmployeCoun], [DirectorId]) VALUES (3, N'Inzibati', 20, 3)
GO
INSERT [dbo].[Directors] ([Id], [Name], [Surname], [Position], [Salary]) VALUES (1, N'Taleh', N'Babayev', N'MuhasibatMuduru', 1200)
INSERT [dbo].[Directors] ([Id], [Name], [Surname], [Position], [Salary]) VALUES (2, N'Saleh', N'Shukurov', N'KadrMuduru', 1500)
INSERT [dbo].[Directors] ([Id], [Name], [Surname], [Position], [Salary]) VALUES (3, N'Valeh', N'Atakishiyev', N'InzibatiMuduru', 1000)
GO
INSERT [dbo].[Employees] ([Id], [Name], [Surname], [Position], [Salary], [DepartmentId]) VALUES (1, N'Ibrahim', N'Seyfullayev', N'Muhasibat', 300, 1)
INSERT [dbo].[Employees] ([Id], [Name], [Surname], [Position], [Salary], [DepartmentId]) VALUES (2, N'Elvin', N'Feteliyev', N'Muhasibat', 500, 2)
INSERT [dbo].[Employees] ([Id], [Name], [Surname], [Position], [Salary], [DepartmentId]) VALUES (3, N'Tamerlan', N'Bayramov', N'Kadr', 400, 3)
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD FOREIGN KEY([DirectorId])
REFERENCES [dbo].[Directors] ([Id])
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
USE [master]
GO
ALTER DATABASE [Pasha] SET  READ_WRITE 
GO
