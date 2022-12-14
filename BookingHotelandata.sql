USE [master]
GO
/****** Object:  Database [BookingHotel]    Script Date: 10/19/2021 9:40:44 PM ******/
CREATE DATABASE [BookingHotel]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookingHotel', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\BookingHotel.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookingHotel_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\BookingHotel_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BookingHotel] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookingHotel].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookingHotel] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookingHotel] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookingHotel] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookingHotel] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookingHotel] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookingHotel] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookingHotel] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookingHotel] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookingHotel] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookingHotel] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookingHotel] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookingHotel] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookingHotel] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookingHotel] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookingHotel] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BookingHotel] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookingHotel] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookingHotel] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookingHotel] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookingHotel] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookingHotel] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookingHotel] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookingHotel] SET RECOVERY FULL 
GO
ALTER DATABASE [BookingHotel] SET  MULTI_USER 
GO
ALTER DATABASE [BookingHotel] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookingHotel] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookingHotel] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookingHotel] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookingHotel] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BookingHotel', N'ON'
GO
ALTER DATABASE [BookingHotel] SET QUERY_STORE = OFF
GO
USE [BookingHotel]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [BookingHotel]
GO
/****** Object:  Table [dbo].[tblAccount]    Script Date: 10/19/2021 9:40:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAccount](
	[userId] [varchar](50) NOT NULL,
	[Password] [varchar](100) NULL,
	[RoleId] [int] NULL,
	[Status] [nvarchar](20) NULL,
 CONSTRAINT [PK__tblAccou__CB9A1CFF9A95CA60] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDiscount]    Script Date: 10/19/2021 9:40:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDiscount](
	[discountCode] [varchar](50) NOT NULL,
	[discountValue] [int] NULL,
	[existDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[discountCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFeedBack]    Script Date: 10/19/2021 9:40:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFeedBack](
	[roomNo] [int] NULL,
	[userId] [varchar](50) NULL,
	[value] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHotel]    Script Date: 10/19/2021 9:40:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHotel](
	[hotelId] [int] IDENTITY(0,1) NOT NULL,
	[hotelName] [nvarchar](50) NULL,
	[hotelAddress] [nvarchar](200) NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[hotelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 10/19/2021 9:40:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[orderId] [varchar](50) NOT NULL,
	[userId] [varchar](50) NULL,
	[orderDate] [date] NULL,
	[total] [float] NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 10/19/2021 9:40:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetails](
	[orderId] [varchar](50) NULL,
	[roomNo] [int] NULL,
	[hotelId] [int] NULL,
	[orderQuantity] [int] NULL,
	[night] [int] NULL,
	[checkIn] [nvarchar](50) NULL,
	[checkOut] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 10/19/2021 9:40:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRole](
	[RoleId] [int] NOT NULL,
	[RoleName] [varchar](50) NULL,
 CONSTRAINT [PK__tblRole__8AFACE1A279BF2DB] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoom]    Script Date: 10/19/2021 9:40:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoom](
	[hotelId] [int] NULL,
	[roomNo] [int] IDENTITY(0,1) NOT NULL,
	[roomName] [varchar](50) NULL,
	[availableDate] [date] NULL,
	[quantity] [int] NULL,
	[typeId] [varchar](10) NULL,
	[roomPrice] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[roomNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTypeRoom]    Script Date: 10/19/2021 9:40:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTypeRoom](
	[typeId] [varchar](10) NOT NULL,
	[typeName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[typeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 10/19/2021 9:40:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[userId] [varchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](200) NULL,
	[PhoneNumber] [varchar](12) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAccount]  WITH CHECK ADD  CONSTRAINT [FK__tblAccoun__RoleI__25869641] FOREIGN KEY([RoleId])
REFERENCES [dbo].[tblRole] ([RoleId])
GO
ALTER TABLE [dbo].[tblAccount] CHECK CONSTRAINT [FK__tblAccoun__RoleI__25869641]
GO
ALTER TABLE [dbo].[tblFeedBack]  WITH CHECK ADD FOREIGN KEY([roomNo])
REFERENCES [dbo].[tblRoom] ([roomNo])
GO
ALTER TABLE [dbo].[tblFeedBack]  WITH CHECK ADD  CONSTRAINT [FK__tblFeedBa__userI__31EC6D26] FOREIGN KEY([userId])
REFERENCES [dbo].[tblAccount] ([userId])
GO
ALTER TABLE [dbo].[tblFeedBack] CHECK CONSTRAINT [FK__tblFeedBa__userI__31EC6D26]
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK__tblOrder__userId__34C8D9D1] FOREIGN KEY([userId])
REFERENCES [dbo].[tblAccount] ([userId])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK__tblOrder__userId__34C8D9D1]
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD FOREIGN KEY([hotelId])
REFERENCES [dbo].[tblHotel] ([hotelId])
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD FOREIGN KEY([orderId])
REFERENCES [dbo].[tblOrder] ([orderId])
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD FOREIGN KEY([roomNo])
REFERENCES [dbo].[tblRoom] ([roomNo])
GO
ALTER TABLE [dbo].[tblRoom]  WITH CHECK ADD FOREIGN KEY([hotelId])
REFERENCES [dbo].[tblHotel] ([hotelId])
GO
ALTER TABLE [dbo].[tblRoom]  WITH CHECK ADD FOREIGN KEY([typeId])
REFERENCES [dbo].[tblTypeRoom] ([typeId])
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK__tblUser__userId__276EDEB3] FOREIGN KEY([userId])
REFERENCES [dbo].[tblAccount] ([userId])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK__tblUser__userId__276EDEB3]
GO
USE [master]
GO
ALTER DATABASE [BookingHotel] SET  READ_WRITE 
GO
