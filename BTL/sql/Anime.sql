USE [master]
GO
/****** Object:  Database [Anime]    Script Date: 10/30/2023 11:40:52 AM ******/
CREATE DATABASE [Anime]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Anime', FILENAME = N'D:\program files\MSSQL16.MSSQLSERVER\MSSQL\DATA\Anime.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Anime_log', FILENAME = N'D:\program files\MSSQL16.MSSQLSERVER\MSSQL\DATA\Anime_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Anime] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Anime].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Anime] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Anime] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Anime] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Anime] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Anime] SET ARITHABORT OFF 
GO
ALTER DATABASE [Anime] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Anime] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Anime] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Anime] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Anime] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Anime] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Anime] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Anime] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Anime] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Anime] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Anime] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Anime] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Anime] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Anime] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Anime] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Anime] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Anime] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Anime] SET RECOVERY FULL 
GO
ALTER DATABASE [Anime] SET  MULTI_USER 
GO
ALTER DATABASE [Anime] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Anime] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Anime] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Anime] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Anime] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Anime] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Anime', N'ON'
GO
ALTER DATABASE [Anime] SET QUERY_STORE = ON
GO
ALTER DATABASE [Anime] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Anime]
GO
/****** Object:  Table [dbo].[Anime]    Script Date: 10/30/2023 11:40:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Anime](
	[MaAnime] [int] IDENTITY(1,1) NOT NULL,
	[TenPhim] [nvarchar](50) NOT NULL,
	[SoTap] [int] NULL,
	[LuotView] [int] NULL,
	[Anh] [nvarchar](50) NULL,
	[Trend] [int] NULL,
	[MaTheLoai] [int] NULL,
	[MaLichChieu] [int] NULL,
	[MaQuocGia] [int] NULL,
	[MaTrangThai] [int] NULL,
	[ThoiLuongPhim] [int] NULL,
	[MoTa] [nvarchar](max) NULL,
	[NamPhatHanh] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaAnime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BinhLuan]    Script Date: 10/30/2023 11:40:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinhLuan](
	[MaBinhLuan] [int] IDENTITY(1,1) NOT NULL,
	[MaTaiKhoan] [int] NULL,
	[MaAnime] [int] NULL,
	[NoiDung] [nvarchar](max) NOT NULL,
	[ThoiGian] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaBinhLuan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LichChieu]    Script Date: 10/30/2023 11:40:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichChieu](
	[MaLichChieu] [int] IDENTITY(1,1) NOT NULL,
	[ThoiGianChieu] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLichChieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuocGia]    Script Date: 10/30/2023 11:40:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuocGia](
	[MaQuocGia] [int] IDENTITY(1,1) NOT NULL,
	[TenQuocGia] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaQuocGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 10/30/2023 11:40:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[MaTaiKhoan] [int] IDENTITY(1,1) NOT NULL,
	[TenTaiKhoan] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheLoai]    Script Date: 10/30/2023 11:40:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheLoai](
	[MaTheLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenTheLoai] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTheLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrangThai]    Script Date: 10/30/2023 11:40:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrangThai](
	[MaTrangThai] [int] IDENTITY(1,1) NOT NULL,
	[TenTrangThai] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTrangThai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ViDeo]    Script Date: 10/30/2023 11:40:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ViDeo](
	[MaViDeo] [int] IDENTITY(1,1) NOT NULL,
	[MaAnime] [int] NULL,
	[TapSo] [int] NULL,
	[ViDeo_url] [nvarchar](50) NULL,
	[Anh] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaViDeo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Anime] ON 

INSERT [dbo].[Anime] ([MaAnime], [TenPhim], [SoTap], [LuotView], [Anh], [Trend], [MaTheLoai], [MaLichChieu], [MaQuocGia], [MaTrangThai], [ThoiLuongPhim], [MoTa], [NamPhatHanh]) VALUES (43, N'Kizuna no Allele', 12, 32, N'Kizuna-no-Allele.jpg', 1, 13, 1, 1, 1, 23, N'Câu chuyện về Miracle, một thực tập sinh nghệ sĩ ảo, và những người bạn của cô trong quá trình theo đuổi ước mơ.', CAST(N'2023-03-21' AS Date))
INSERT [dbo].[Anime] ([MaAnime], [TenPhim], [SoTap], [LuotView], [Anh], [Trend], [MaTheLoai], [MaLichChieu], [MaQuocGia], [MaTrangThai], [ThoiLuongPhim], [MoTa], [NamPhatHanh]) VALUES (44, N'Odd Taxi', 13, 15, N'odd-taxi.jpg', 0, 6, 2, 1, 1, 23, N'Câu chuyện về Odokawa, một tài xế taxi bí ẩn, và những khách hàng kỳ lạ của anh.', CAST(N'2021-11-22' AS Date))
INSERT [dbo].[Anime] ([MaAnime], [TenPhim], [SoTap], [LuotView], [Anh], [Trend], [MaTheLoai], [MaLichChieu], [MaQuocGia], [MaTrangThai], [ThoiLuongPhim], [MoTa], [NamPhatHanh]) VALUES (45, N'One Piece', 1017, 25, N'one-piece.jpg', 1, 2, 5, 1, 1, 24, N'Câu chuyện về Monkey D. Luffy, một cậu bé có khả năng co dãn như cao su, và nhóm hải tặc của cậu trong hành trình tìm kiếm kho báu One Piece.', CAST(N'1990-02-14' AS Date))
INSERT [dbo].[Anime] ([MaAnime], [TenPhim], [SoTap], [LuotView], [Anh], [Trend], [MaTheLoai], [MaLichChieu], [MaQuocGia], [MaTrangThai], [ThoiLuongPhim], [MoTa], [NamPhatHanh]) VALUES (46, N'Naruto', 500, 18, N'naruto.jpg', 0, 2, 8, 1, 2, 22, N'Câu chuyện về Naruto Uzumaki, một ninja trẻ có trong người chứa linh thú Cửu Vĩ Hồ Ly, và những cuộc phiêu lưu của cậu cùng bạn bè.', CAST(N'2002-12-04' AS Date))
INSERT [dbo].[Anime] ([MaAnime], [TenPhim], [SoTap], [LuotView], [Anh], [Trend], [MaTheLoai], [MaLichChieu], [MaQuocGia], [MaTrangThai], [ThoiLuongPhim], [MoTa], [NamPhatHanh]) VALUES (47, N'Attack on Titan', 75, 23, N'AOT.jpg', 1, 1, 3, 1, 1, 24, N'Câu chuyện về Eren Yeager, một thiếu niên sống trong thế giới bị Titan - những sinh vật khổng lồ - đe dọa, và cuộc chiến chống lại chúng của nhân loại.', CAST(N'2013-02-14' AS Date))
INSERT [dbo].[Anime] ([MaAnime], [TenPhim], [SoTap], [LuotView], [Anh], [Trend], [MaTheLoai], [MaLichChieu], [MaQuocGia], [MaTrangThai], [ThoiLuongPhim], [MoTa], [NamPhatHanh]) VALUES (48, N'Demon Slayer: Kimetsu no Yaiba', 26, 26, N'KNY.jpg', 1, 2, 6, 1, 1, 24, N'Câu chuyện về Tanjiro Kamado, một cậu bé trở thành thợ săn quỷ sau khi gia đình của cậu bị giết và em gái của cậu bị biến thành quỷ.', CAST(N'2019-04-23' AS Date))
INSERT [dbo].[Anime] ([MaAnime], [TenPhim], [SoTap], [LuotView], [Anh], [Trend], [MaTheLoai], [MaLichChieu], [MaQuocGia], [MaTrangThai], [ThoiLuongPhim], [MoTa], [NamPhatHanh]) VALUES (49, N'Black Clover', 170, 23, N'BlackClover.jpg', 0, 7, 8, 1, 2, 24, N'Câu chuyện về Asta và Yuno, hai cậu bé có giấc mơ trở thành Wizard King - người mạnh nhất trong thế giới phép thuật.', CAST(N'2017-03-25' AS Date))
INSERT [dbo].[Anime] ([MaAnime], [TenPhim], [SoTap], [LuotView], [Anh], [Trend], [MaTheLoai], [MaLichChieu], [MaQuocGia], [MaTrangThai], [ThoiLuongPhim], [MoTa], [NamPhatHanh]) VALUES (50, N'Fruit Basket', 63, 13, N'fruits-basket.jpg', 0, 10, 2, 1, 1, 24, N'Câu chuyện về Tohru Honda, một cô gái sống với gia đình Soma - người bị nguyền rủa biến thành các con vật trong lịch âm khi tiếp xúc với người khác giới.', CAST(N'2019-12-24' AS Date))
INSERT [dbo].[Anime] ([MaAnime], [TenPhim], [SoTap], [LuotView], [Anh], [Trend], [MaTheLoai], [MaLichChieu], [MaQuocGia], [MaTrangThai], [ThoiLuongPhim], [MoTa], [NamPhatHanh]) VALUES (51, N'My Hero Academia', 106, 23, N'MyHeroAcademia.jpg', 0, 13, 4, 1, 1, 24, N'Câu chuyện về Izuku Midoriya, một cậu bé không có quyền năng siêu nhiên nhưng vẫn quyết tâm trở thành anh hùng trong một thế giới đầy những người có quyền năng.', CAST(N'2016-03-15' AS Date))
INSERT [dbo].[Anime] ([MaAnime], [TenPhim], [SoTap], [LuotView], [Anh], [Trend], [MaTheLoai], [MaLichChieu], [MaQuocGia], [MaTrangThai], [ThoiLuongPhim], [MoTa], [NamPhatHanh]) VALUES (52, N'Doraemon', 1787, 23, N'Doraemon.jpg', 1, 13, 5, 1, 1, 11, N'Câu chuyện về Doraemon, một chú mèo máy đến từ tương lai, và những cuộc phiêu lưu của anh cùng Nobita và bạn bè.', CAST(N'2005-02-12' AS Date))
INSERT [dbo].[Anime] ([MaAnime], [TenPhim], [SoTap], [LuotView], [Anh], [Trend], [MaTheLoai], [MaLichChieu], [MaQuocGia], [MaTrangThai], [ThoiLuongPhim], [MoTa], [NamPhatHanh]) VALUES (56, N'One Punch Man', 24, 25, N'OnePunchMan.jpg', 1, 1, 9, 1, 3, 24, N'Câu chuyện về Saitama, một anh chàng có thể đánh bại bất kỳ kẻ thù nào chỉ với một cú đấm, và sự chán nản của anh khi không tìm được đối thủ xứng tầm.', CAST(N'2015-03-14' AS Date))
INSERT [dbo].[Anime] ([MaAnime], [TenPhim], [SoTap], [LuotView], [Anh], [Trend], [MaTheLoai], [MaLichChieu], [MaQuocGia], [MaTrangThai], [ThoiLuongPhim], [MoTa], [NamPhatHanh]) VALUES (57, N'Pokemon', 1150, 24, N'Pokemon.jpg', 0, 2, 5, 1, 1, 24, N'Câu chuyện về Ash Ketchum, một huấn luyện viên Pokemon, và những cuộc phiêu lưu của anh cùng Pikachu và các Pokemon khác.', CAST(N'1997-02-15' AS Date))
INSERT [dbo].[Anime] ([MaAnime], [TenPhim], [SoTap], [LuotView], [Anh], [Trend], [MaTheLoai], [MaLichChieu], [MaQuocGia], [MaTrangThai], [ThoiLuongPhim], [MoTa], [NamPhatHanh]) VALUES (58, N'Detective Conan', 1000, 25, N'DetectiveConan.jpg', 1, 1, 7, 1, 1, 25, N'Câu chuyện về Shinichi Kudo, một thám tử thiên tài bị biến thành cậu bé Conan Edogawa sau khi uống một loại thuốc bí ẩn, và những vụ án mà cậu giải quyết.', CAST(N'1996-03-15' AS Date))
INSERT [dbo].[Anime] ([MaAnime], [TenPhim], [SoTap], [LuotView], [Anh], [Trend], [MaTheLoai], [MaLichChieu], [MaQuocGia], [MaTrangThai], [ThoiLuongPhim], [MoTa], [NamPhatHanh]) VALUES (59, N'Hunter x Hunter', 148, 18, N'HunterxHunter.jpg', 0, 17, 9, 1, 3, 23, N'Câu chuyện về Gon Freecss, một cậu bé muốn trở thành thợ săn để tìm cha mình, và những người bạn của cậu trong cuộc thi Hunter Exam và các cuộc phiêu lưu sau đó.', CAST(N'2011-02-13' AS Date))
INSERT [dbo].[Anime] ([MaAnime], [TenPhim], [SoTap], [LuotView], [Anh], [Trend], [MaTheLoai], [MaLichChieu], [MaQuocGia], [MaTrangThai], [ThoiLuongPhim], [MoTa], [NamPhatHanh]) VALUES (60, N'Dragon Ball Z', 291, 25, N'DragonBallZ.jpg', 1, 1, 8, 1, 2, 26, N'Câu chuyện tiếp nối Dragon Ball, kể về Goku và những người bạn của anh trong cuộc chiến chống lại các kẻ thù từ ngoài hành tinh và các kẻ muốn hủy diệt Trái Đất.', CAST(N'1989-12-04' AS Date))
INSERT [dbo].[Anime] ([MaAnime], [TenPhim], [SoTap], [LuotView], [Anh], [Trend], [MaTheLoai], [MaLichChieu], [MaQuocGia], [MaTrangThai], [ThoiLuongPhim], [MoTa], [NamPhatHanh]) VALUES (61, N'Bleach', 366, 19, N'Bleach.jpg', 1, 1, 8, 1, 2, 24, N'Câu chuyện về Ichigo Kurosaki, một thiếu niên có khả năng nhìn thấy linh hồn, và vai trò của anh là một Shinigami - sứ giả thần chết - trong việc bảo vệ thế giới sống và thế giới âm.', CAST(N'2004-04-25' AS Date))
INSERT [dbo].[Anime] ([MaAnime], [TenPhim], [SoTap], [LuotView], [Anh], [Trend], [MaTheLoai], [MaLichChieu], [MaQuocGia], [MaTrangThai], [ThoiLuongPhim], [MoTa], [NamPhatHanh]) VALUES (62, N'Fullmetal Alchemist: Brotherhood', 64, 16, N'FullmetalAlchemistBrotherhood.jpg', 1, 2, 8, 1, 2, 24, N'Câu chuyện về Edward và Alphonse Elric, hai anh em sử dụng nghệ thuật chuyển hóa để cố gắng hồi phục cơ thể của họ sau khi thất bại trong việc hồi sinh người mẹ đã mất.', CAST(N'2009-06-30' AS Date))
INSERT [dbo].[Anime] ([MaAnime], [TenPhim], [SoTap], [LuotView], [Anh], [Trend], [MaTheLoai], [MaLichChieu], [MaQuocGia], [MaTrangThai], [ThoiLuongPhim], [MoTa], [NamPhatHanh]) VALUES (63, N'Code Geass: Lelouch of the Rebellion', 50, 14, N'CodeGeass.jpg', 0, 1, 8, 1, 2, 24, N'Câu chuyện về Lelouch vi Britannia, một hoàng tử bị lưu đày của đế quốc Britannia, và khả năng Geass của anh - sức mạnh cho phép anh ra lệnh cho bất kỳ ai nhìn vào mắt anh. Lelouch sử dụng Geass để dẫn dắt cuộc khởi nghĩa chống lại Britannia và trả thù cha mẹ của anh.', CAST(N'2006-02-15' AS Date))
INSERT [dbo].[Anime] ([MaAnime], [TenPhim], [SoTap], [LuotView], [Anh], [Trend], [MaTheLoai], [MaLichChieu], [MaQuocGia], [MaTrangThai], [ThoiLuongPhim], [MoTa], [NamPhatHanh]) VALUES (64, N'Dr. STONE', 35, 27, N'DrSTONE.jpg', 1, 1, 4, 1, 1, 24, N'Câu chuyện về Senku Ishigami, một thiên tài khoa học, và những người bạn của anh trong việc tái thiết văn minh nhân loại sau khi toàn bộ loài người bị biến thành đá bởi ánh sáng bí ẩn. Senku sử dụng kiến thức khoa học của anh để tạo ra các công cụ, vũ khí và phương thuốc để giải thoát những người khác khỏi trạng thái đá và đối đầu với những kẻ thù muốn xóa bỏ khoa học.', CAST(N'2019-11-23' AS Date))
INSERT [dbo].[Anime] ([MaAnime], [TenPhim], [SoTap], [LuotView], [Anh], [Trend], [MaTheLoai], [MaLichChieu], [MaQuocGia], [MaTrangThai], [ThoiLuongPhim], [MoTa], [NamPhatHanh]) VALUES (65, N'Overlord', 39, 18, N'Overlord.jpg', 0, 1, 8, 1, 2, 24, N'Câu chuyện về Momonga, một người chơi trò chơi trực tuyến DMMO-RPG Yggdrasil, và những NPC trong căn cứ của anh khi họ bị mắc kẹt trong thế giới trò chơi sau khi máy chủ bị đóng cửa. Momonga quyết định khám phá thế giới mới và tìm hiểu về những sinh vật và quy luật trong đó. Anh cũng phải bảo vệ căn cứ của anh khỏi những kẻ muốn chiếm đoạt hoặc phá hủy nó.', CAST(N'2015-03-15' AS Date))
INSERT [dbo].[Anime] ([MaAnime], [TenPhim], [SoTap], [LuotView], [Anh], [Trend], [MaTheLoai], [MaLichChieu], [MaQuocGia], [MaTrangThai], [ThoiLuongPhim], [MoTa], [NamPhatHanh]) VALUES (66, N'Akashic Records Of Bastard Magic Instructor', 12, 18, N'AkashicRecordsOfBastardMagicInstructo.jpg', 0, 11, 8, 1, 2, 24, N'Câu chuyện về Glenn Radars, một giáo viên phép thuật biếng nhác và thiếu trách nhiệm, và những học sinh của anh tại Học viện Phép thuật Hoàng gia Alzano. Glenn dần dần thay đổi cách dạy của anh và trở thành một giáo viên tốt hơn khi anh phải đối mặt với những thử thách và nguy hiểm từ những kẻ muốn lợi dụng Bản ghi Akashic - nguồn gốc của mọi phép thuật.', CAST(N'2017-04-16' AS Date))
INSERT [dbo].[Anime] ([MaAnime], [TenPhim], [SoTap], [LuotView], [Anh], [Trend], [MaTheLoai], [MaLichChieu], [MaQuocGia], [MaTrangThai], [ThoiLuongPhim], [MoTa], [NamPhatHanh]) VALUES (67, N'Tower Of God', 13, 19, N'TowerOfGod.jpg', 0, 7, 8, 1, 2, 24, N'Câu chuyện về Bam, một cậu bé bị mắc kẹt dưới một ngọn tháp khổng lồ, và Rachel, người bạn duy nhất của cậu. Khi Rachel quyết định leo lên tháp để đạt được ngôi sao, Bam cũng theo sau cô và phải vượt qua những thử thách và nguy hiểm trong tháp. Tháp là nơi có thể đáp ứng mọi mong muốn của con người, nhưng cũng là nơi đầy rẫy âm mưu và hiểm nguy. Bam sẽ phải đối mặt với những kẻ bạn và kẻ thù trong cuộc hành trình của mình để tìm lại Rachel.', CAST(N'2020-02-16' AS Date))
INSERT [dbo].[Anime] ([MaAnime], [TenPhim], [SoTap], [LuotView], [Anh], [Trend], [MaTheLoai], [MaLichChieu], [MaQuocGia], [MaTrangThai], [ThoiLuongPhim], [MoTa], [NamPhatHanh]) VALUES (68, N'Akame Ga Kill', 24, 18, N'AkameGaKill.jpg', 0, 7, 8, 1, 2, 23, N'Câu chuyện về Tatsumi, một chiến binh trẻ từ làng quê, và Night Raid, một nhóm sát thủ chống lại đế quốc bạo ngược. Tatsumi gia nhập Night Raid sau khi nhận ra sự thật đằng sau đế quốc và quyết tâm đánh đổ nó. Night Raid sử dụng các vũ khí huyền thoại gọi là Teigu để chiến đấu với các quan chức và lính gác của đế quốc. Tatsumi sẽ phải trải qua những cuộc chiến khốc liệt và những mất mát đau lòng trong cuộc chiến tranh này.', CAST(N'2014-10-23' AS Date))
INSERT [dbo].[Anime] ([MaAnime], [TenPhim], [SoTap], [LuotView], [Anh], [Trend], [MaTheLoai], [MaLichChieu], [MaQuocGia], [MaTrangThai], [ThoiLuongPhim], [MoTa], [NamPhatHanh]) VALUES (69, N'Tales Of Zestiria The X', 26, 22, N'TalesOfZestiriaTheX.jpg', 0, 1, 8, 1, 2, 24, N'Câu chuyện về Sorey, một con người được nuôi dưỡng bởi các Seraphim - những sinh vật linh thiêng có khả năng sử dụng ma lực. Sorey có ước mơ trở thành Shepherd - người có thể kết nối hai thế giới của con người và Seraphim và xóa bỏ sự ô nhiễm gọi là Malevolence. Khi Sorey gặp Alisha, một công chúa bị cuốn vào cuộc chiến tranh giữa các quốc gia, anh quyết định rời khỏi làng của mình và đi theo Alisha để giải quyết những rắc rối trong thế giới con người. Sorey sẽ phải đối mặt với những kẻ thù mạnh mẽ và những bí ẩn trong hành trình của anh để trở thành Shepherd.', CAST(N'2016-06-23' AS Date))
INSERT [dbo].[Anime] ([MaAnime], [TenPhim], [SoTap], [LuotView], [Anh], [Trend], [MaTheLoai], [MaLichChieu], [MaQuocGia], [MaTrangThai], [ThoiLuongPhim], [MoTa], [NamPhatHanh]) VALUES (70, N'Konosuba – Mở Ra Thế Giới Tuyệt Vời', 10, 12, N'konosuba.jpg', 0, 7, 8, 1, 2, 24, N'Câu chuyện về Kazuma Satou, một hikikomori - người sống ẩn dật trong nhà, và Aqua, một nữ thần hậu đậu. Sau khi chết vì một tai nạn ngớ ngẩn, Kazuma được Aqua đưa đến một thế giới giống như trò chơi RPG, nơi anh có thể làm nhiệm vụ và chiến đấu với quỷ vương. Kazuma được chọn một vật phẩm để mang theo, và anh chọn Aqua. Tuy nhiên, anh sớm nhận ra rằng Aqua không hề có ích gì, và còn gây ra nhiều rắc rối cho anh. Cùng với hai người bạn khác là Megumin - một pháp sư chỉ biết dùng phép nổ, và Darkness - một hiệp sĩ bạo lực và biến thái, Kazuma sẽ phải sống sót trong thế giới mới này với nhiều tình huống hài hước và phiêu lưu.', CAST(N'2016-05-15' AS Date))
INSERT [dbo].[Anime] ([MaAnime], [TenPhim], [SoTap], [LuotView], [Anh], [Trend], [MaTheLoai], [MaLichChieu], [MaQuocGia], [MaTrangThai], [ThoiLuongPhim], [MoTa], [NamPhatHanh]) VALUES (71, N'Your Lie In April', 22, 17, N'YourLieInApril.jpg', 0, 11, 8, 1, 2, 23, N'Câu chuyện về Kousei Arima, một thiên tài piano bị mất khả năng nghe âm nhạc sau khi mẹ anh qua đời. Khi gặp Kaori Miyazono, một nữ violinist tràn đầy sức sống và tự do, anh dần dần lấy lại niềm đam mê với âm nhạc và cuộc sống. Tuy nhiên, Kaori cũng đang che giấu một bí mật đau lòng.', CAST(N'2014-10-23' AS Date))
INSERT [dbo].[Anime] ([MaAnime], [TenPhim], [SoTap], [LuotView], [Anh], [Trend], [MaTheLoai], [MaLichChieu], [MaQuocGia], [MaTrangThai], [ThoiLuongPhim], [MoTa], [NamPhatHanh]) VALUES (72, N'Astra Lost In Space', 12, 16, N'AstraLostInSpace.jpg', 0, 1, 8, 1, 2, 24, N'Câu chuyện về Kanata Hoshijima và những học sinh khác khi họ tham gia chuyến dã ngoại ngoài không gian. Tuy nhiên, họ bị kẻ xấu tấn công và bị đẩy vào không gian xa xôi. Họ phải sử dụng một con tàu không gian bỏ hoang để trở về Trái Đất. Trên đường về, họ phải ghé qua các hành tinh khác để kiếm lương thực và nhiên liệu, cũng như khám phá ra bí ẩn đằng sau cuộc tấn công và quá khứ của họ.', CAST(N'2019-05-28' AS Date))
INSERT [dbo].[Anime] ([MaAnime], [TenPhim], [SoTap], [LuotView], [Anh], [Trend], [MaTheLoai], [MaLichChieu], [MaQuocGia], [MaTrangThai], [ThoiLuongPhim], [MoTa], [NamPhatHanh]) VALUES (73, N'Zombie Land Saga', 24, 17, N'zombie-land-saga.jpg', 0, 4, 8, 1, 2, 23, N'Câu chuyện về Sakura Minamoto, một cô gái bị chết trong một tai nạn xe buýt khi cô đang chuẩn bị thực hiện ước mơ trở thành idol. Sau 10 năm, cô được hồi sinh bởi Kotaro Tatsumi, một nhà sản xuất kỳ lạ, cùng với 6 cô gái khác từ các thời kỳ khác nhau. Họ được thành lập thành nhóm idol Zombie Land Saga để cứu vãn tỉnh Saga khỏi sự suy thoái. Tuy nhiên, họ phải che giấu thân phận zombie của mình và đối mặt với nhiều khó khăn trong việc trở thành idol.', CAST(N'2018-02-05' AS Date))
INSERT [dbo].[Anime] ([MaAnime], [TenPhim], [SoTap], [LuotView], [Anh], [Trend], [MaTheLoai], [MaLichChieu], [MaQuocGia], [MaTrangThai], [ThoiLuongPhim], [MoTa], [NamPhatHanh]) VALUES (84, N'Dragon Quest: The Adventure of Dai', 100, 25, N'DragonQuestTheAdventureofDai.jpg', 1, 2, 6, 1, 1, 24, N'Câu chuyện về Dai, một cậu bé sống trên một hòn đảo yên bình, và ước mơ trở thành anh hùng. Khi ma vương Hadlar tái sinh và gây chiến tranh trên thế giới, Dai được sự giúp đỡ của Avan - một anh hùng huyền thoại - để học võ và phép thuật. Sau khi Avan hy sinh để ngăn chặn Hadlar, Dai tiếp tục cuộc phiêu lưu của mình cùng với những người bạn mới để đánh bại Hadlar và các vua quỷ khác. Dai cũng phát hiện ra rằng anh có dòng máu rồng trong người và có thể sử dụng sức mạnh của Rồng Thiêng.', CAST(N'2020-01-27' AS Date))
SET IDENTITY_INSERT [dbo].[Anime] OFF
GO
SET IDENTITY_INSERT [dbo].[LichChieu] ON 

INSERT [dbo].[LichChieu] ([MaLichChieu], [ThoiGianChieu]) VALUES (1, N'Thứ 2')
INSERT [dbo].[LichChieu] ([MaLichChieu], [ThoiGianChieu]) VALUES (2, N'Thứ 3')
INSERT [dbo].[LichChieu] ([MaLichChieu], [ThoiGianChieu]) VALUES (3, N'Thứ 4')
INSERT [dbo].[LichChieu] ([MaLichChieu], [ThoiGianChieu]) VALUES (4, N'Thứ 5')
INSERT [dbo].[LichChieu] ([MaLichChieu], [ThoiGianChieu]) VALUES (5, N'Thứ 6')
INSERT [dbo].[LichChieu] ([MaLichChieu], [ThoiGianChieu]) VALUES (6, N'Thứ 7')
INSERT [dbo].[LichChieu] ([MaLichChieu], [ThoiGianChieu]) VALUES (7, N'Chủ nhật')
INSERT [dbo].[LichChieu] ([MaLichChieu], [ThoiGianChieu]) VALUES (8, N'Full')
INSERT [dbo].[LichChieu] ([MaLichChieu], [ThoiGianChieu]) VALUES (9, N'Hoãn')
SET IDENTITY_INSERT [dbo].[LichChieu] OFF
GO
SET IDENTITY_INSERT [dbo].[QuocGia] ON 

INSERT [dbo].[QuocGia] ([MaQuocGia], [TenQuocGia]) VALUES (1, N'Japan')
INSERT [dbo].[QuocGia] ([MaQuocGia], [TenQuocGia]) VALUES (2, N'China')
INSERT [dbo].[QuocGia] ([MaQuocGia], [TenQuocGia]) VALUES (3, N'Korea')
SET IDENTITY_INSERT [dbo].[QuocGia] OFF
GO
SET IDENTITY_INSERT [dbo].[TheLoai] ON 

INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (1, N'Hành động')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (2, N'Phiêu lưu')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (3, N'Xuyên không')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (4, N'Hài hước')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (5, N'Kinh dị')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (6, N'Trinh thám')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (7, N'Phép thuật')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (8, N'Harem')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (9, N'One Shot')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (10, N'Lãng mạn')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (11, N'Trường học')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (12, N'Thần thoại')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (13, N'Thiếu niên')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (14, N'Trẻ em')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (15, N'Tối tăm')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (16, N'Siêu năng lục')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (17, N'Võ thuật')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (18, N'Thể thao')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (19, N'Giả tưởng')
SET IDENTITY_INSERT [dbo].[TheLoai] OFF
GO
SET IDENTITY_INSERT [dbo].[TrangThai] ON 

INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai]) VALUES (1, N'Đang ra')
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai]) VALUES (2, N'Đã full')
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai]) VALUES (3, N'Hoãn')
SET IDENTITY_INSERT [dbo].[TrangThai] OFF
GO
SET IDENTITY_INSERT [dbo].[ViDeo] ON 

INSERT [dbo].[ViDeo] ([MaViDeo], [MaAnime], [TapSo], [ViDeo_url], [Anh]) VALUES (8, 47, 1, N'1.mp4', NULL)
INSERT [dbo].[ViDeo] ([MaViDeo], [MaAnime], [TapSo], [ViDeo_url], [Anh]) VALUES (9, 47, 2, N'2.mp4', NULL)
INSERT [dbo].[ViDeo] ([MaViDeo], [MaAnime], [TapSo], [ViDeo_url], [Anh]) VALUES (10, 47, 3, N'3.mp4', NULL)
INSERT [dbo].[ViDeo] ([MaViDeo], [MaAnime], [TapSo], [ViDeo_url], [Anh]) VALUES (11, 47, 4, N'4.mp4', NULL)
INSERT [dbo].[ViDeo] ([MaViDeo], [MaAnime], [TapSo], [ViDeo_url], [Anh]) VALUES (12, 47, 5, N'5.mp4', NULL)
INSERT [dbo].[ViDeo] ([MaViDeo], [MaAnime], [TapSo], [ViDeo_url], [Anh]) VALUES (13, 47, 6, N'6.mp4', NULL)
INSERT [dbo].[ViDeo] ([MaViDeo], [MaAnime], [TapSo], [ViDeo_url], [Anh]) VALUES (14, 47, 7, N'7.mp4', NULL)
SET IDENTITY_INSERT [dbo].[ViDeo] OFF
GO
ALTER TABLE [dbo].[Anime]  WITH CHECK ADD FOREIGN KEY([MaLichChieu])
REFERENCES [dbo].[LichChieu] ([MaLichChieu])
GO
ALTER TABLE [dbo].[Anime]  WITH CHECK ADD FOREIGN KEY([MaLichChieu])
REFERENCES [dbo].[LichChieu] ([MaLichChieu])
GO
ALTER TABLE [dbo].[Anime]  WITH CHECK ADD FOREIGN KEY([MaQuocGia])
REFERENCES [dbo].[QuocGia] ([MaQuocGia])
GO
ALTER TABLE [dbo].[Anime]  WITH CHECK ADD FOREIGN KEY([MaTheLoai])
REFERENCES [dbo].[TheLoai] ([MaTheLoai])
GO
ALTER TABLE [dbo].[Anime]  WITH CHECK ADD FOREIGN KEY([MaTheLoai])
REFERENCES [dbo].[TheLoai] ([MaTheLoai])
GO
ALTER TABLE [dbo].[Anime]  WITH CHECK ADD FOREIGN KEY([MaTheLoai])
REFERENCES [dbo].[TheLoai] ([MaTheLoai])
GO
ALTER TABLE [dbo].[Anime]  WITH CHECK ADD FOREIGN KEY([MaTrangThai])
REFERENCES [dbo].[TrangThai] ([MaTrangThai])
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD FOREIGN KEY([MaAnime])
REFERENCES [dbo].[Anime] ([MaAnime])
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD FOREIGN KEY([MaTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([MaTaiKhoan])
GO
ALTER TABLE [dbo].[ViDeo]  WITH CHECK ADD FOREIGN KEY([MaAnime])
REFERENCES [dbo].[Anime] ([MaAnime])
GO
USE [master]
GO
ALTER DATABASE [Anime] SET  READ_WRITE 
GO
