USE [master]
GO
/****** Object:  Database [CourseOnline]    Script Date: 3/29/2022 9:54:55 AM ******/
CREATE DATABASE [CourseOnline]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CourseOnline', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\CourseOnline.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CourseOnline_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\CourseOnline_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CourseOnline] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CourseOnline].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CourseOnline] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CourseOnline] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CourseOnline] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CourseOnline] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CourseOnline] SET ARITHABORT OFF 
GO
ALTER DATABASE [CourseOnline] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CourseOnline] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CourseOnline] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CourseOnline] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CourseOnline] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CourseOnline] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CourseOnline] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CourseOnline] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CourseOnline] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CourseOnline] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CourseOnline] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CourseOnline] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CourseOnline] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CourseOnline] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CourseOnline] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CourseOnline] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CourseOnline] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CourseOnline] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CourseOnline] SET  MULTI_USER 
GO
ALTER DATABASE [CourseOnline] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CourseOnline] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CourseOnline] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CourseOnline] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CourseOnline] SET DELAYED_DURABILITY = DISABLED 
GO
USE [CourseOnline]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 3/29/2022 9:54:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Blog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Image] [varchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 3/29/2022 9:54:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParentId] [int] NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
	[NumberOfCourse] [int] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[Status] [bit] NULL,
	[ImageSlide] [nvarchar](max) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Courses]    Script Date: 3/29/2022 9:54:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Courses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[CourseName] [nvarchar](max) NOT NULL,
	[Price] [float] NOT NULL,
	[Image] [varchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Benefits] [nvarchar](max) NOT NULL,
	[Document] [varchar](max) NULL,
	[Status] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Language]    Script Date: 3/29/2022 9:54:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Language](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IsDefaul] [bit] NOT NULL,
 CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Lessons]    Script Date: 3/29/2022 9:54:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lessons](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LessonName] [nvarchar](max) NOT NULL,
	[UrlFile] [nvarchar](max) NOT NULL,
	[TimeVideo] [float] NULL,
	[TopicId] [int] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Lesson] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 3/29/2022 9:54:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[CourseId] [int] NOT NULL,
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[Discount] [float] NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC,
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/29/2022 9:54:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[TotalPrice] [float] NOT NULL,
	[IsCheckout] [bit] NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 3/29/2022 9:54:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Topic]    Script Date: 3/29/2022 9:54:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topic](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TopicName] [nvarchar](max) NOT NULL,
	[CourseId] [int] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Topic] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 3/29/2022 9:54:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [nvarchar](max) NULL,
	[RoleId] [int] NULL CONSTRAINT [DF_User_RoleId]  DEFAULT ((2)),
	[FullName] [nvarchar](max) NULL,
	[Email] [varchar](250) NULL,
	[Phone] [nchar](20) NULL,
	[Avatar] [varchar](max) NULL,
	[DateOfBirth] [date] NULL,
	[Gender] [int] NULL,
	[Address] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_User_Status]  DEFAULT ((1)),
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [Image], [NumberOfCourse], [CreatedAt], [UpdatedAt], [Status], [ImageSlide]) VALUES (1, NULL, N'It && cong nghe', N'/FileUploads/images/mon-hoc-lap-trinh-vien-javascript.png', 1, CAST(N'2002-12-12 00:00:00.000' AS DateTime), CAST(N'2022-11-11 00:00:00.000' AS DateTime), 0, NULL)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [Image], [NumberOfCourse], [CreatedAt], [UpdatedAt], [Status], [ImageSlide]) VALUES (2, NULL, N'PHP', N'/FileUploads/images/mon-hoc-lap-trinh-vien-javascript.png', 1, CAST(N'2022-12-12 23:11:00.000' AS DateTime), CAST(N'2022-12-12 23:11:00.000' AS DateTime), 0, NULL)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [Image], [NumberOfCourse], [CreatedAt], [UpdatedAt], [Status], [ImageSlide]) VALUES (3, NULL, N'PHP', N'/FileUploads/images/mon-hoc-lap-trinh-vien-javascript.png', 1, CAST(N'2022-12-12 23:11:00.000' AS DateTime), CAST(N'2022-12-12 23:11:00.000' AS DateTime), 0, NULL)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [Image], [NumberOfCourse], [CreatedAt], [UpdatedAt], [Status], [ImageSlide]) VALUES (4, NULL, N'Home', N'test.jpg', 2, CAST(N'2001-12-12 00:00:00.000' AS DateTime), CAST(N'2022-12-12 23:11:00.000' AS DateTime), 0, NULL)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [Image], [NumberOfCourse], [CreatedAt], [UpdatedAt], [Status], [ImageSlide]) VALUES (7, NULL, N'Ngoại ngữ', N'te', 44, CAST(N'2002-11-11 00:00:00.000' AS DateTime), CAST(N'2002-11-11 00:00:00.000' AS DateTime), 0, NULL)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [Image], [NumberOfCourse], [CreatedAt], [UpdatedAt], [Status], [ImageSlide]) VALUES (8, NULL, N'Tiếng anh giao tiếp', N'/FileUploads/images/mon-hoc-lap-trinh-vien-javascript.png', 123, CAST(N'2002-11-11 00:00:00.000' AS DateTime), CAST(N'2002-11-11 00:00:00.000' AS DateTime), 0, NULL)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [Image], [NumberOfCourse], [CreatedAt], [UpdatedAt], [Status], [ImageSlide]) VALUES (9, NULL, N'Tiếng trung giao tiếp', N'test.jpg', 23, CAST(N'2022-11-11 00:00:00.000' AS DateTime), CAST(N'2022-11-11 00:00:00.000' AS DateTime), 0, NULL)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [Image], [NumberOfCourse], [CreatedAt], [UpdatedAt], [Status], [ImageSlide]) VALUES (10, NULL, N'Lập trình javascript', N'test', 123, CAST(N'2001-11-11 00:00:00.000' AS DateTime), CAST(N'2001-11-11 00:00:00.000' AS DateTime), 0, NULL)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [Image], [NumberOfCourse], [CreatedAt], [UpdatedAt], [Status], [ImageSlide]) VALUES (11, NULL, N'Lập trình java', N'test.jpg', 33, CAST(N'2022-03-22 08:24:14.193' AS DateTime), CAST(N'2022-03-22 08:24:14.193' AS DateTime), 0, NULL)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [Image], [NumberOfCourse], [CreatedAt], [UpdatedAt], [Status], [ImageSlide]) VALUES (12, NULL, N'Lập trình nodejs', N'/FileUploads/images/Avatar_user/3.png', 1, CAST(N'2022-03-22 09:42:04.563' AS DateTime), CAST(N'2022-03-22 09:42:04.563' AS DateTime), 0, NULL)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [Image], [NumberOfCourse], [CreatedAt], [UpdatedAt], [Status], [ImageSlide]) VALUES (13, NULL, N'Thể thao sức khỏe', N'/FileUploads/images/Avatar_user/pexels-photo.jpeg', 1, CAST(N'2022-03-22 09:43:15.223' AS DateTime), CAST(N'2022-03-22 09:43:15.223' AS DateTime), 0, NULL)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [Image], [NumberOfCourse], [CreatedAt], [UpdatedAt], [Status], [ImageSlide]) VALUES (14, NULL, N'Ngoại Ngữ', N'/FileUploads/images/Image_categories/1.jpg', 0, CAST(N'2022-03-25 16:16:21.407' AS DateTime), CAST(N'2022-03-25 16:16:21.407' AS DateTime), 1, N'/FileUploads/images/Image_categories/slide_ngoai_ngu.png')
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [Image], [NumberOfCourse], [CreatedAt], [UpdatedAt], [Status], [ImageSlide]) VALUES (15, 14, N'Tiếng anh', N'/FileUploads/images/Image_categories/1.jpg', 0, CAST(N'2022-03-25 16:22:55.127' AS DateTime), CAST(N'2022-03-25 16:22:55.127' AS DateTime), 1, N'/FileUploads/images/Image_categories/slide_ngoai_ngu.png')
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [Image], [NumberOfCourse], [CreatedAt], [UpdatedAt], [Status], [ImageSlide]) VALUES (16, 14, N'Tiếng anh giao tiếp', N'/FileUploads/images/Image_categories/image-ngoai-ngu.png', 0, CAST(N'2022-03-28 15:34:16.007' AS DateTime), CAST(N'2022-03-28 15:34:16.007' AS DateTime), 1, N'/FileUploads/images/Image_categories/slide_ngoai_ngu.png')
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [Image], [NumberOfCourse], [CreatedAt], [UpdatedAt], [Status], [ImageSlide]) VALUES (17, NULL, N'Nghệ thuật đời sống', N'/FileUploads/images/Image_categories/nghe-thuat-doi-song-image.png', 0, CAST(N'2022-03-28 15:37:37.630' AS DateTime), CAST(N'2022-03-28 15:37:37.630' AS DateTime), 1, N'/FileUploads/images/Image_categories/nghe-thuat-doi-song.png')
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [Image], [NumberOfCourse], [CreatedAt], [UpdatedAt], [Status], [ImageSlide]) VALUES (18, 17, N'Nấu ăn', N'/FileUploads/images/Image_categories/nghe-thuat-doi-song-image.png', 0, CAST(N'2022-03-28 15:42:14.997' AS DateTime), CAST(N'2022-03-28 15:42:14.997' AS DateTime), 1, N'/FileUploads/images/Image_categories/nghe-thuat-doi-song.png')
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [Image], [NumberOfCourse], [CreatedAt], [UpdatedAt], [Status], [ImageSlide]) VALUES (19, 17, N'Phong thủy nhân tướng học', N'/FileUploads/images/Image_categories/nghe-thuat-doi-song-image.png', 0, CAST(N'2022-03-28 15:47:06.880' AS DateTime), CAST(N'2022-03-28 15:47:06.880' AS DateTime), 1, N'/FileUploads/images/Image_categories/nghe-thuat-doi-song.png')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([Id], [CategoryId], [CourseName], [Price], [Image], [Description], [Benefits], [Document], [Status], [CreatedAt], [UpdatedAt]) VALUES (1, 10, N'Lập trình javascript từ cơ bản đến nâng cao', 12000, N'/FileUploads/images/mon-hoc-lap-trinh-vien-javascript.png', N'&lt;p&gt;Nhật m&amp;otilde;m ok&lt;/p&gt;
', N'Đến với khóa học sẽ được vui chơi giải trí', N'text lên', 1, CAST(N'2022-03-22 16:52:20.327' AS DateTime), CAST(N'2022-03-22 16:52:20.327' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [CourseName], [Price], [Image], [Description], [Benefits], [Document], [Status], [CreatedAt], [UpdatedAt]) VALUES (2, 10, N'Lập trình javascript nâng cao', 12000, N'/FileUploads/images/mon-hoc-lap-trinh-vien-javascript.png', N'&lt;p&gt;Đ&amp;acirc;y l&amp;agrave; một kh&amp;oacute;a học js n&amp;acirc;ng cao&amp;nbsp;&lt;/p&gt;
', N'Đây là một khóa học js nâng cao ', N'text lên', 1, CAST(N'2022-03-22 17:07:04.813' AS DateTime), CAST(N'2022-03-22 17:07:04.813' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [CourseName], [Price], [Image], [Description], [Benefits], [Document], [Status], [CreatedAt], [UpdatedAt]) VALUES (3, 12, N'Trọn bộ kiến thức nodejs', 30000, N'/FileUploads/images/mon-hoc-lap-trinh-vien-javascript.png', N'&lt;p&gt;Hiện nay, c&amp;ocirc;ng nghệ th&amp;ocirc;ng tin xuất hiện ở mọi nơi, sự ph&amp;aacute;t triển nhanh ch&amp;oacute;ng của n&amp;oacute; k&amp;eacute;o theo việc ng&amp;agrave;nh lập tr&amp;igrave;nh trở th&amp;agrave;nh một một lựa chọn l&amp;yacute; tưởng cho c&amp;aacute;c bạn trẻ. V&amp;agrave; khi nhắc tới lập tr&amp;igrave;nh, ta c&amp;oacute; thể n&amp;oacute;i tới&amp;nbsp;NodeJS. NodeJS l&amp;agrave; một nền tảng viết bằng JavaScript gi&amp;uacute;p x&amp;acirc;y dựng c&amp;aacute;c ứng dụng mạng nhanh v&amp;agrave; khả mở. NodeJS được InfoWorld b&amp;igrave;nh chọn l&amp;agrave; &amp;quot;C&amp;ocirc;ng nghệ của năm&amp;quot; năm 2012.&lt;/p&gt;

&lt;p&gt;- Bạn l&amp;agrave; sinh vi&amp;ecirc;n CNTT, người vừa đi l&amp;agrave;m trong lĩnh vực CNTT&lt;/p&gt;

&lt;p&gt;- Bạn c&amp;oacute; mong muốn tạo ra c&amp;aacute;c&amp;nbsp;sever games online, c&amp;aacute;c ứng dụng, hay muốn&amp;nbsp;đảm bảo ứng dụng hoạt động nhanh, đồng thời xử l&amp;yacute; nhiều dữ liệu trong thời gian ngắn&lt;/p&gt;
', N'Đến với khóa học sẽ được vui chơi giải trí', N'/FileUploads/files/btap.txt', 1, CAST(N'2022-03-23 05:00:20.447' AS DateTime), CAST(N'2022-03-23 05:00:20.447' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [CourseName], [Price], [Image], [Description], [Benefits], [Document], [Status], [CreatedAt], [UpdatedAt]) VALUES (4, 13, N'Thiền khí công, bí quyết nâng cao sức khỏe', 32000, N'/FileUploads/images/Avatar_user/3.png', N'&lt;p&gt;&amp;#39;&amp;#39;Sức khỏe v&amp;agrave; tr&amp;iacute; tuệ l&amp;agrave; vốn qu&amp;yacute; nhất của đời người.&amp;#39;&amp;#39; - Kinh Phật&lt;/p&gt;

&lt;p&gt;&amp;nbsp; &amp;nbsp;Cuộc sống hiện đại c&amp;oacute; qu&amp;aacute; nhiều &amp;aacute;p lực căng thẳng khiến ch&amp;uacute;ng ta &amp;iacute;t c&amp;oacute; thời gian chăm s&amp;oacute;c bản th&amp;acirc;n. Căng thẳng k&amp;eacute;o d&amp;agrave;i sẽ l&amp;agrave;m bộ n&amp;atilde;o mệt mỏi, cơ thể ti&amp;ecirc;u ph&amp;iacute; nhiều năng lượng m&amp;agrave; việc giải quyết c&amp;ocirc;ng việc lại k&amp;eacute;m hiệu quả.&lt;/p&gt;
', N'&lt;h2&gt;Lợi &amp;iacute;ch từ kho&amp;aacute; học&lt;/h2&gt;

&lt;p&gt;Học vi&amp;ecirc;n sẽ cảm nhận được lợi của việc thiền trong kh&amp;oacute;a học&lt;/p&gt;

&lt;p&gt;Ngay khi tập khoảng 10 buổi, người học đ&amp;atilde; thấy chuyển biến r&amp;otilde; rệt về sức khỏe, thấy cơ thể dễ chịu, ngủ ngon giấc, vận động linh hoạt hơn, giảm mệt mỏi đau nhức hệ vận động.&lt;/p&gt;

&lt;p&gt;Về l&amp;acirc;u d&amp;agrave;i n&amp;ecirc;n thực h&amp;agrave;nh thường xuy&amp;ecirc;n c&amp;aacute;c b&amp;agrave;i tập v&amp;agrave; kỹ năng, kiến thức trong kh&amp;oacute;a học, học vi&amp;ecirc;n c&amp;oacute; thể ph&amp;ograve;ng v&amp;agrave; điều chỉnh được một số rối loạn về t&amp;acirc;m l&amp;yacute;, b&amp;igrave;nh tĩnh, tự tin hơn, minh mẫn s&amp;aacute;ng suốt hơn trong c&amp;ocirc;ng việc, cải thiện sức khỏe thể chất v&amp;agrave; t&amp;acirc;m l&amp;yacute; hiệu quả v&amp;agrave; t&amp;iacute;ch cực.&lt;/p&gt;
', NULL, 1, CAST(N'2022-03-23 17:11:17.170' AS DateTime), CAST(N'2022-03-23 17:11:17.170' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [CourseName], [Price], [Image], [Description], [Benefits], [Document], [Status], [CreatedAt], [UpdatedAt]) VALUES (5, 15, N'Học tiếng anh theo chủ đề: LOCATIONS', 290000, N'/FileUploads/images/Image_categories/hoc-tieng-anh-theo-chu-de-location.jpeg', N'&lt;p&gt;&amp;lt;h1&amp;gt;Học tiếng anh theo chủ đề: LOCATIONS&amp;lt;/h1&amp;gt; &amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt; &amp;lt;p&amp;gt;Tự tin sử dụng tiếng Anh theo c&amp;amp;aacute;c chủ đề trong cuộc sống h&amp;amp;agrave;ng ng&amp;amp;agrave;y&amp;lt;/p&amp;gt;&lt;/p&gt;
', N'&lt;p&gt;&amp;lt;p&amp;gt;Chi ph&amp;amp;iacute; rẻ, tiết kiệm thời gian&amp;lt;/p&amp;gt; &amp;lt;p&amp;gt;Học mọi l&amp;amp;uacute;c mọi nơi&amp;lt;/p&amp;gt; &amp;lt;p&amp;gt;C&amp;amp;aacute;c t&amp;amp;igrave;nh huống cụ thể được minh họa sinh động qua video học liệu full HD&amp;lt;/p&amp;gt; &amp;lt;p&amp;gt;Tự tin, thoải m&amp;amp;aacute;i tr&amp;amp;ograve; chuyện v&amp;amp;agrave; chia sẻ cảm x&amp;amp;uacute;c với bạn b&amp;amp;egrave;, đồng nghiệp, đối t&amp;amp;aacute;c...&amp;lt;/p&amp;gt; &amp;lt;p&amp;gt;Chủ động thời gian v&amp;amp;agrave; kh&amp;amp;ocirc;ng gian&amp;lt;/p&amp;gt;&lt;/p&gt;
', NULL, 1, CAST(N'2022-03-25 16:42:48.337' AS DateTime), CAST(N'2022-03-25 16:42:48.337' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [CourseName], [Price], [Image], [Description], [Benefits], [Document], [Status], [CreatedAt], [UpdatedAt]) VALUES (6, 15, N'Tiếng Anh theo chủ đề: AT THE WORKPLACE', 290000, N'/FileUploads/images/Image_categories/hoc-tieng-anh-theo-chu-de-at.jpeg', N'&lt;p&gt;Kho&amp;aacute; học với nội dung cơ bản, ngắn gọn, dễ hiểu, cần thiết&amp;nbsp;&lt;/p&gt;

&lt;p&gt;Học vi&amp;ecirc;n thường xuy&amp;ecirc;n được kiểm tra, đ&amp;aacute;nh gi&amp;aacute; qua c&amp;aacute;c b&amp;agrave;i kiểm tra trong v&amp;agrave; sau mỗi b&amp;agrave;i học Luyện c&amp;aacute;c kĩ năng quan trọng trong giao tiếp tiếng anh (nghe, n&amp;oacute;i, phản xạ, ngữ &amp;acirc;m) trong 1 b&amp;agrave;i học&amp;nbsp;&lt;/p&gt;

&lt;p&gt;Nắm bắt được c&amp;aacute;c từ v&amp;agrave; c&amp;aacute;c cụm từ thường sử dụng theo c&amp;aacute;c chủ đề&amp;nbsp;&lt;/p&gt;

&lt;p&gt;Tự tin, thoải m&amp;aacute;i tr&amp;ograve; chuyện v&amp;agrave; chia sẻ cảm x&amp;uacute;c với bạn b&amp;egrave;, đồng nghiệp, đối t&amp;aacute;c...&lt;/p&gt;

&lt;p&gt;Lộ tr&amp;igrave;nh học tập:&lt;/p&gt;

&lt;p&gt;84 b&amp;agrave;i học về từ vựng v&amp;agrave; cấu tr&amp;uacute;c c&amp;acirc;u xoay quanh chủ đề AT THE WORKPLACE c&amp;oacute; b&amp;agrave;i tập đi k&amp;egrave;m&lt;/p&gt;
', N'&lt;ul&gt;
	&lt;li&gt;Chi ph&amp;iacute; rẻ, tiết kiệm thời gian&lt;/li&gt;
	&lt;li&gt;Học mọi l&amp;uacute;c mọi nơi&lt;/li&gt;
	&lt;li&gt;C&amp;aacute;c t&amp;igrave;nh huống cụ thể được minh họa sinh động qua video học liệu full HD&lt;/li&gt;
	&lt;li&gt;Tự tin, thoải m&amp;aacute;i tr&amp;ograve; chuyện v&amp;agrave; chia sẻ cảm x&amp;uacute;c với bạn b&amp;egrave;, đồng nghiệp, đối t&amp;aacute;c...&lt;/li&gt;
	&lt;li&gt;Chủ động thời gian v&amp;agrave; kh&amp;ocirc;ng gian&lt;/li&gt;
&lt;/ul&gt;
', NULL, 1, CAST(N'2022-03-25 16:45:23.377' AS DateTime), CAST(N'2022-03-25 16:45:23.377' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [CourseName], [Price], [Image], [Description], [Benefits], [Document], [Status], [CreatedAt], [UpdatedAt]) VALUES (7, 18, N'Học nấu món ăn chay dưỡng sinh', 299, N'/FileUploads/images/Image_categories/imageproxy.jpeg', N'&lt;p&gt;Ăn chay thường bị hiểu nhầm l&amp;agrave; một h&amp;igrave;nh thức tu khổ hạnh với những m&amp;oacute;n ăn đơn sơ, đạm bạc. Thực tế, ăn chay l&amp;agrave; một chế độ ăn rất c&amp;oacute; lợi cho sức khỏe v&amp;agrave; sắc đẹp. Hơn nữa, nấu c&amp;aacute;c m&amp;oacute;n ăn chay cũng rất nhanh gọn v&amp;agrave; đơn giản. Nếu bạn l&amp;agrave; người nội trợ muốn học l&amp;agrave;m những m&amp;oacute;n ăn chay ngon cho gia đ&amp;igrave;nh, người th&amp;acirc;n, hay bạn l&amp;agrave; người tập yoga, thiền tịnh; bạn muốn ăn ki&amp;ecirc;ng, giảm c&amp;acirc;n, thanh lọc cơ thể th&amp;igrave; h&amp;atilde;y đến với kh&amp;oacute;a học dạy nấu m&amp;oacute;n chay dưỡng sinh của ch&amp;uacute;ng t&amp;ocirc;i.&lt;/p&gt;
', N'&lt;p&gt;Sau kh&amp;oacute;a học, học vi&amp;ecirc;n sẽ:&lt;/p&gt;

&lt;p&gt;Biết c&amp;aacute;ch chọn nguy&amp;ecirc;n liệu, gia vị an to&amp;agrave;n, bổ dưỡng để nấu ăn&lt;/p&gt;

&lt;p&gt;C&amp;oacute; chế độ ăn chay ph&amp;ugrave; hợp, đủ chất v&amp;agrave; c&amp;oacute; lợi cho sức khỏe&lt;/p&gt;

&lt;p&gt;Biết c&amp;aacute;ch nấu một số m&amp;oacute;n chay ngon, bổ dưỡng&lt;/p&gt;

&lt;p&gt;Biết được c&amp;aacute;ch ăn uống l&amp;agrave;nh mạnh, thanh lọc cơ thể&lt;/p&gt;
', NULL, 1, CAST(N'2022-03-29 00:16:49.520' AS DateTime), CAST(N'2022-03-29 00:16:49.520' AS DateTime))
SET IDENTITY_INSERT [dbo].[Courses] OFF
SET IDENTITY_INSERT [dbo].[Lessons] ON 

INSERT [dbo].[Lessons] ([Id], [LessonName], [UrlFile], [TimeVideo], [TopicId], [CreatedAt], [UpdatedAt], [Status]) VALUES (1, N'Bài 1:  Listenning', N'/FileUploads/files/Video/Collection%20View%20in%20Table%20View%20Cell%20(Swift%20Tutorial)%20-%20Xcode%2011%2C%20iOS%20Development%20-%20YouTube%20-%20Google%20Chrome%202022-03-23%2023-38-08.mp4', 7.573313, 2, CAST(N'2022-03-25 17:01:29.520' AS DateTime), CAST(N'2022-03-25 17:01:29.520' AS DateTime), 1)
INSERT [dbo].[Lessons] ([Id], [LessonName], [UrlFile], [TimeVideo], [TopicId], [CreatedAt], [UpdatedAt], [Status]) VALUES (2, N'Bài 2: Speaking', N'/FileUploads/files/Video/Collection%20View%20in%20Table%20View%20Cell%20(Swift%20Tutorial)%20-%20Xcode%2011%2C%20iOS%20Development%20-%20YouTube%20-%20Google%20Chrome%202022-03-23%2023-38-08.mp4', 7.573313, 2, CAST(N'2022-03-25 17:02:10.730' AS DateTime), CAST(N'2022-03-25 17:02:10.730' AS DateTime), 1)
INSERT [dbo].[Lessons] ([Id], [LessonName], [UrlFile], [TimeVideo], [TopicId], [CreatedAt], [UpdatedAt], [Status]) VALUES (3, N'Bài 3: Vocabulary', N'/FileUploads/files/Video/Collection%20View%20in%20Table%20View%20Cell%20(Swift%20Tutorial)%20-%20Xcode%2011%2C%20iOS%20Development%20-%20YouTube%20-%20Google%20Chrome%202022-03-23%2023-38-08.mp4', 7.573313, 2, CAST(N'2022-03-25 17:02:37.547' AS DateTime), CAST(N'2022-03-25 17:02:37.547' AS DateTime), 1)
INSERT [dbo].[Lessons] ([Id], [LessonName], [UrlFile], [TimeVideo], [TopicId], [CreatedAt], [UpdatedAt], [Status]) VALUES (4, N'Bài 4: Bài t?p', N'/FileUploads/files/doc/UserProfile.txt', 0, 2, CAST(N'2022-03-25 17:06:03.403' AS DateTime), CAST(N'2022-03-25 17:06:03.403' AS DateTime), 1)
INSERT [dbo].[Lessons] ([Id], [LessonName], [UrlFile], [TimeVideo], [TopicId], [CreatedAt], [UpdatedAt], [Status]) VALUES (5, N'Bài 1:  Listenning chuong 2', N'/FileUploads/files/Video/Collection%20View%20in%20Table%20View%20Cell%20(Swift%20Tutorial)%20-%20Xcode%2011%2C%20iOS%20Development%20-%20YouTube%20-%20Google%20Chrome%202022-03-23%2023-38-08.mp4', 7.573313, 3, CAST(N'2022-03-25 17:07:09.880' AS DateTime), CAST(N'2022-03-25 17:07:09.880' AS DateTime), 1)
INSERT [dbo].[Lessons] ([Id], [LessonName], [UrlFile], [TimeVideo], [TopicId], [CreatedAt], [UpdatedAt], [Status]) VALUES (6, N'Bài 1:  Listenning chuong 3', N'/FileUploads/files/Video/Collection%20View%20in%20Table%20View%20Cell%20(Swift%20Tutorial)%20-%20Xcode%2011%2C%20iOS%20Development%20-%20YouTube%20-%20Google%20Chrome%202022-03-23%2023-38-08.mp4', 7.573313, 3, CAST(N'2022-03-25 17:07:18.750' AS DateTime), CAST(N'2022-03-25 17:07:18.750' AS DateTime), 1)
INSERT [dbo].[Lessons] ([Id], [LessonName], [UrlFile], [TimeVideo], [TopicId], [CreatedAt], [UpdatedAt], [Status]) VALUES (7, N'Bài 3: Vocabulary chuong 2', N'/FileUploads/files/Video/Collection%20View%20in%20Table%20View%20Cell%20(Swift%20Tutorial)%20-%20Xcode%2011%2C%20iOS%20Development%20-%20YouTube%20-%20Google%20Chrome%202022-03-23%2023-38-08.mp4', 7.573313, 3, CAST(N'2022-03-25 17:07:53.287' AS DateTime), CAST(N'2022-03-25 17:07:53.287' AS DateTime), 1)
INSERT [dbo].[Lessons] ([Id], [LessonName], [UrlFile], [TimeVideo], [TopicId], [CreatedAt], [UpdatedAt], [Status]) VALUES (8, N'Bài 4: Bài t?p4 chuong 2', N'/FileUploads/files/doc/UserProfile.txt', 0, 3, CAST(N'2022-03-25 17:08:20.000' AS DateTime), CAST(N'2022-03-25 17:10:40.327' AS DateTime), 1)
INSERT [dbo].[Lessons] ([Id], [LessonName], [UrlFile], [TimeVideo], [TopicId], [CreatedAt], [UpdatedAt], [Status]) VALUES (9, N'Bài 1', N'/FileUploads/files/Video/Collection%20View%20in%20Table%20View%20Cell%20(Swift%20Tutorial)%20-%20Xcode%2011%2C%20iOS%20Development%20-%20YouTube%20-%20Google%20Chrome%202022-03-23%2023-38-08.mp4', 7.573313, 4, CAST(N'2022-03-25 17:08:51.547' AS DateTime), CAST(N'2022-03-25 17:08:51.547' AS DateTime), 1)
INSERT [dbo].[Lessons] ([Id], [LessonName], [UrlFile], [TimeVideo], [TopicId], [CreatedAt], [UpdatedAt], [Status]) VALUES (10, N'Bài 2: Speaking2 chuong 3', N'/FileUploads/files/Video/Collection%20View%20in%20Table%20View%20Cell%20(Swift%20Tutorial)%20-%20Xcode%2011%2C%20iOS%20Development%20-%20YouTube%20-%20Google%20Chrome%202022-03-23%2023-38-08.mp4', 7.573313, 4, CAST(N'2022-03-25 17:09:07.140' AS DateTime), CAST(N'2022-03-25 17:09:07.140' AS DateTime), 1)
INSERT [dbo].[Lessons] ([Id], [LessonName], [UrlFile], [TimeVideo], [TopicId], [CreatedAt], [UpdatedAt], [Status]) VALUES (11, N'Bài 3', N'/FileUploads/files/Video/Collection%20View%20in%20Table%20View%20Cell%20(Swift%20Tutorial)%20-%20Xcode%2011%2C%20iOS%20Development%20-%20YouTube%20-%20Google%20Chrome%202022-03-23%2023-38-08.mp4', 7.573313, 4, CAST(N'2022-03-25 17:09:25.843' AS DateTime), CAST(N'2022-03-25 17:09:25.843' AS DateTime), 1)
INSERT [dbo].[Lessons] ([Id], [LessonName], [UrlFile], [TimeVideo], [TopicId], [CreatedAt], [UpdatedAt], [Status]) VALUES (12, N'Bài 4: Bài t?p4 chuong 3', N'/FileUploads/files/doc/UserProfile.txt', 0, 4, CAST(N'2022-03-25 17:09:54.500' AS DateTime), CAST(N'2022-03-25 17:09:54.500' AS DateTime), 1)
INSERT [dbo].[Lessons] ([Id], [LessonName], [UrlFile], [TimeVideo], [TopicId], [CreatedAt], [UpdatedAt], [Status]) VALUES (13, N'Bài 5: Bài t?p v? nhà t?p nói', N'/FileUploads/files/Video/Collection%20View%20in%20Table%20View%20Cell%20(Swift%20Tutorial)%20-%20Xcode%2011%2C%20iOS%20Development%20-%20YouTube%20-%20Google%20Chrome%202022-03-23%2023-38-08.mp4', 7.573313, 4, CAST(N'2022-03-26 14:42:34.153' AS DateTime), CAST(N'2022-03-26 14:42:34.153' AS DateTime), 1)
INSERT [dbo].[Lessons] ([Id], [LessonName], [UrlFile], [TimeVideo], [TopicId], [CreatedAt], [UpdatedAt], [Status]) VALUES (14, N'Bài 6: Bài t?p v? nhà t?p d?c', N'https://res.cloudinary.com/phamthanghehe/video/upload/v1648405185/nzgm5yxk8sf43snvuxjc.mp4', 11, 4, CAST(N'2022-03-26 22:55:41.000' AS DateTime), CAST(N'2022-03-28 01:22:06.007' AS DateTime), 1)
INSERT [dbo].[Lessons] ([Id], [LessonName], [UrlFile], [TimeVideo], [TopicId], [CreatedAt], [UpdatedAt], [Status]) VALUES (15, N'Bài 5: Bài t?p nghe d?c ', N'https://res.cloudinary.com/phamthanghehe/video/upload/v1648404950/ojnuh7ikocrk7ymmjuhw.mp4', 13, 3, CAST(N'2022-03-26 22:57:34.973' AS DateTime), CAST(N'2022-03-26 22:57:34.973' AS DateTime), 1)
INSERT [dbo].[Lessons] ([Id], [LessonName], [UrlFile], [TimeVideo], [TopicId], [CreatedAt], [UpdatedAt], [Status]) VALUES (16, N'Bài 1: Gi?i thi?u chung v? gi?ng viên và khóa h?c', N'/FileUploads/files/Video/Collection%20View%20in%20Table%20View%20Cell%20(Swift%20Tutorial)%20-%20Xcode%2011%2C%20iOS%20Development%20-%20YouTube%20-%20Google%20Chrome%202022-03-23%2023-38-08.mp4', 7.573313, 5, CAST(N'2022-03-29 00:20:28.320' AS DateTime), CAST(N'2022-03-29 00:20:28.320' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Lessons] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'lecture   ')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'admin     ')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Topic] ON 

