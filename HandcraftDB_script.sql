USE [master]
GO
/****** Object:  Database [HandcraftDB]    Script Date: 3/23/2021 10:10:14 AM ******/
CREATE DATABASE [HandcraftDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HandcraftDB', FILENAME = N'C:\Users\thaob\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\HandcraftDB_Primary.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HandcraftDB_log', FILENAME = N'C:\Users\thaob\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\HandcraftDB_Primary.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [HandcraftDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HandcraftDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HandcraftDB] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [HandcraftDB] SET ANSI_NULLS ON 
GO
ALTER DATABASE [HandcraftDB] SET ANSI_PADDING ON 
GO
ALTER DATABASE [HandcraftDB] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [HandcraftDB] SET ARITHABORT ON 
GO
ALTER DATABASE [HandcraftDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HandcraftDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HandcraftDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HandcraftDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HandcraftDB] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [HandcraftDB] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [HandcraftDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HandcraftDB] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [HandcraftDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HandcraftDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HandcraftDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HandcraftDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HandcraftDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HandcraftDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HandcraftDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HandcraftDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HandcraftDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HandcraftDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HandcraftDB] SET  MULTI_USER 
GO
ALTER DATABASE [HandcraftDB] SET PAGE_VERIFY NONE  
GO
ALTER DATABASE [HandcraftDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HandcraftDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HandcraftDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [HandcraftDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HandcraftDB] SET QUERY_STORE = OFF
GO
USE [HandcraftDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [HandcraftDB]
GO
/****** Object:  Table [dbo].[User]    Script Date: 3/23/2021 10:10:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[IdUser] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](64) NOT NULL,
	[LastName] [varchar](64) NOT NULL,
	[Email] [varchar](256) NOT NULL,
	[Phone] [varchar](16) NULL,
	[Login] [nvarchar](50) NULL,
	[Password] [nvarchar](600) NULL,
	[Salt] [nvarchar](250) NULL,
	[Picture] [varchar](256) NULL,
	[BirthDate] [date] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coordinator]    Script Date: 3/23/2021 10:10:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coordinator](
	[IdCoordinator] [int] NOT NULL,
	[PromotedDate] [date] NULL,
 CONSTRAINT [PK_Coordinator] PRIMARY KEY CLUSTERED 
(
	[IdCoordinator] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_FullCoordinator]    Script Date: 3/23/2021 10:10:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_FullCoordinator]
	AS 
SELECT 
    c.IdCoordinator,
    u.FirstName,
    u.LastName,
    u.Email,
    u.Phone,
    u.[Login],
    u.[Password],
    u.Salt,
    u.BirthDate,
    c.PromotedDate
FROM [User] AS u JOIN
	[Coordinator] AS c ON u.IdUser = c.IdCoordinator
GO
/****** Object:  Table [dbo].[Tutor]    Script Date: 3/23/2021 10:10:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tutor](
	[IdTutor] [int] NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[BankAccount] [varchar](32) NOT NULL,
	[TVANumber] [varchar](16) NULL,
	[Picture] [varchar](256) NOT NULL,
 CONSTRAINT [PK_Tutor] PRIMARY KEY CLUSTERED 
(
	[IdTutor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_FullTutor]    Script Date: 3/23/2021 10:10:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_FullTutor]
	AS 
SELECT 
    t.IdTutor,
    u.FirstName,
    u.LastName,
    u.Email,
    u.Phone,
    u.[Login],
    u.[Password],
    u.Salt,
    u.BirthDate,
    t.[Description],
    t.BankAccount,
    t.TVANumber,
    t.Picture
FROM [User] AS u JOIN
	[Tutor] AS t ON u.IdUser = t.IdTutor
GO
/****** Object:  Table [dbo].[Class]    Script Date: 3/23/2021 10:10:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[IdClass] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [varchar](64) NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[TrailerURL] [varchar](256) NULL,
	[Price] [money] NOT NULL,
	[Duration] [int] NOT NULL,
	[State] [varchar](32) NULL,
	[IdTutor] [int] NOT NULL,
	[IdCoordinator] [int] NOT NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[IdClass] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Workshop]    Script Date: 3/23/2021 10:10:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workshop](
	[IdWorkshop] [int] NOT NULL,
	[StudentMaxQty] [int] NULL,
	[IdStudio] [int] NOT NULL,
 CONSTRAINT [PK_Workshop] PRIMARY KEY CLUSTERED 
(
	[IdWorkshop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Calendar]    Script Date: 3/23/2021 10:10:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calendar](
	[IdCalendar] [int] IDENTITY(1,1) NOT NULL,
	[Weekday] [varchar](16) NULL,
	[Date] [date] NOT NULL,
	[TimeStart] [varchar](16) NOT NULL,
	[TimeEnd] [varchar](16) NOT NULL,
 CONSTRAINT [PK_Calendar] PRIMARY KEY CLUSTERED 
(
	[IdCalendar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CalendarWorkshop]    Script Date: 3/23/2021 10:10:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CalendarWorkshop](
	[IdCalendar] [int] NOT NULL,
	[IdWorkshop] [int] NOT NULL,
 CONSTRAINT [PK_CalendarWorkshop] PRIMARY KEY CLUSTERED 
(
	[IdCalendar] ASC,
	[IdWorkshop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_Workshop_Calendar]    Script Date: 3/23/2021 10:10:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_Workshop_Calendar]
	AS 
SELECT
    w.IdWorkshop,
    c.IdCalendar,
    c.[Date],
    c.TimeStart,
    c.TimeEnd 
FROM [Workshop] AS w JOIN
[CalendarWorkshop] AS cw ON w.IdWorkshop = cw.IdWorkshop JOIN
[Calendar] AS c ON c.IdCalendar= cw.IdCalendar
GO
/****** Object:  Table [dbo].[Studio]    Script Date: 3/23/2021 10:10:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Studio](
	[IdStudio] [int] IDENTITY(1,1) NOT NULL,
	[StudioName] [varchar](256) NOT NULL,
	[Description] [varchar](max) NULL,
	[Picture] [varchar](256) NULL,
	[Number] [varchar](8) NOT NULL,
	[Street] [varchar](128) NOT NULL,
	[City] [varchar](32) NOT NULL,
	[Country] [varchar](32) NOT NULL,
 CONSTRAINT [PK_Studio] PRIMARY KEY CLUSTERED 
(
	[IdStudio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_Workshop_Studio]    Script Date: 3/23/2021 10:10:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_Workshop_Studio]
	AS 
SELECT
    w.IdWorkshop,
    s.StudioName,
    s.Picture,
    s.Number,
    s.Street,
    s.City,
    s.Country
FROM [Workshop] AS w JOIN
[Studio] AS s ON w.IdStudio = s.IdStudio
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/23/2021 10:10:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[IdCategory] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](64) NOT NULL,
	[Link] [varchar](64) NOT NULL,
	[Picture] [varchar](256) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[IdCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClassCategory]    Script Date: 3/23/2021 10:10:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassCategory](
	[IdClass] [int] NOT NULL,
	[IdCategory] [int] NOT NULL,
 CONSTRAINT [PK_ClassCategory] PRIMARY KEY CLUSTERED 
(
	[IdClass] ASC,
	[IdCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_Class_Category]    Script Date: 3/23/2021 10:10:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_Class_Category]
	AS 
SELECT
    c.IdClass,
	cg.[Name] AS CategoryName
FROM [Class] AS c JOIN
[ClassCategory] AS cc ON c.IdClass = cc.IdClass JOIN 
[Category] AS cg ON cg.IdCategory = cc.IdCategory
GO
/****** Object:  Table [dbo].[ClassPicture]    Script Date: 3/23/2021 10:10:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassPicture](
	[IdClass] [int] NOT NULL,
	[ThumbnailFront] [varchar](256) NOT NULL,
	[ThumbnailBack] [varchar](256) NOT NULL,
	[ThumbnailDetail1] [varchar](256) NULL,
	[ThumbnailDetail2] [varchar](256) NULL,
	[ThumbnailDetail3] [varchar](256) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_FullClass]    Script Date: 3/23/2021 10:10:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_FullClass]
	AS 
SELECT
    c.IdClass,
    c.ClassName,
    c.[Description],
    c.TrailerURL,
    c.Price,
    c.Duration,
    c.[State],
    vt.FirstName AS FirstNameTutor,
    vt.LastName AS LastNameTutor,
    vc.FirstName AS FirstNameCoordinator,
    vc.LastName AS LastNameCoordinator,
    cp.ThumbnailFront,
    cp.ThumbnailBack,
    vws.StudioName,
    vws.Number,
    vws.Street,
    vws.City,
    vws.Country,
    vwc.[Date],
    vwc.TimeStart,
    vwc.TimeEnd,
    vcc.CategoryName
FROM [Class] AS c JOIN
[ClassPicture] AS cp ON c.IdClass = cp.IdClass JOIN
[V_FullTutor] AS vt ON vt.IdTutor = c.IdTutor JOIN
[V_FullCoordinator] AS vc ON vc.IdCoordinator = c.IdCoordinator JOIN
[V_Workshop_Studio] AS vws ON vws.IdWorkshop = c.IdClass JOIN
[V_Workshop_Calendar] AS vwc ON vwc.IdWorkshop = c.IdClass JOIN
[V_Class_Category] AS vcc ON vcc.IdClass = c.IdClass
GO
/****** Object:  View [dbo].[V_SimpleClass]    Script Date: 3/23/2021 10:10:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_SimpleClass]
	AS 
SELECT
    c.IdClass,
    c.ClassName,
    c.Price,
    vwc.[Date],
    cp.ThumbnailFront,
    cp.ThumbnailBack,
    vcc.CategoryName
FROM [Class] AS c JOIN
[ClassPicture] AS cp ON c.IdClass = cp.IdClass JOIN
[V_Workshop_Calendar] AS vwc ON vwc.IdWorkshop = c.IdClass JOIN
[V_Class_Category] AS vcc ON vcc.IdClass = c.IdClass
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 3/23/2021 10:10:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[IdAdmin] [int] NOT NULL,
	[PromotedDate] [date] NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[IdAdmin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cancel]    Script Date: 3/23/2021 10:10:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cancel](
	[IdCancel] [int] NOT NULL,
	[IdUser] [int] NOT NULL,
	[IdClass] [int] NOT NULL,
	[CancelDate] [date] NOT NULL,
 CONSTRAINT [PK_Cancel] PRIMARY KEY CLUSTERED 
(
	[IdCancel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 3/23/2021 10:10:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[IdComment] [int] IDENTITY(1,1) NOT NULL,
	[IdUser] [int] NOT NULL,
	[IdClass] [int] NOT NULL,
	[Content] [varchar](max) NOT NULL,
	[CommentDate] [date] NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[IdComment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactMessage]    Script Date: 3/23/2021 10:10:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactMessage](
	[IdContactMessage] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[Subject] [nvarchar](256) NOT NULL,
	[MessageContent] [nvarchar](max) NOT NULL,
	[SendDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ContactMessage] PRIMARY KEY CLUSTERED 
(
	[IdContactMessage] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OnlineClass]    Script Date: 3/23/2021 10:10:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OnlineClass](
	[IdOnlineClass] [int] NOT NULL,
	[FullDescription] [varchar](max) NOT NULL,
	[FullVideoURL] [varchar](256) NOT NULL,
	[FullPicture] [varchar](256) NOT NULL,
 CONSTRAINT [PK_OnlineClass] PRIMARY KEY CLUSTERED 
(
	[IdOnlineClass] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 3/23/2021 10:10:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[IdUser] [int] NOT NULL,
	[IdClass] [int] NOT NULL,
	[Score] [int] NOT NULL,
	[RatingDate] [date] NOT NULL,
 CONSTRAINT [PK_Rating] PRIMARY KEY CLUSTERED 
(
	[IdUser] ASC,
	[IdClass] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registration]    Script Date: 3/23/2021 10:10:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registration](
	[IdRegistration] [int] IDENTITY(1,1) NOT NULL,
	[IdUser] [int] NOT NULL,
	[IdClass] [int] NOT NULL,
	[RegistrationDate] [date] NOT NULL,
 CONSTRAINT [PK_Registration] PRIMARY KEY CLUSTERED 
(
	[IdRegistration] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 3/23/2021 10:10:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[IdStudent] [int] NOT NULL,
	[MemberDate] [date] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[IdStudent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebAppOwner]    Script Date: 3/23/2021 10:10:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebAppOwner](
	[CompanyName] [varchar](32) NOT NULL,
	[TVANumber] [varchar](16) NOT NULL,
	[BankAccount] [varchar](16) NOT NULL,
	[Email] [varchar](64) NOT NULL,
	[Phone] [varchar](16) NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Calendar] ON 

INSERT [dbo].[Calendar] ([IdCalendar], [Weekday], [Date], [TimeStart], [TimeEnd]) VALUES (1, NULL, CAST(N'2021-06-12' AS Date), N'9h00', N'17h00')
INSERT [dbo].[Calendar] ([IdCalendar], [Weekday], [Date], [TimeStart], [TimeEnd]) VALUES (2, NULL, CAST(N'2021-08-10' AS Date), N'9h00', N'15h00')
INSERT [dbo].[Calendar] ([IdCalendar], [Weekday], [Date], [TimeStart], [TimeEnd]) VALUES (3, NULL, CAST(N'2021-09-10' AS Date), N'8h30', N'20h00')
INSERT [dbo].[Calendar] ([IdCalendar], [Weekday], [Date], [TimeStart], [TimeEnd]) VALUES (4, NULL, CAST(N'2021-10-10' AS Date), N'10h00', N'16h00')
INSERT [dbo].[Calendar] ([IdCalendar], [Weekday], [Date], [TimeStart], [TimeEnd]) VALUES (5, NULL, CAST(N'2021-11-08' AS Date), N'8h30', N'18h00')
INSERT [dbo].[Calendar] ([IdCalendar], [Weekday], [Date], [TimeStart], [TimeEnd]) VALUES (7, NULL, CAST(N'2021-07-14' AS Date), N'8h30', N'17h30')
INSERT [dbo].[Calendar] ([IdCalendar], [Weekday], [Date], [TimeStart], [TimeEnd]) VALUES (8, NULL, CAST(N'2021-09-15' AS Date), N'9h30', N'17h00')
INSERT [dbo].[Calendar] ([IdCalendar], [Weekday], [Date], [TimeStart], [TimeEnd]) VALUES (9, NULL, CAST(N'2021-12-22' AS Date), N'10h00', N'16h00')
INSERT [dbo].[Calendar] ([IdCalendar], [Weekday], [Date], [TimeStart], [TimeEnd]) VALUES (10, NULL, CAST(N'2021-11-12' AS Date), N'10h00', N'16h00')
INSERT [dbo].[Calendar] ([IdCalendar], [Weekday], [Date], [TimeStart], [TimeEnd]) VALUES (11, NULL, CAST(N'2021-08-19' AS Date), N'8h30', N'12h00')
INSERT [dbo].[Calendar] ([IdCalendar], [Weekday], [Date], [TimeStart], [TimeEnd]) VALUES (12, NULL, CAST(N'2021-05-20' AS Date), N'13h00', N'17h30')
INSERT [dbo].[Calendar] ([IdCalendar], [Weekday], [Date], [TimeStart], [TimeEnd]) VALUES (13, NULL, CAST(N'2021-08-23' AS Date), N'10h00', N'15h00')
INSERT [dbo].[Calendar] ([IdCalendar], [Weekday], [Date], [TimeStart], [TimeEnd]) VALUES (14, NULL, CAST(N'2021-12-30' AS Date), N'9h00', N'16h00')
INSERT [dbo].[Calendar] ([IdCalendar], [Weekday], [Date], [TimeStart], [TimeEnd]) VALUES (15, NULL, CAST(N'2021-10-23' AS Date), N'9h00', N'17h00')
SET IDENTITY_INSERT [dbo].[Calendar] OFF
GO
INSERT [dbo].[CalendarWorkshop] ([IdCalendar], [IdWorkshop]) VALUES (1, 14)
INSERT [dbo].[CalendarWorkshop] ([IdCalendar], [IdWorkshop]) VALUES (1, 16)
INSERT [dbo].[CalendarWorkshop] ([IdCalendar], [IdWorkshop]) VALUES (1, 18)
INSERT [dbo].[CalendarWorkshop] ([IdCalendar], [IdWorkshop]) VALUES (2, 23)
INSERT [dbo].[CalendarWorkshop] ([IdCalendar], [IdWorkshop]) VALUES (2, 24)
INSERT [dbo].[CalendarWorkshop] ([IdCalendar], [IdWorkshop]) VALUES (2, 1005)
INSERT [dbo].[CalendarWorkshop] ([IdCalendar], [IdWorkshop]) VALUES (3, 1011)
INSERT [dbo].[CalendarWorkshop] ([IdCalendar], [IdWorkshop]) VALUES (3, 1013)
INSERT [dbo].[CalendarWorkshop] ([IdCalendar], [IdWorkshop]) VALUES (4, 1012)
INSERT [dbo].[CalendarWorkshop] ([IdCalendar], [IdWorkshop]) VALUES (4, 1014)
INSERT [dbo].[CalendarWorkshop] ([IdCalendar], [IdWorkshop]) VALUES (4, 1016)
INSERT [dbo].[CalendarWorkshop] ([IdCalendar], [IdWorkshop]) VALUES (5, 1015)
INSERT [dbo].[CalendarWorkshop] ([IdCalendar], [IdWorkshop]) VALUES (5, 1025)
INSERT [dbo].[CalendarWorkshop] ([IdCalendar], [IdWorkshop]) VALUES (7, 19)
INSERT [dbo].[CalendarWorkshop] ([IdCalendar], [IdWorkshop]) VALUES (7, 21)
INSERT [dbo].[CalendarWorkshop] ([IdCalendar], [IdWorkshop]) VALUES (8, 1008)
INSERT [dbo].[CalendarWorkshop] ([IdCalendar], [IdWorkshop]) VALUES (8, 1010)
INSERT [dbo].[CalendarWorkshop] ([IdCalendar], [IdWorkshop]) VALUES (8, 1024)
INSERT [dbo].[CalendarWorkshop] ([IdCalendar], [IdWorkshop]) VALUES (9, 1006)
INSERT [dbo].[CalendarWorkshop] ([IdCalendar], [IdWorkshop]) VALUES (9, 1017)
INSERT [dbo].[CalendarWorkshop] ([IdCalendar], [IdWorkshop]) VALUES (10, 1018)
INSERT [dbo].[CalendarWorkshop] ([IdCalendar], [IdWorkshop]) VALUES (11, 1019)
INSERT [dbo].[CalendarWorkshop] ([IdCalendar], [IdWorkshop]) VALUES (11, 1020)
INSERT [dbo].[CalendarWorkshop] ([IdCalendar], [IdWorkshop]) VALUES (12, 10)
INSERT [dbo].[CalendarWorkshop] ([IdCalendar], [IdWorkshop]) VALUES (13, 1021)
INSERT [dbo].[CalendarWorkshop] ([IdCalendar], [IdWorkshop]) VALUES (14, 1009)
INSERT [dbo].[CalendarWorkshop] ([IdCalendar], [IdWorkshop]) VALUES (14, 1022)
INSERT [dbo].[CalendarWorkshop] ([IdCalendar], [IdWorkshop]) VALUES (15, 1007)
INSERT [dbo].[CalendarWorkshop] ([IdCalendar], [IdWorkshop]) VALUES (15, 1023)
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([IdCategory], [Name], [Link], [Picture]) VALUES (2, N'Knitting & Sewing', N'#', N'../images/Category/category1.jpg')
INSERT [dbo].[Category] ([IdCategory], [Name], [Link], [Picture]) VALUES (5, N'Paper Flowers', N'#', N'../images/Category/category2.jpg')
INSERT [dbo].[Category] ([IdCategory], [Name], [Link], [Picture]) VALUES (6, N'Calligraphy', N'#', N'../images/Category/category3.jpg')
INSERT [dbo].[Category] ([IdCategory], [Name], [Link], [Picture]) VALUES (7, N'Watercolor', N'#', N'../images/Category/category4.jpg')
INSERT [dbo].[Category] ([IdCategory], [Name], [Link], [Picture]) VALUES (8, N'Stickers', N'#', N'../images/Category/category5.jpg')
INSERT [dbo].[Category] ([IdCategory], [Name], [Link], [Picture]) VALUES (9, N'Flower Arranging', N'#', N'../images/Category/category6.jpg')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Class] ON 

INSERT [dbo].[Class] ([IdClass], [ClassName], [Description], [TrailerURL], [Price], [Duration], [State], [IdTutor], [IdCoordinator]) VALUES (10, N'Bullet Journal', N'Learn the Pro''s and the Con''s to getting started with Bullet Journaling. Not all people require technology to be productive. In fact, some do better with fewer distractions and a good old pen & paper. This course aims to help you avoid common journal-setup mistakes. You will be guided through the process of understanding what you need in a journal and how to create it. Course content is all designed by 10+ year "journaler," Samantha Kristoferson of KW Professional Organizers.', N'https://www.youtube.com/embed/h7qM3L3FkN8', 80.5000, 5, N'Coming soon', 3, 2)
INSERT [dbo].[Class] ([IdClass], [ClassName], [Description], [TrailerURL], [Price], [Duration], [State], [IdTutor], [IdCoordinator]) VALUES (14, N'Christmas Wreath', N' If you also can''t help yourself from going all out with your holiday décor and DIY Christmas decorations, you''ll be obsessed with these festive wreaths. And because you''ll be making them with your own two hands, they''ll definitely capture those “little hints of Christmas” that Ree''s talking about.', N'https://www.youtube.com/embed/h7qM3L3FkN8', 15.2500, 2, N'Available', 3, 2)
INSERT [dbo].[Class] ([IdClass], [ClassName], [Description], [TrailerURL], [Price], [Duration], [State], [IdTutor], [IdCoordinator]) VALUES (16, N'Handmade Stickers', N'Are you looking for a new craft project? Try making some stickers! Stickers are easy to make using materials you probably already have around the house; you can also make professional-looking stickers by using sticker paper, which is available at many office supply and craft stores. Learn how to make stickers in three different ways: using homemade glue, packing tape, or sticker paper. Keep going you’re gonna do really well :)', N'https://www.youtube.com/embed/aTkCLROKqKQ', 69.7500, 6, N'Available', 3, 2)
INSERT [dbo].[Class] ([IdClass], [ClassName], [Description], [TrailerURL], [Price], [Duration], [State], [IdTutor], [IdCoordinator]) VALUES (18, N'Japanese Watercolor Painting', N'These watercolor tutorials and video lessons will get you started and inspire you to be a better watercolor painter. Let them guide your vision, which is unique for everyone. Over time as you find your path, you’ll find your focus as a watercolor artist, which may be inspired by these lessons and painting techniques. Don’t forget to have fun!', N'https://www.youtube.com/embed/aTkCLROKqKQ', 32.8500, 8, N'Available', 4, 2)
INSERT [dbo].[Class] ([IdClass], [ClassName], [Description], [TrailerURL], [Price], [Duration], [State], [IdTutor], [IdCoordinator]) VALUES (19, N'Crepe Paper Dahlia', N' Using various weights of crepe paper from Germany, Italy, and China, she often takes the extra step of dying or painting the paper to achieve the ideal colour, texture, and depth for each and every paper flower. She also use non-paper materials when the design calls for them.', N'https://www.youtube.com/embed/aTkCLROKqKQ', 32.8500, 14, N'Available', 3, 2)
INSERT [dbo].[Class] ([IdClass], [ClassName], [Description], [TrailerURL], [Price], [Duration], [State], [IdTutor], [IdCoordinator]) VALUES (21, N'Babysuit Knitting', N'Are you looking for a new craft project? Try making some stickers! Stickers are easy to make using materials you probably already have around the house; you can also make professional-looking stickers by using sticker paper, which is available at many office supply and craft stores. Learn how to make stickers in three different ways: using homemade glue, packing tape, or sticker paper. Keep going you’re gonna do really well :)', N'https://www.youtube.com/embed/h7qM3L3FkN8', 20.5500, 5, N'Coming soon', 4, 2)
INSERT [dbo].[Class] ([IdClass], [ClassName], [Description], [TrailerURL], [Price], [Duration], [State], [IdTutor], [IdCoordinator]) VALUES (23, N'Flower Arrangement', N' Using various weights of crepe paper from Germany, Italy, and China, she often takes the extra step of dying or painting the paper to achieve the ideal colour, texture, and depth for each and every paper flower. She also use non-paper materials when the design calls for them.', N'https://www.youtube.com/embed/h7qM3L3FkN8', 79.3000, 4, N'Available', 4, 2)
INSERT [dbo].[Class] ([IdClass], [ClassName], [Description], [TrailerURL], [Price], [Duration], [State], [IdTutor], [IdCoordinator]) VALUES (24, N'Paper Tulip', N' Using various weights of crepe paper from Germany, Italy, and China, she often takes the extra step of dying or painting the paper to achieve the ideal colour, texture, and depth for each and every paper flower. She also use non-paper materials when the design calls for them.', N'https://www.youtube.com/embed/aTkCLROKqKQ', 30.4500, 3, N'Available', 3, 2)
INSERT [dbo].[Class] ([IdClass], [ClassName], [Description], [TrailerURL], [Price], [Duration], [State], [IdTutor], [IdCoordinator]) VALUES (1005, N'Advanced Bullet Journal', N'Learn the Pro''s and the Con''s to getting started with Bullet Journaling. Not all people require technology to be productive. In fact, some do better with fewer distractions and a good old pen & paper. This course aims to help you avoid common journal-setup mistakes. You will be guided through the process of understanding what you need in a journal and how to create it. Course content is all designed by 10+ year "journaler," Samantha Kristoferson of KW Professional Organizers.', N'#', 50.5000, 8, N'#', 1, 5)
INSERT [dbo].[Class] ([IdClass], [ClassName], [Description], [TrailerURL], [Price], [Duration], [State], [IdTutor], [IdCoordinator]) VALUES (1006, N'Paper Grape Hyacinth Flower', N' Using various weights of crepe paper from Germany, Italy, and China, she often takes the extra step of dying or painting the paper to achieve the ideal colour, texture, and depth for each and every paper flower. She also use non-paper materials when the design calls for them.', NULL, 30.3000, 8, NULL, 1, 5)
INSERT [dbo].[Class] ([IdClass], [ClassName], [Description], [TrailerURL], [Price], [Duration], [State], [IdTutor], [IdCoordinator]) VALUES (1007, N'Watercolor cartoon  Painting', N'Welcome to the class! :)

Watercolor is a loose and unpredictable medium, which can make it daunting for most people to pick up a brush and try. The truth is the basics are very simple to learn and just take practice to master. There is a lot that can be controlled with practice, and the rest (happy accidents) is what makes it so interesting. In this course you will learn about the personality of watercolor and the simple techniques needed to paint with confidence. I will go into detail about everything you need to get started on your never-ending journey of discovery, from:

What Supplies to Get 
6 Different Wash Techniques
How to Layer
How to Blend
The Water and Paint Dynamic
Working Light to Dark
Masking Fluid
Adding White With Other Media 
Salt Technique
Alcohol Resist Technique
Other Tips and Tricks
By the end of the class you will have the skills necessary to create enchanting watercolor pieces that you can sell, frame, use in your illustration portfolio, or gift to a loved one. I share all the techniques I accumulated over the years, so every watercolor enthusiast can learn something, but beginners will benefit the most. So, no more excuses! It''s about time you start to dabble in the art of watercolor magic!', NULL, 45.8000, 8, NULL, 4, 2)
INSERT [dbo].[Class] ([IdClass], [ClassName], [Description], [TrailerURL], [Price], [Duration], [State], [IdTutor], [IdCoordinator]) VALUES (1008, N'Crepe Paper Flowers - Cheerful Sunflowers', N'About This Class
Join Eileen in crafting beautiful and vibrant Sunflowers from Italian 180gsm Crepe Paper. Not only will these be handmade by you, but they''ll last a lifetime and will never wilt! Designed for beginners, this class is a great introduction to fundamental crepe paper flower-making techniques.

Tools & Materials - What you''ll need

180gsm Crepe Paper from Cartotecnica Rossi
Crepe Paper Colours are yellow (code 576), light green (code 562), dark brown (code 568), light brown (code 567) and black (code 602)
Florist Wire: Wrapped #18 and #20
Scissors
Mini Hot Glue Gun + Glue Sticks
Wire cutters
Templates - provided in a pdf for you!', NULL, 35.8000, 8, NULL, 1, 5)
INSERT [dbo].[Class] ([IdClass], [ClassName], [Description], [TrailerURL], [Price], [Duration], [State], [IdTutor], [IdCoordinator]) VALUES (1009, N'Watercolor Painting: Leaves', N'Autumn is such a lovely time of year. It''s a joy to wander around nature and experience it slowly bursting into color. And of course, collect beautiful leaves! Which is just what we need for our paintings.

This class features:

3 separate projects, each with a different kind of leaf
supplies needed
step by step instructions, from sketch to finished painting
different watercolor painting techniques. ou don''t need a lot of experience because this class is suitable for all levels.

And, whether you decide to keep your artworks for yourself, or gift them to your loved ones, the joy of creating something beautiful will always stay with you.

So, come on, grab your paintbrush and let''s get started!', NULL, 20.6000, 8, NULL, 1, 5)
INSERT [dbo].[Class] ([IdClass], [ClassName], [Description], [TrailerURL], [Price], [Duration], [State], [IdTutor], [IdCoordinator]) VALUES (1010, N'Modern Flowers: Arranging', N'About This Class
Flowers are an essential in many homes these days, and there''s an endless opportunity for creativity and beauty in their presentation. What flowers do you select? How do you mix them together to make an arrangement work? How can you transform simple beauty into exquisite beauty?

Join the floral design duo Putnam & Putnam for a beautiful, tactical class on making a beautiful flower arrangement. You''ll join the team in their floral design studio in Bushwick, Brooklyn and follow them through the process of selecting flowers, preparing the vessel, and arranging the flowers — all starting with a color in mind and playing off one single flower.

This class is perfect for the budding florist and even the flower admirer looking for more tricks — both technical and conceptual — on making their arrangements functional, ethereal, and long-lasting. Take this class to get inspired, connect with floral beauty, and bring your own creativity to nature.', NULL, 105.6000, 8, NULL, 4, 2)
INSERT [dbo].[Class] ([IdClass], [ClassName], [Description], [TrailerURL], [Price], [Duration], [State], [IdTutor], [IdCoordinator]) VALUES (1011, N'Ultimate Sticker Making Guide', N'Handmade stickers are one of a kind masterpieces with low cost and priceless personal touch. This video series walks you through the sticker making process from start to finish. You will learn all the tools of the trade: sketching on paper, transferring the sketch to sticker paper, inking the drawing, adding color to the drawing, cutting out the sticker, and some other tips and tricks to take the sticker making process to the next level!', NULL, 23.9000, 8, NULL, 3, 5)
INSERT [dbo].[Class] ([IdClass], [ClassName], [Description], [TrailerURL], [Price], [Duration], [State], [IdTutor], [IdCoordinator]) VALUES (1012, N'Introduction to Modern Script Calligraphy', N'Curious about calligraphy? Join Paperfinger founder Bryn Chernoff for a warm and inviting introductory class on the tools, techniques, and best practices to transform your handwriting into beautiful calligraphy script!

Always welcoming and encouraging, Bryn covers all the details aspiring calligraphers need to get started. From materials and setting up a workspace to basic shapes, line widths, movement, and connecting individual letters, this class is a comprehensive and thoroughly enjoyable guide.

Plus, with 7 Skillshare-exclusive practice pages, a guide for straight lines, and countless inspiration photos, there’s no clearer introduction to the world of nibs, ink, and beautiful writing.

By the end, you''ll write a meaningful name, quotation, or passage in a simple calligraphy script. This enjoyable project is a perfect way to spend time with words you love, grow your calligraphy skills, and practice making artistic decisions in pursuit of beautiful handwriting.

______________

Class Outline

Introduction. Writing in calligraphy script is a timeless art that imbues even the simplest writing with an air of sophistication. This course by celebrated calligrapher Bryn Chernoff can help you learn calligraphy at your own pace and create beautiful works of typographic art with little more than ink and paper. She will also provide you with links to download handy worksheets that can help you develop your style and technique.
Warm Up. Dive right in on scraps of paper with a few exercises designed to help you relax, as well as teach you about how to approach lettering art. You’ll learn how to express emotions, not just through the words themselves, but also through the shape those words take. Different lettering styles can evoke different reactions in the reader, such as “whimsical,” “rustic,” or “shy,” and Bryn demonstrates her own techniques for finding the right form for your project.
Welcome! Bryn talks a little bit about her background, her love of calligraphy, and why she chose to pursue this career after studying computer science.', N'https://www.youtube.com/embed/h7qM3L3FkN8', 30.7000, 8, NULL, 3, 5)
INSERT [dbo].[Class] ([IdClass], [ClassName], [Description], [TrailerURL], [Price], [Duration], [State], [IdTutor], [IdCoordinator]) VALUES (1013, N'Learn to Paint Magical Watercolor', N'This class is perfect for anyone who likes to begin his/her journey in watercolor and also for those who know the basics but want to experiment more. Watercolor might seem challenging, especially for those who come from other mediums like acrylics and oils. But, it just takes a little bit of practice and proper materials. That''s it!

In the class,

I start off with the supplies you''ll need and I''ll explain what kind of paper and paints are good for beginners.
Then I''ll be teaching you how to draw the butterflies from scratch.
After that, we will do a quick and fun project using wet in wet technique.
At last, I will be teaching you to paint two realistic and magical butterflies.
When you''re done watching the class, you''ll be able to able to paint your own colorful butterflies. This is absolutely a fun and relaxing class!

Materials:

100% Cotton Watercolor Paper (I have used papers from Art Essentials)
Paints [I used Mijello Mission Gold Watercolor set of 24]
Watercolor Brushes with a nice point', NULL, 65.9000, 8, NULL, 4, 2)
INSERT [dbo].[Class] ([IdClass], [ClassName], [Description], [TrailerURL], [Price], [Duration], [State], [IdTutor], [IdCoordinator]) VALUES (1014, N'Advanced Crepe Paper Flowers', N'About This Class
Join Eileen in crafting beautiful and vibrant Sunflowers from Italian 180gsm Crepe Paper. Not only will these be handmade by you, but they''ll last a lifetime and will never wilt! Designed for beginners, this class is a great introduction to fundamental crepe paper flower-making techniques.

Tools & Materials - What you''ll need

180gsm Crepe Paper from Cartotecnica Rossi
Crepe Paper Colours are yellow (code 576), light green (code 562), dark brown (code 568), light brown (code 567) and black (code 602)
Florist Wire: Wrapped #18 and #20
Scissors
Mini Hot Glue Gun + Glue Sticks
Wire cutters
Templates - provided in a pdf for you!', NULL, 120.7000, 8, NULL, 1, 2)
INSERT [dbo].[Class] ([IdClass], [ClassName], [Description], [TrailerURL], [Price], [Duration], [State], [IdTutor], [IdCoordinator]) VALUES (1015, N'Basic color calligraphy', N'Curious about calligraphy? Join Paperfinger founder Bryn Chernoff for a warm and inviting introductory class on the tools, techniques, and best practices to transform your handwriting into beautiful calligraphy script!

Always welcoming and encouraging, Bryn covers all the details aspiring calligraphers need to get started. From materials and setting up a workspace to basic shapes, line widths, movement, and connecting individual letters, this class is a comprehensive and thoroughly enjoyable guide.

Plus, with 7 Skillshare-exclusive practice pages, a guide for straight lines, and countless inspiration photos, there’s no clearer introduction to the world of nibs, ink, and beautiful writing.

By the end, you''ll write a meaningful name, quotation, or passage in a simple calligraphy script. This enjoyable project is a perfect way to spend time with words you love, grow your calligraphy skills, and practice making artistic decisions in pursuit of beautiful handwriting.

______________

Class Outline

Introduction. Writing in calligraphy script is a timeless art that imbues even the simplest writing with an air of sophistication. This course by celebrated calligrapher Bryn Chernoff can help you learn calligraphy at your own pace and create beautiful works of typographic art with little more than ink and paper. She will also provide you with links to download handy worksheets that can help you develop your style and technique.
Warm Up. Dive right in on scraps of paper with a few exercises designed to help you relax, as well as teach you about how to approach lettering art. You’ll learn how to express emotions, not just through the words themselves, but also through the shape those words take. Different lettering styles can evoke different reactions in the reader, such as “whimsical,” “rustic,” or “shy,” and Bryn demonstrates her own techniques for finding the right form for your project.
Welcome! Bryn talks a little bit about her background, her love of calligraphy, and why she chose to pursue this career after studying computer science.', NULL, 10.8000, 8, NULL, 4, 5)
INSERT [dbo].[Class] ([IdClass], [ClassName], [Description], [TrailerURL], [Price], [Duration], [State], [IdTutor], [IdCoordinator]) VALUES (1016, N'Knitting IV: Learn Advanced Techniques', N'Level up your knitting knowledge with Sheep & Stitch founder Davina Choy''s fun one-hour class for intermediate students. With friendly and clear instruction, she introduces three techniques to expand your repertoire: the provisional cast on, the kitchener stitch, and mattress stitch seaming. The lessons are broken out into two Skillshare-exclusive headband patterns, and zoomed-in video makes it easy to see each move. By the class''s end, you''ll have a trendy headband to throw on or share with a friend.', NULL, 45.9000, 8, NULL, 3, 5)
INSERT [dbo].[Class] ([IdClass], [ClassName], [Description], [TrailerURL], [Price], [Duration], [State], [IdTutor], [IdCoordinator]) VALUES (1017, N'Basic Paper Branch with leaves', N'Paper flowers are often crafted on flower wire to use in arrangements, but we’re going to create a flat-back flower. It’s a little easier for a first flower and having a flat back is useful for displaying on a wall, setting on a plate for a place setting, or — like the example in this class — adding a clothespin to clip onto things.  Tools and Supplies

Extra heavy crepe paper (180 gsm) in petal color
Heavy crepe paper (100 gsm) in pale yellow
Cardstock in green
White craft glue
Wood bead or cotton ball
Watercolor paint or food coloring
Paint tray', NULL, 30.7000, 8, NULL, 4, 5)
INSERT [dbo].[Class] ([IdClass], [ClassName], [Description], [TrailerURL], [Price], [Duration], [State], [IdTutor], [IdCoordinator]) VALUES (1018, N'Advanced Calligraphy', N'Curious about calligraphy? Join Paperfinger founder Bryn Chernoff for a warm and inviting introductory class on the tools, techniques, and best practices to transform your handwriting into beautiful calligraphy script!

Always welcoming and encouraging, Bryn covers all the details aspiring calligraphers need to get started. From materials and setting up a workspace to basic shapes, line widths, movement, and connecting individual letters, this class is a comprehensive and thoroughly enjoyable guide.

Plus, with 7 Skillshare-exclusive practice pages, a guide for straight lines, and countless inspiration photos, there’s no clearer introduction to the world of nibs, ink, and beautiful writing.

By the end, you''ll write a meaningful name, quotation, or passage in a simple calligraphy script. This enjoyable project is a perfect way to spend time with words you love, grow your calligraphy skills, and practice making artistic decisions in pursuit of beautiful handwriting.

______________

Class Outline

Introduction. Writing in calligraphy script is a timeless art that imbues even the simplest writing with an air of sophistication. This course by celebrated calligrapher Bryn Chernoff can help you learn calligraphy at your own pace and create beautiful works of typographic art with little more than ink and paper. She will also provide you with links to download handy worksheets that can help you develop your style and technique.
Warm Up. Dive right in on scraps of paper with a few exercises designed to help you relax, as well as teach you about how to approach lettering art. You’ll learn how to express emotions, not just through the words themselves, but also through the shape those words take. Different lettering styles can evoke different reactions in the reader, such as “whimsical,” “rustic,” or “shy,” and Bryn demonstrates her own techniques for finding the right form for your project.
Welcome! Bryn talks a little bit about her background, her love of calligraphy, and why she chose to pursue this career after studying computer science.', NULL, 50.8000, 8, NULL, 3, 5)
INSERT [dbo].[Class] ([IdClass], [ClassName], [Description], [TrailerURL], [Price], [Duration], [State], [IdTutor], [IdCoordinator]) VALUES (1019, N'Blanket Knitting', N'Level up your knitting knowledge with Sheep & Stitch founder Davina Choy''s fun one-hour class for intermediate students. With friendly and clear instruction, she introduces three techniques to expand your repertoire: the provisional cast on, the kitchener stitch, and mattress stitch seaming. The lessons are broken out into two Skillshare-exclusive headband patterns, and zoomed-in video makes it easy to see each move. By the class''s end, you''ll have a trendy headband to throw on or share with a friend.', NULL, 78.7000, 8, NULL, 3, 2)
INSERT [dbo].[Class] ([IdClass], [ClassName], [Description], [TrailerURL], [Price], [Duration], [State], [IdTutor], [IdCoordinator]) VALUES (1020, N'Pansy Paper Flower', N'Using simple flower-making techniques, we''ll use crepe paper to craft a flower inspired by icelandic poppies. Paper flowers are often crafted on flower wire to use in arrangements, but we’re going to create a flat-back flower. It’s a little easier for a first flower and having a flat back is useful for displaying on a wall, setting on a plate for a place setting, or — like the example in this class — adding a clothespin to clip onto things.  Tools and Supplies

Extra heavy crepe paper (180 gsm) in petal color
Heavy crepe paper (100 gsm) in pale yellow
Cardstock in green
White craft glue
Wood bead or cotton ball
Watercolor paint or food coloring
Paint tray
Scissors
Flat watercolor brush', NULL, 34.7000, 8, NULL, 4, 2)
INSERT [dbo].[Class] ([IdClass], [ClassName], [Description], [TrailerURL], [Price], [Duration], [State], [IdTutor], [IdCoordinator]) VALUES (1021, N'Sewing kid playing mat', N'This is a challenging beginner/advanced level sewing project and you will need to purchase a sewing pattern, although you could watch the class to learn techniques that you could apply to different sewing projects.

The pattern that I have used is the Wear Lemonade Simona Blouse, its just adorable with its collar, cuffs and lovely bow detail.

You can access The Wear Lemonade website here, I am a member of their PDF pattern club which is great value, but you can also purchase paper patterns.

The videos are split into short lessons so that you can choose to either watch them all, or select the ones that you need help with, the lessons are as follows', NULL, 45.5000, 8, NULL, 1, 5)
INSERT [dbo].[Class] ([IdClass], [ClassName], [Description], [TrailerURL], [Price], [Duration], [State], [IdTutor], [IdCoordinator]) VALUES (1022, N'Poppy paper flower', N'Learn how to make a crepe paper poppy! Using simple flower-making techniques, we''ll use crepe paper to craft a flower inspired by icelandic poppies. Paper flowers are often crafted on flower wire to use in arrangements, but we’re going to create a flat-back flower. It’s a little easier for a first flower and having a flat back is useful for displaying on a wall, setting on a plate for a place setting, or — like the example in this class — adding a clothespin to clip onto things. 

Skill level: Beginner
Class project: Crepe paper poppy

Tools and Supplies

Extra heavy crepe paper (180 gsm) in petal color
Heavy crepe paper (100 gsm) in pale yellow
Cardstock in green
White craft glue', NULL, 28.6000, 8, NULL, 1, 5)
INSERT [dbo].[Class] ([IdClass], [ClassName], [Description], [TrailerURL], [Price], [Duration], [State], [IdTutor], [IdCoordinator]) VALUES (1023, N'Cute Pencil Case Pattern', N'This is a challenging beginner/advanced level sewing project and you will need to purchase a sewing pattern, although you could watch the class to learn techniques that you could apply to different sewing projects.

The pattern that I have used is the Wear Lemonade Simona Blouse, its just adorable with its collar, cuffs and lovely bow detail.

You can access The Wear Lemonade website here, I am a member of their PDF pattern club which is great value, but you can also purchase paper patterns.

The videos are split into short lessons so that you can choose to either watch them all, or select the ones that you need help with, the lessons are as follows', NULL, 23.5000, 8, NULL, 4, 5)
INSERT [dbo].[Class] ([IdClass], [ClassName], [Description], [TrailerURL], [Price], [Duration], [State], [IdTutor], [IdCoordinator]) VALUES (1024, N'Crepe paper flower: Lilacs', N'Paper flowers are often crafted on flower wire to use in arrangements, but we’re going to create a flat-back flower. It’s a little easier for a first flower and having a flat back is useful for displaying on a wall, setting on a plate for a place setting, or — like the example in this class — adding a clothespin to clip onto things.  Tools and Supplies

Extra heavy crepe paper (180 gsm) in petal color
Heavy crepe paper (100 gsm) in pale yellow
Cardstock in green
White craft glue
Wood bead or cotton ball
Watercolor paint or food coloring
Paint tray', NULL, 90.7000, 8, NULL, 4, 2)
INSERT [dbo].[Class] ([IdClass], [ClassName], [Description], [TrailerURL], [Price], [Duration], [State], [IdTutor], [IdCoordinator]) VALUES (1025, N'Paper Peony Flower', N'Paper peony on its way to its owner after a long journey ???? As you know, I''ve been struggling to find my groove lately. On reflection, it''s the interruptions that have made it so difficult to focus on my task - any task - at hand without feeling like I''m getting nowhere. So instead of fighting it, I''ve embraced those little spurts of creativity whenever I can carve out time. The nap ended early? No problem! Drop my work and go. Pick up at 3? Sure, I can work around that. Tantrums and separation anxiety? Time to write off the day. Podcast that went longer than expected. Heck, bring it on! So unsurprisingly, this flower took me a week to make ?? From creating a mock-up to painting the petals, drying them, shaping them, doing more colouring, assembling, finishing with the sepals and leaves. Not surprisingly, with that mindset (by ultimately lowering my expectations), I was able to throw away the frustration that haunted me for so long. And what came out of all of those creative sessions was this double peony. Not bad, if I can say so myself! Plus, I implemented some techniques that had been brewing in my mind for some time now. All that said —- I welcome any suggestions about how to deal with interruptions - please + thank you!!
.
.
Made with double-sided crepe paper from @thepaperplace, 90 g from @cartefinicrepepaper, and coloured with a bunch of stuff - watercolour, pastels, acrylic', NULL, 67.9000, 8, NULL, 1, 5)
SET IDENTITY_INSERT [dbo].[Class] OFF
GO
INSERT [dbo].[ClassCategory] ([IdClass], [IdCategory]) VALUES (10, 6)
INSERT [dbo].[ClassCategory] ([IdClass], [IdCategory]) VALUES (14, 9)
INSERT [dbo].[ClassCategory] ([IdClass], [IdCategory]) VALUES (16, 8)
INSERT [dbo].[ClassCategory] ([IdClass], [IdCategory]) VALUES (18, 7)
INSERT [dbo].[ClassCategory] ([IdClass], [IdCategory]) VALUES (19, 5)
INSERT [dbo].[ClassCategory] ([IdClass], [IdCategory]) VALUES (21, 2)
INSERT [dbo].[ClassCategory] ([IdClass], [IdCategory]) VALUES (23, 9)
INSERT [dbo].[ClassCategory] ([IdClass], [IdCategory]) VALUES (24, 5)
INSERT [dbo].[ClassCategory] ([IdClass], [IdCategory]) VALUES (1005, 6)
INSERT [dbo].[ClassCategory] ([IdClass], [IdCategory]) VALUES (1006, 5)
INSERT [dbo].[ClassCategory] ([IdClass], [IdCategory]) VALUES (1007, 7)
INSERT [dbo].[ClassCategory] ([IdClass], [IdCategory]) VALUES (1008, 5)
INSERT [dbo].[ClassCategory] ([IdClass], [IdCategory]) VALUES (1009, 7)
INSERT [dbo].[ClassCategory] ([IdClass], [IdCategory]) VALUES (1010, 9)
INSERT [dbo].[ClassCategory] ([IdClass], [IdCategory]) VALUES (1011, 8)
INSERT [dbo].[ClassCategory] ([IdClass], [IdCategory]) VALUES (1012, 6)
INSERT [dbo].[ClassCategory] ([IdClass], [IdCategory]) VALUES (1013, 7)
INSERT [dbo].[ClassCategory] ([IdClass], [IdCategory]) VALUES (1014, 5)
INSERT [dbo].[ClassCategory] ([IdClass], [IdCategory]) VALUES (1015, 6)
INSERT [dbo].[ClassCategory] ([IdClass], [IdCategory]) VALUES (1016, 2)
INSERT [dbo].[ClassCategory] ([IdClass], [IdCategory]) VALUES (1017, 5)
INSERT [dbo].[ClassCategory] ([IdClass], [IdCategory]) VALUES (1018, 6)
INSERT [dbo].[ClassCategory] ([IdClass], [IdCategory]) VALUES (1019, 2)
INSERT [dbo].[ClassCategory] ([IdClass], [IdCategory]) VALUES (1020, 5)
INSERT [dbo].[ClassCategory] ([IdClass], [IdCategory]) VALUES (1021, 2)
INSERT [dbo].[ClassCategory] ([IdClass], [IdCategory]) VALUES (1022, 5)
INSERT [dbo].[ClassCategory] ([IdClass], [IdCategory]) VALUES (1023, 2)
INSERT [dbo].[ClassCategory] ([IdClass], [IdCategory]) VALUES (1024, 5)
INSERT [dbo].[ClassCategory] ([IdClass], [IdCategory]) VALUES (1025, 5)
GO
INSERT [dbo].[ClassPicture] ([IdClass], [ThumbnailFront], [ThumbnailBack], [ThumbnailDetail1], [ThumbnailDetail2], [ThumbnailDetail3]) VALUES (10, N'shop-1.jpg', N'shop-11.jpg', NULL, NULL, NULL)
INSERT [dbo].[ClassPicture] ([IdClass], [ThumbnailFront], [ThumbnailBack], [ThumbnailDetail1], [ThumbnailDetail2], [ThumbnailDetail3]) VALUES (14, N'shop-2.jpg', N'shop-22.jpg', NULL, NULL, NULL)
INSERT [dbo].[ClassPicture] ([IdClass], [ThumbnailFront], [ThumbnailBack], [ThumbnailDetail1], [ThumbnailDetail2], [ThumbnailDetail3]) VALUES (16, N'shop-3.jpg', N'shop-33.jpg', NULL, NULL, NULL)
INSERT [dbo].[ClassPicture] ([IdClass], [ThumbnailFront], [ThumbnailBack], [ThumbnailDetail1], [ThumbnailDetail2], [ThumbnailDetail3]) VALUES (18, N'shop-4.jpg', N'shop-44.jpg', NULL, NULL, NULL)
INSERT [dbo].[ClassPicture] ([IdClass], [ThumbnailFront], [ThumbnailBack], [ThumbnailDetail1], [ThumbnailDetail2], [ThumbnailDetail3]) VALUES (19, N'shop-5.jpg', N'shop-55.jpg', NULL, NULL, NULL)
INSERT [dbo].[ClassPicture] ([IdClass], [ThumbnailFront], [ThumbnailBack], [ThumbnailDetail1], [ThumbnailDetail2], [ThumbnailDetail3]) VALUES (21, N'shop-6.jpg', N'shop-66.jpg', NULL, NULL, NULL)
INSERT [dbo].[ClassPicture] ([IdClass], [ThumbnailFront], [ThumbnailBack], [ThumbnailDetail1], [ThumbnailDetail2], [ThumbnailDetail3]) VALUES (23, N'shop-7.jpg', N'shop-77.jpg', NULL, NULL, NULL)
INSERT [dbo].[ClassPicture] ([IdClass], [ThumbnailFront], [ThumbnailBack], [ThumbnailDetail1], [ThumbnailDetail2], [ThumbnailDetail3]) VALUES (24, N'shop-8.jpg', N'shop-88.jpg', NULL, NULL, NULL)
INSERT [dbo].[ClassPicture] ([IdClass], [ThumbnailFront], [ThumbnailBack], [ThumbnailDetail1], [ThumbnailDetail2], [ThumbnailDetail3]) VALUES (1005, N'class-9f.jpg', N'class-9b.jpg', NULL, NULL, NULL)
INSERT [dbo].[ClassPicture] ([IdClass], [ThumbnailFront], [ThumbnailBack], [ThumbnailDetail1], [ThumbnailDetail2], [ThumbnailDetail3]) VALUES (1006, N'class-10f.jpg', N'class-10b.jpg', NULL, NULL, NULL)
INSERT [dbo].[ClassPicture] ([IdClass], [ThumbnailFront], [ThumbnailBack], [ThumbnailDetail1], [ThumbnailDetail2], [ThumbnailDetail3]) VALUES (1007, N'class-11f.jpg', N'class-11b.jpg', NULL, NULL, NULL)
INSERT [dbo].[ClassPicture] ([IdClass], [ThumbnailFront], [ThumbnailBack], [ThumbnailDetail1], [ThumbnailDetail2], [ThumbnailDetail3]) VALUES (1008, N'class-12f.jpg', N'class-12b.jpg', NULL, NULL, NULL)
INSERT [dbo].[ClassPicture] ([IdClass], [ThumbnailFront], [ThumbnailBack], [ThumbnailDetail1], [ThumbnailDetail2], [ThumbnailDetail3]) VALUES (1009, N'class-13f.jpg', N'class-13b.jpg', NULL, NULL, NULL)
INSERT [dbo].[ClassPicture] ([IdClass], [ThumbnailFront], [ThumbnailBack], [ThumbnailDetail1], [ThumbnailDetail2], [ThumbnailDetail3]) VALUES (1010, N'class-14f.jpg', N'class-14b.jpg', NULL, NULL, NULL)
INSERT [dbo].[ClassPicture] ([IdClass], [ThumbnailFront], [ThumbnailBack], [ThumbnailDetail1], [ThumbnailDetail2], [ThumbnailDetail3]) VALUES (1011, N'class-15f.jpg', N'class-15b.jpg', NULL, NULL, NULL)
INSERT [dbo].[ClassPicture] ([IdClass], [ThumbnailFront], [ThumbnailBack], [ThumbnailDetail1], [ThumbnailDetail2], [ThumbnailDetail3]) VALUES (1012, N'class-16f.jpg', N'class-16b.jpg', NULL, NULL, NULL)
INSERT [dbo].[ClassPicture] ([IdClass], [ThumbnailFront], [ThumbnailBack], [ThumbnailDetail1], [ThumbnailDetail2], [ThumbnailDetail3]) VALUES (1013, N'class-17f.jpg', N'class-17b.jpg', NULL, NULL, NULL)
INSERT [dbo].[ClassPicture] ([IdClass], [ThumbnailFront], [ThumbnailBack], [ThumbnailDetail1], [ThumbnailDetail2], [ThumbnailDetail3]) VALUES (1014, N'class-18f.jpg', N'class-18b.jpg', NULL, NULL, NULL)
INSERT [dbo].[ClassPicture] ([IdClass], [ThumbnailFront], [ThumbnailBack], [ThumbnailDetail1], [ThumbnailDetail2], [ThumbnailDetail3]) VALUES (1015, N'class-19f.jpg', N'class-19b.jpg', NULL, NULL, NULL)
INSERT [dbo].[ClassPicture] ([IdClass], [ThumbnailFront], [ThumbnailBack], [ThumbnailDetail1], [ThumbnailDetail2], [ThumbnailDetail3]) VALUES (1016, N'class-20f.jpg', N'class-20b.jpg', NULL, NULL, NULL)
INSERT [dbo].[ClassPicture] ([IdClass], [ThumbnailFront], [ThumbnailBack], [ThumbnailDetail1], [ThumbnailDetail2], [ThumbnailDetail3]) VALUES (1017, N'class-21f.jpg', N'class-21b.jpg', NULL, NULL, NULL)
INSERT [dbo].[ClassPicture] ([IdClass], [ThumbnailFront], [ThumbnailBack], [ThumbnailDetail1], [ThumbnailDetail2], [ThumbnailDetail3]) VALUES (1018, N'class-22f.jpg', N'class-22b.jpg', NULL, NULL, NULL)
INSERT [dbo].[ClassPicture] ([IdClass], [ThumbnailFront], [ThumbnailBack], [ThumbnailDetail1], [ThumbnailDetail2], [ThumbnailDetail3]) VALUES (1019, N'class-23f.jpg', N'class-23b.jpg', NULL, NULL, NULL)
INSERT [dbo].[ClassPicture] ([IdClass], [ThumbnailFront], [ThumbnailBack], [ThumbnailDetail1], [ThumbnailDetail2], [ThumbnailDetail3]) VALUES (1020, N'class-24f.jpg', N'class-24b.jpg', NULL, NULL, NULL)
INSERT [dbo].[ClassPicture] ([IdClass], [ThumbnailFront], [ThumbnailBack], [ThumbnailDetail1], [ThumbnailDetail2], [ThumbnailDetail3]) VALUES (1021, N'class-25f.jpg', N'class-25b.jpg', NULL, NULL, NULL)
INSERT [dbo].[ClassPicture] ([IdClass], [ThumbnailFront], [ThumbnailBack], [ThumbnailDetail1], [ThumbnailDetail2], [ThumbnailDetail3]) VALUES (1022, N'class-26f.jpg', N'class-26b.jpg', NULL, NULL, NULL)
INSERT [dbo].[ClassPicture] ([IdClass], [ThumbnailFront], [ThumbnailBack], [ThumbnailDetail1], [ThumbnailDetail2], [ThumbnailDetail3]) VALUES (1023, N'class-27f.jpg', N'class-27b.jpg', NULL, NULL, NULL)
INSERT [dbo].[ClassPicture] ([IdClass], [ThumbnailFront], [ThumbnailBack], [ThumbnailDetail1], [ThumbnailDetail2], [ThumbnailDetail3]) VALUES (1024, N'class-28f.jpg', N'class-28b.jpg', NULL, NULL, NULL)
INSERT [dbo].[ClassPicture] ([IdClass], [ThumbnailFront], [ThumbnailBack], [ThumbnailDetail1], [ThumbnailDetail2], [ThumbnailDetail3]) VALUES (1025, N'class-29f.jpg', N'class-29b.jpg', NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[ContactMessage] ON 

INSERT [dbo].[ContactMessage] ([IdContactMessage], [Name], [Email], [Subject], [MessageContent], [SendDate]) VALUES (1, N'Thao Nguyen', N'thaobube@gmail.com', N'Hi', N'Hello', CAST(N'2021-02-25T16:10:04.330' AS DateTime))
INSERT [dbo].[ContactMessage] ([IdContactMessage], [Name], [Email], [Subject], [MessageContent], [SendDate]) VALUES (2, N'Ida Harper', N'ida.harper@example.com', N'Asking about the class', N'Hello, I would like to find more info about the flower class next month.', CAST(N'2021-02-25T21:19:17.800' AS DateTime))
INSERT [dbo].[ContactMessage] ([IdContactMessage], [Name], [Email], [Subject], [MessageContent], [SendDate]) VALUES (1002, N'Minh', N'minh@exemple.com', N'Coucou', N'Just test', CAST(N'2021-03-01T10:35:58.040' AS DateTime))
INSERT [dbo].[ContactMessage] ([IdContactMessage], [Name], [Email], [Subject], [MessageContent], [SendDate]) VALUES (2002, N'Thao Nguyen', N'thaobube@gmail.com', N'Asking about the class', N'Hello, I would like to book the class....', CAST(N'2021-03-21T22:04:52.430' AS DateTime))
SET IDENTITY_INSERT [dbo].[ContactMessage] OFF
GO
INSERT [dbo].[Coordinator] ([IdCoordinator], [PromotedDate]) VALUES (2, CAST(N'2021-02-03' AS Date))
INSERT [dbo].[Coordinator] ([IdCoordinator], [PromotedDate]) VALUES (5, CAST(N'2021-03-13' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Studio] ON 

INSERT [dbo].[Studio] ([IdStudio], [StudioName], [Description], [Picture], [Number], [Street], [City], [Country]) VALUES (2, N'Ucancraft Uccle', NULL, NULL, N'10', N'Avenue de ABC', N'Brussels', N'Belgium')
INSERT [dbo].[Studio] ([IdStudio], [StudioName], [Description], [Picture], [Number], [Street], [City], [Country]) VALUES (3, N'Ucancraft Auderghem', NULL, NULL, N'15', N'Rue du XYZ', N'Brussels', N'Belgium')
SET IDENTITY_INSERT [dbo].[Studio] OFF
GO
INSERT [dbo].[Tutor] ([IdTutor], [Description], [BankAccount], [TVANumber], [Picture]) VALUES (1, N'toto', N'BE', N'351345', N'#')
INSERT [dbo].[Tutor] ([IdTutor], [Description], [BankAccount], [TVANumber], [Picture]) VALUES (3, N'She is a great tutor in Crepe Paper Flowers.', N'BE5390185', N'19758-32156', N'../images/User/tutor1.jpg')
INSERT [dbo].[Tutor] ([IdTutor], [Description], [BankAccount], [TVANumber], [Picture]) VALUES (4, N'She has 7 years experience.', N'BU09436-274', N'57190834-41', N'../images/User/tutor2.jpg')
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [Email], [Phone], [Login], [Password], [Salt], [Picture], [BirthDate]) VALUES (1, N'Aley', N'Green', N'AGreen@gmail.com', N'0883905275', N'aley', N'oral', NULL, NULL, CAST(N'1988-09-08' AS Date))
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [Email], [Phone], [Login], [Password], [Salt], [Picture], [BirthDate]) VALUES (2, N'Calvin', N'Mendoza', N'calvin.mendoza@example.com', N'(755)-568-1148', N'calvinmen', N'audia4', NULL, NULL, CAST(N'1951-04-05' AS Date))
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [Email], [Phone], [Login], [Password], [Salt], [Picture], [BirthDate]) VALUES (3, N'Alma', N'Hudson', N'alma.hudson@example.com', N'(347)-261-6058', N'alma', N'232323', NULL, NULL, CAST(N'1987-07-06' AS Date))
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [Email], [Phone], [Login], [Password], [Salt], [Picture], [BirthDate]) VALUES (4, N'Judith', N'Kuhn', N'judith.kuhn@example.com', N'(610)-150-8907', N'judith', N'away', NULL, NULL, CAST(N'1965-07-05' AS Date))
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [Email], [Phone], [Login], [Password], [Salt], [Picture], [BirthDate]) VALUES (5, N'Genesis', N'Day', N'genesis.day@example.com', N'(164)-500-0186', N'GeDa', N'woody', NULL, NULL, CAST(N'1988-09-05' AS Date))
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [Email], [Phone], [Login], [Password], [Salt], [Picture], [BirthDate]) VALUES (6, N'Thao', N'Nguyen', N'thaobube@gmail.com', N'0483374334', N'thaobube', N'4pc/0bGINkzA6SNmYU8TNwPCMoumLjla27lXQFEhVox1i763aBYuW7OmJqlrapqx2uFMlSNtKd38tJ+orENAPgNwzuRdaibgHrru|75', N'P4dSm47rfi+TCfExsr98ws9sFIWM', NULL, CAST(N'1986-12-28' AS Date))
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [Email], [Phone], [Login], [Password], [Salt], [Picture], [BirthDate]) VALUES (1008, N'Stephen', N'Green', N'stephen.green@example.com', NULL, N'sgreen', N'7cMk4bJlN1ziaWMKbwvBj3aXMPDVwsaHTg87ydUAx8tFw4Wylg6WQfPUYJxyrT8v9jw1V6r7IWrKIFyUj7Rk7SbYbVxjSJ5YaKhSnZUKknkT6AE=|83', N'6qfwKQ/Faf+VpuoehlGs8oPPksirJw==', N'9.jpg', NULL)
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [Email], [Phone], [Login], [Password], [Salt], [Picture], [BirthDate]) VALUES (1009, N'Marie', N'Nguyen', N'marie@gmail.com', NULL, N'marie_ng', N'GQAWkQE2J7Cih/ibLGUkdQ5m/7pZfbMT6B+o7FX/FcDBoj16Ra+PCehc8D3RRUyf2fl6RiqDZjkZjd403iYhcyf43XX1H5lMtim0WJiP690++DdSgnh58d7pyptBHV3kaZJ0|99', N'mwrbHmkMbn7hcge1CEOWLWvI+w==', N'50.jpg', NULL)
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [Email], [Phone], [Login], [Password], [Salt], [Picture], [BirthDate]) VALUES (2008, N'Thang', N'Nguyen', N'v_thang@gmail.com', NULL, N'thang_ng', N'DfvnnK5GSEXr9g0pv6mv3A==|16', N'Ek/A/NrXUCoZqJD3', NULL, NULL)
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [Email], [Phone], [Login], [Password], [Salt], [Picture], [BirthDate]) VALUES (2009, N'Mike', N'Person', N'mk@example.com', NULL, N'mk', N'AVCcurUXZ1xj8Jn6RhdQjo5YbJsGSzaI2NRm1Wgpppk8579h5Vmsm0O5l5ryO+/tVxiVc1SGiWXixq/fkB9lp+1UiI34nARA0sftVvv8mFcgg9FBCUQ=|86', N'4jpH+I5XgqUWovd0meA=', N'9.jpg', NULL)
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [Email], [Phone], [Login], [Password], [Salt], [Picture], [BirthDate]) VALUES (2010, N'Alexandra', N'Dupont', N'alexandra@example.com', NULL, N'alex', N'ifG4TI8S0LwOuMtnmXLz2PxpqA4A0iKp4vGv08fGS1mS82HMxPGSGjKx5+miqHMov6z6|51', N'7zmxGpQeneuA92PKAjMrSw==', N'76.jpg', NULL)
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [Email], [Phone], [Login], [Password], [Salt], [Picture], [BirthDate]) VALUES (4008, N'Joel', N'Robinson', N'joel@gmail.com', NULL, N'joel', N'nAZnJagKVL529RyE3J0MuVLnkQsG+EA/lBUmxmrdHlZbH4uA9A==|37', N'HXaGKSY4VlfKSpr5grbT2u80SnwzjvPIQA9DPXxUCGmVv/6TCQ==', N'9.jpg', NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
INSERT [dbo].[Workshop] ([IdWorkshop], [StudentMaxQty], [IdStudio]) VALUES (10, NULL, 2)
INSERT [dbo].[Workshop] ([IdWorkshop], [StudentMaxQty], [IdStudio]) VALUES (14, NULL, 3)
INSERT [dbo].[Workshop] ([IdWorkshop], [StudentMaxQty], [IdStudio]) VALUES (16, NULL, 3)
INSERT [dbo].[Workshop] ([IdWorkshop], [StudentMaxQty], [IdStudio]) VALUES (18, NULL, 2)
INSERT [dbo].[Workshop] ([IdWorkshop], [StudentMaxQty], [IdStudio]) VALUES (19, NULL, 3)
INSERT [dbo].[Workshop] ([IdWorkshop], [StudentMaxQty], [IdStudio]) VALUES (21, NULL, 2)
INSERT [dbo].[Workshop] ([IdWorkshop], [StudentMaxQty], [IdStudio]) VALUES (23, NULL, 2)
INSERT [dbo].[Workshop] ([IdWorkshop], [StudentMaxQty], [IdStudio]) VALUES (24, NULL, 3)
INSERT [dbo].[Workshop] ([IdWorkshop], [StudentMaxQty], [IdStudio]) VALUES (1005, NULL, 2)
INSERT [dbo].[Workshop] ([IdWorkshop], [StudentMaxQty], [IdStudio]) VALUES (1006, NULL, 3)
INSERT [dbo].[Workshop] ([IdWorkshop], [StudentMaxQty], [IdStudio]) VALUES (1007, NULL, 2)
INSERT [dbo].[Workshop] ([IdWorkshop], [StudentMaxQty], [IdStudio]) VALUES (1008, NULL, 3)
INSERT [dbo].[Workshop] ([IdWorkshop], [StudentMaxQty], [IdStudio]) VALUES (1009, NULL, 3)
INSERT [dbo].[Workshop] ([IdWorkshop], [StudentMaxQty], [IdStudio]) VALUES (1010, NULL, 3)
INSERT [dbo].[Workshop] ([IdWorkshop], [StudentMaxQty], [IdStudio]) VALUES (1011, NULL, 2)
INSERT [dbo].[Workshop] ([IdWorkshop], [StudentMaxQty], [IdStudio]) VALUES (1012, NULL, 3)
INSERT [dbo].[Workshop] ([IdWorkshop], [StudentMaxQty], [IdStudio]) VALUES (1013, NULL, 2)
INSERT [dbo].[Workshop] ([IdWorkshop], [StudentMaxQty], [IdStudio]) VALUES (1014, NULL, 2)
INSERT [dbo].[Workshop] ([IdWorkshop], [StudentMaxQty], [IdStudio]) VALUES (1015, NULL, 3)
INSERT [dbo].[Workshop] ([IdWorkshop], [StudentMaxQty], [IdStudio]) VALUES (1016, NULL, 3)
INSERT [dbo].[Workshop] ([IdWorkshop], [StudentMaxQty], [IdStudio]) VALUES (1017, NULL, 2)
INSERT [dbo].[Workshop] ([IdWorkshop], [StudentMaxQty], [IdStudio]) VALUES (1018, NULL, 3)
INSERT [dbo].[Workshop] ([IdWorkshop], [StudentMaxQty], [IdStudio]) VALUES (1019, NULL, 3)
INSERT [dbo].[Workshop] ([IdWorkshop], [StudentMaxQty], [IdStudio]) VALUES (1020, NULL, 2)
INSERT [dbo].[Workshop] ([IdWorkshop], [StudentMaxQty], [IdStudio]) VALUES (1021, NULL, 2)
INSERT [dbo].[Workshop] ([IdWorkshop], [StudentMaxQty], [IdStudio]) VALUES (1022, NULL, 3)
INSERT [dbo].[Workshop] ([IdWorkshop], [StudentMaxQty], [IdStudio]) VALUES (1023, NULL, 3)
INSERT [dbo].[Workshop] ([IdWorkshop], [StudentMaxQty], [IdStudio]) VALUES (1024, NULL, 2)
INSERT [dbo].[Workshop] ([IdWorkshop], [StudentMaxQty], [IdStudio]) VALUES (1025, NULL, 3)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_User_Email]    Script Date: 3/23/2021 10:10:15 AM ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [UK_User_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_User_Login]    Script Date: 3/23/2021 10:10:15 AM ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [UK_User_Login] UNIQUE NONCLUSTERED 
(
	[Login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD  CONSTRAINT [FK_Admin_User] FOREIGN KEY([IdAdmin])
REFERENCES [dbo].[User] ([IdUser])
GO
ALTER TABLE [dbo].[Admin] CHECK CONSTRAINT [FK_Admin_User]
GO
ALTER TABLE [dbo].[CalendarWorkshop]  WITH CHECK ADD  CONSTRAINT [FK_CalendarWorkshop_Calendar] FOREIGN KEY([IdCalendar])
REFERENCES [dbo].[Calendar] ([IdCalendar])
GO
ALTER TABLE [dbo].[CalendarWorkshop] CHECK CONSTRAINT [FK_CalendarWorkshop_Calendar]
GO
ALTER TABLE [dbo].[CalendarWorkshop]  WITH CHECK ADD  CONSTRAINT [FK_CalendarWorkshop_Workshop] FOREIGN KEY([IdWorkshop])
REFERENCES [dbo].[Workshop] ([IdWorkshop])
GO
ALTER TABLE [dbo].[CalendarWorkshop] CHECK CONSTRAINT [FK_CalendarWorkshop_Workshop]
GO
ALTER TABLE [dbo].[Cancel]  WITH CHECK ADD  CONSTRAINT [FK_Cancel_Class] FOREIGN KEY([IdClass])
REFERENCES [dbo].[Class] ([IdClass])
GO
ALTER TABLE [dbo].[Cancel] CHECK CONSTRAINT [FK_Cancel_Class]
GO
ALTER TABLE [dbo].[Cancel]  WITH CHECK ADD  CONSTRAINT [FK_Cancel_User] FOREIGN KEY([IdUser])
REFERENCES [dbo].[User] ([IdUser])
GO
ALTER TABLE [dbo].[Cancel] CHECK CONSTRAINT [FK_Cancel_User]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Coordinator] FOREIGN KEY([IdCoordinator])
REFERENCES [dbo].[Coordinator] ([IdCoordinator])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_Coordinator]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Tutor] FOREIGN KEY([IdTutor])
REFERENCES [dbo].[Tutor] ([IdTutor])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_Tutor]
GO
ALTER TABLE [dbo].[ClassCategory]  WITH CHECK ADD  CONSTRAINT [FK_ClassCategory_Category] FOREIGN KEY([IdCategory])
REFERENCES [dbo].[Category] ([IdCategory])
GO
ALTER TABLE [dbo].[ClassCategory] CHECK CONSTRAINT [FK_ClassCategory_Category]
GO
ALTER TABLE [dbo].[ClassCategory]  WITH CHECK ADD  CONSTRAINT [FK_ClassCategory_Class] FOREIGN KEY([IdClass])
REFERENCES [dbo].[Class] ([IdClass])
GO
ALTER TABLE [dbo].[ClassCategory] CHECK CONSTRAINT [FK_ClassCategory_Class]
GO
ALTER TABLE [dbo].[ClassPicture]  WITH CHECK ADD  CONSTRAINT [FK_ClassPicture_Class] FOREIGN KEY([IdClass])
REFERENCES [dbo].[Class] ([IdClass])
GO
ALTER TABLE [dbo].[ClassPicture] CHECK CONSTRAINT [FK_ClassPicture_Class]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Class] FOREIGN KEY([IdClass])
REFERENCES [dbo].[Class] ([IdClass])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Class]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_User] FOREIGN KEY([IdUser])
REFERENCES [dbo].[User] ([IdUser])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_User]
GO
ALTER TABLE [dbo].[Coordinator]  WITH CHECK ADD  CONSTRAINT [FK_Coordinator_User] FOREIGN KEY([IdCoordinator])
REFERENCES [dbo].[User] ([IdUser])
GO
ALTER TABLE [dbo].[Coordinator] CHECK CONSTRAINT [FK_Coordinator_User]
GO
ALTER TABLE [dbo].[OnlineClass]  WITH CHECK ADD  CONSTRAINT [FK_OnlineClass_Class] FOREIGN KEY([IdOnlineClass])
REFERENCES [dbo].[Class] ([IdClass])
GO
ALTER TABLE [dbo].[OnlineClass] CHECK CONSTRAINT [FK_OnlineClass_Class]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_Class] FOREIGN KEY([IdClass])
REFERENCES [dbo].[Class] ([IdClass])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_Class]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_User] FOREIGN KEY([IdUser])
REFERENCES [dbo].[User] ([IdUser])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_User]
GO
ALTER TABLE [dbo].[Registration]  WITH CHECK ADD  CONSTRAINT [FK_Registration_Class] FOREIGN KEY([IdClass])
REFERENCES [dbo].[Class] ([IdClass])
GO
ALTER TABLE [dbo].[Registration] CHECK CONSTRAINT [FK_Registration_Class]
GO
ALTER TABLE [dbo].[Registration]  WITH CHECK ADD  CONSTRAINT [FK_Registration_User] FOREIGN KEY([IdUser])
REFERENCES [dbo].[User] ([IdUser])
GO
ALTER TABLE [dbo].[Registration] CHECK CONSTRAINT [FK_Registration_User]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_User] FOREIGN KEY([IdStudent])
REFERENCES [dbo].[User] ([IdUser])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_User]
GO
ALTER TABLE [dbo].[Tutor]  WITH CHECK ADD  CONSTRAINT [FK_Tutor_User] FOREIGN KEY([IdTutor])
REFERENCES [dbo].[User] ([IdUser])
GO
ALTER TABLE [dbo].[Tutor] CHECK CONSTRAINT [FK_Tutor_User]
GO
ALTER TABLE [dbo].[Workshop]  WITH CHECK ADD  CONSTRAINT [FK_Workshop_Class] FOREIGN KEY([IdWorkshop])
REFERENCES [dbo].[Class] ([IdClass])
GO
ALTER TABLE [dbo].[Workshop] CHECK CONSTRAINT [FK_Workshop_Class]
GO
ALTER TABLE [dbo].[Workshop]  WITH CHECK ADD  CONSTRAINT [FK_Workshop_Studio] FOREIGN KEY([IdStudio])
REFERENCES [dbo].[Studio] ([IdStudio])
GO
ALTER TABLE [dbo].[Workshop] CHECK CONSTRAINT [FK_Workshop_Studio]
GO
/****** Object:  StoredProcedure [dbo].[CategoryClasses]    Script Date: 3/23/2021 10:10:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CategoryClasses]
	@name VARCHAR (64)
AS
SELECT * FROM [V_SimpleClass] WHERE CategoryName = @name
GO
/****** Object:  StoredProcedure [dbo].[FeaturedClasses]    Script Date: 3/23/2021 10:10:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FeaturedClasses]
	@number int
AS
BEGIN
	DECLARE @skip int
	DECLARE @count int
	SELECT @count = COUNT(*) FROM [V_SimpleClass]
	SET @skip = RAND() * (@count - @number +1) 
EXECUTE
('SELECT * 
FROM [V_SimpleClass]
ORDER BY [IdClass]
OFFSET ' + @skip + ' ROWS
FETCH NEXT ' + @number + ' ROWS ONLY')
END


/*
ignore @skip rows then get @number next rows
for example: there are total 20 rows, skip 5 first rows then take 10 next row (from 6-15)
Notes: @skip need to be <= total rows - @number rows
For example: @skip = 5; @number = 10; count(*) = 20
=> 0=< @skip < 11 => @skip = RAND()*11 = RAND()* ((20-10) +1) 
=> @skip = RAND() * (@count - @number +1)
*/
GO
USE [master]
GO
ALTER DATABASE [HandcraftDB] SET  READ_WRITE 
GO