INSERT [dbo].[Topic] ([Id], [TopicName], [CourseId], [CreatedAt], [UpdatedAt], [Status]) VALUES (1, N'Chương I: Giới thiệu', 1, CAST(N'2022-03-23 17:48:54.603' AS DateTime), CAST(N'2022-03-23 17:48:54.603' AS DateTime), 1)
INSERT [dbo].[Topic] ([Id], [TopicName], [CourseId], [CreatedAt], [UpdatedAt], [Status]) VALUES (2, N'Chương 1: Answering the phone calls from recruiters', 5, CAST(N'2022-03-25 16:46:41.873' AS DateTime), CAST(N'2022-03-25 16:46:41.873' AS DateTime), 1)
INSERT [dbo].[Topic] ([Id], [TopicName], [CourseId], [CreatedAt], [UpdatedAt], [Status]) VALUES (3, N'Chương 2: Introduce yourself in a job interview', 5, CAST(N'2022-03-25 16:47:08.470' AS DateTime), CAST(N'2022-03-25 16:47:08.470' AS DateTime), 1)
INSERT [dbo].[Topic] ([Id], [TopicName], [CourseId], [CreatedAt], [UpdatedAt], [Status]) VALUES (4, N'Chương 3: Answering questions in a job interview', 5, CAST(N'2022-03-25 16:48:10.297' AS DateTime), CAST(N'2022-03-25 16:48:10.297' AS DateTime), 1)
INSERT [dbo].[Topic] ([Id], [TopicName], [CourseId], [CreatedAt], [UpdatedAt], [Status]) VALUES (5, N'Chương 1: Giới thiệu chung', 7, CAST(N'2022-03-29 00:17:47.697' AS DateTime), CAST(N'2022-03-29 00:17:47.697' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Topic] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [UserName], [Password], [RoleId], [FullName], [Email], [Phone], [Avatar], [DateOfBirth], [Gender], [Address], [Status], [CreatedAt], [UpdatedAt]) VALUES (2, N'admin', N'e10adc3949ba59abbe56e057f20f883e', 1, N'ducthangedit1', N'thang@gmail.com', N'09675675765         ', N'test.jpg', CAST(N'2002-07-07' AS Date), 1, N'thanhson-phutho', 1, CAST(N'2002-07-07 00:00:00.000' AS DateTime), CAST(N'2022-03-20 03:45:26.427' AS DateTime))
INSERT [dbo].[User] ([Id], [UserName], [Password], [RoleId], [FullName], [Email], [Phone], [Avatar], [DateOfBirth], [Gender], [Address], [Status], [CreatedAt], [UpdatedAt]) VALUES (18, N'ha thi d', N'123457', 1, N'Hà Nam Phương', N'thang113@gmail.com', N'0833281777          ', N'tes.jpg', CAST(N'2022-03-23' AS Date), 0, N'Thanh Sơn', 0, CAST(N'2022-03-23 04:22:52.697' AS DateTime), CAST(N'2022-03-23 04:22:52.700' AS DateTime))
INSERT [dbo].[User] ([Id], [UserName], [Password], [RoleId], [FullName], [Email], [Phone], [Avatar], [DateOfBirth], [Gender], [Address], [Status], [CreatedAt], [UpdatedAt]) VALUES (19, N'ha thi e', N'123457', 1, N'Hà Nam Phương', N'thang113@gmail.com', N'0833281777          ', N'/FileUploads/images/Avatar_user/1.png', CAST(N'2022-03-23' AS Date), 1, N'Thanh Sơn', 0, CAST(N'2022-03-23 10:15:12.780' AS DateTime), CAST(N'2022-03-23 10:15:12.793' AS DateTime))
INSERT [dbo].[User] ([Id], [UserName], [Password], [RoleId], [FullName], [Email], [Phone], [Avatar], [DateOfBirth], [Gender], [Address], [Status], [CreatedAt], [UpdatedAt]) VALUES (20, N'nguyen thi h', N'123456', 1, N'Hà Nam Phương', N'thang@gmail.com', N'0833281777          ', N'tes.jpg', CAST(N'2022-03-19' AS Date), 1, N'Thanh Sơn', 1, CAST(N'2022-03-19 15:54:03.000' AS DateTime), CAST(N'2022-03-20 04:06:59.537' AS DateTime))
INSERT [dbo].[User] ([Id], [UserName], [Password], [RoleId], [FullName], [Email], [Phone], [Avatar], [DateOfBirth], [Gender], [Address], [Status], [CreatedAt], [UpdatedAt]) VALUES (21, N'nguyen thi g', N'123457', 1, N'Hà Nam Phương', N'thang@gmail.com', N'0833281777          ', N'tes.jpg', CAST(N'2022-03-19' AS Date), 0, N'Thanh Sơn', 1, CAST(N'2022-03-19 15:54:43.000' AS DateTime), CAST(N'2022-03-20 04:06:44.590' AS DateTime))
INSERT [dbo].[User] ([Id], [UserName], [Password], [RoleId], [FullName], [Email], [Phone], [Avatar], [DateOfBirth], [Gender], [Address], [Status], [CreatedAt], [UpdatedAt]) VALUES (22, N'nguyen thi i', N'123456', 1, N'Hà Nam Phương', N'pdthang999@gmail.com', N'08332817788         ', N'tes.jpg', CAST(N'2022-03-19' AS Date), 1, N'Thanh Sơn', 1, CAST(N'2022-03-19 16:09:27.000' AS DateTime), CAST(N'2022-03-20 03:54:39.600' AS DateTime))
INSERT [dbo].[User] ([Id], [UserName], [Password], [RoleId], [FullName], [Email], [Phone], [Avatar], [DateOfBirth], [Gender], [Address], [Status], [CreatedAt], [UpdatedAt]) VALUES (23, N'hathino', N'123456', 1, N'hathin', N'thang@gmail.com', N'0833281777          ', N'phutho', CAST(N'2022-03-20' AS Date), 0, N'Thanh Sơn', 1, CAST(N'2022-03-20 03:35:18.000' AS DateTime), CAST(N'2022-03-20 03:53:16.417' AS DateTime))
INSERT [dbo].[User] ([Id], [UserName], [Password], [RoleId], [FullName], [Email], [Phone], [Avatar], [DateOfBirth], [Gender], [Address], [Status], [CreatedAt], [UpdatedAt]) VALUES (24, N'manhcuong', N'jai1234', 1, N'Hà Nam Phương', N'thang113@gmail.com', N'0833281777          ', N'~/FileUploads/images/avatars/avatar-default.jpg', CAST(N'2022-03-20' AS Date), 1, N'Thanh Sơn', 1, CAST(N'2022-03-20 20:14:46.210' AS DateTime), CAST(N'2022-03-20 20:14:46.210' AS DateTime))
INSERT [dbo].[User] ([Id], [UserName], [Password], [RoleId], [FullName], [Email], [Phone], [Avatar], [DateOfBirth], [Gender], [Address], [Status], [CreatedAt], [UpdatedAt]) VALUES (25, N'manhcuong', N'jai1234', 1, N'Hà Nam Phương', N'thang112@gmail.com', N'0833281777          ', N'~/FileUploads/images/avatars/avatar-default.jpg', CAST(N'2022-03-20' AS Date), 0, N'Thanh Sơn', 1, CAST(N'2022-03-20 20:16:19.263' AS DateTime), CAST(N'2022-03-20 20:16:19.263' AS DateTime))
INSERT [dbo].[User] ([Id], [UserName], [Password], [RoleId], [FullName], [Email], [Phone], [Avatar], [DateOfBirth], [Gender], [Address], [Status], [CreatedAt], [UpdatedAt]) VALUES (26, N'test upload image', N'jai1234', 1, N'Hà Nam Phương', N'thang@gmail.com', N'0833281777          ', N'~/FileUploads/images/avatars/avatar-default.jpg', CAST(N'2022-03-20' AS Date), 0, N'Thanh Sơn', 1, CAST(N'2022-03-20 21:24:01.843' AS DateTime), CAST(N'2022-03-20 21:24:01.843' AS DateTime))
INSERT [dbo].[User] ([Id], [UserName], [Password], [RoleId], [FullName], [Email], [Phone], [Avatar], [DateOfBirth], [Gender], [Address], [Status], [CreatedAt], [UpdatedAt]) VALUES (27, N'nguyen thi canh', N'1324556', 1, N'Hà Nam Phương', N'thang@gmail.com', N'0833281777          ', N'~/FileUploads/images/avatars/avatar-default.jpg', CAST(N'2022-03-20' AS Date), 0, N'Thanh Sơn', 1, CAST(N'2022-03-20 21:27:49.027' AS DateTime), CAST(N'2022-03-20 21:27:49.030' AS DateTime))
INSERT [dbo].[User] ([Id], [UserName], [Password], [RoleId], [FullName], [Email], [Phone], [Avatar], [DateOfBirth], [Gender], [Address], [Status], [CreatedAt], [UpdatedAt]) VALUES (28, N'test thoi', N'1324556', 1, N'Hà Nam Phương', N'thang@gmail.com', N'0833281777          ', N'/FileUploads/images/Avatar_user/avatar-default.jpg', CAST(N'2022-03-21' AS Date), 1, N'Thanh Sơn', 1, CAST(N'2022-03-21 11:39:53.430' AS DateTime), CAST(N'2022-03-21 11:39:53.430' AS DateTime))
INSERT [dbo].[User] ([Id], [UserName], [Password], [RoleId], [FullName], [Email], [Phone], [Avatar], [DateOfBirth], [Gender], [Address], [Status], [CreatedAt], [UpdatedAt]) VALUES (29, N'manhcuong', N'jai1234', 2, N'Hà Nam Phương', N'thang@gmail.com', N'0833281777          ', N'/FileUploads/images/Avatar_user/2.png', CAST(N'2022-03-21' AS Date), 0, N'Thanh Sơn', 1, CAST(N'2022-03-21 11:50:10.000' AS DateTime), CAST(N'2022-03-21 17:12:54.773' AS DateTime))
INSERT [dbo].[User] ([Id], [UserName], [Password], [RoleId], [FullName], [Email], [Phone], [Avatar], [DateOfBirth], [Gender], [Address], [Status], [CreatedAt], [UpdatedAt]) VALUES (30, N'Nguyen van n', N'123457', 1, N'Hà Nam Phương', N'thang@gmail.com', N'0833281777          ', N'/FileUploads/images/Avatar_user/Usercase%20ho%C3%A0n%20ch%E1%BB%89nh.png', CAST(N'2022-03-21' AS Date), 1, N'Thanh Sơn', 1, CAST(N'2022-03-21 16:27:31.000' AS DateTime), CAST(N'2022-03-21 17:14:34.827' AS DateTime))
INSERT [dbo].[User] ([Id], [UserName], [Password], [RoleId], [FullName], [Email], [Phone], [Avatar], [DateOfBirth], [Gender], [Address], [Status], [CreatedAt], [UpdatedAt]) VALUES (32, N'nguyenvanm', N'987987', 1, N'nguyen van m', N'nguyenvanm@gmail.com', N'098765445678        ', N'/FileUploads/images/Avatar_user/hot-girl-anh-the.jpeg', CAST(N'2022-03-22' AS Date), 1, N'Thanh Sơn', 1, CAST(N'2022-03-22 03:23:01.567' AS DateTime), CAST(N'2022-03-22 03:23:01.567' AS DateTime))
INSERT [dbo].[User] ([Id], [UserName], [Password], [RoleId], [FullName], [Email], [Phone], [Avatar], [DateOfBirth], [Gender], [Address], [Status], [CreatedAt], [UpdatedAt]) VALUES (33, N'manhcuong', N'07613fd8f333b033730a1f9c8fae655f', 2, N'Hà Nam Phương', N'thang111@gmail.com', N'0833281777          ', N'/FileUploads/images/Avatar_user/hot-girl-anh-the.jpeg', CAST(N'2022-03-22' AS Date), 1, N'Thanh Sơn', 1, CAST(N'2022-03-22 03:38:46.000' AS DateTime), CAST(N'2022-03-22 03:39:09.210' AS DateTime))
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Categories] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Categories_Categories]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Categories]
GO
ALTER TABLE [dbo].[Lessons]  WITH CHECK ADD  CONSTRAINT [FK_Lesson_Topic] FOREIGN KEY([TopicId])
REFERENCES [dbo].[Topic] ([Id])
GO
ALTER TABLE [dbo].[Lessons] CHECK CONSTRAINT [FK_Lesson_Topic]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Courses] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Courses]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_User]
GO
ALTER TABLE [dbo].[Topic]  WITH CHECK ADD  CONSTRAINT [FK_Topic_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([Id])
GO
ALTER TABLE [dbo].[Topic] CHECK CONSTRAINT [FK_Topic_Course]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_User] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_User]
GO
USE [master]
GO
ALTER DATABASE [CourseOnline] SET  READ_WRITE 
GO
