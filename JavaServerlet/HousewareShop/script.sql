USE [master]
GO
/****** Object:  Database [HouseWareShop]    Script Date: 7/10/2021 8:24:48 PM ******/
CREATE DATABASE [HouseWareShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HouseWareShop', FILENAME = N'E:\SQL\MSSQL14.MSSQLSERVER\MSSQL\DATA\HouseWareShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HouseWareShop_log', FILENAME = N'E:\SQL\MSSQL14.MSSQLSERVER\MSSQL\DATA\HouseWareShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [HouseWareShop] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HouseWareShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HouseWareShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HouseWareShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HouseWareShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HouseWareShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HouseWareShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [HouseWareShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HouseWareShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HouseWareShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HouseWareShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HouseWareShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HouseWareShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HouseWareShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HouseWareShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HouseWareShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HouseWareShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HouseWareShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HouseWareShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HouseWareShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HouseWareShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HouseWareShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HouseWareShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HouseWareShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HouseWareShop] SET RECOVERY FULL 
GO
ALTER DATABASE [HouseWareShop] SET  MULTI_USER 
GO
ALTER DATABASE [HouseWareShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HouseWareShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HouseWareShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HouseWareShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HouseWareShop] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HouseWareShop', N'ON'
GO
ALTER DATABASE [HouseWareShop] SET QUERY_STORE = OFF
GO
USE [HouseWareShop]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/10/2021 8:24:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[userName] [nvarchar](100) NOT NULL,
	[password] [nvarchar](50) NULL,
	[displayName] [nvarchar](100) NULL,
	[address] [nvarchar](200) NULL,
	[email] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[role_id] [int] NULL,
	[status] [int] NULL,
	[create_date] [date] NULL,
	[active_code] [nvarchar](50) NULL,
 CONSTRAINT [PK_Account_1] PRIMARY KEY CLUSTERED 
(
	[userName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 7/10/2021 8:24:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category] [nvarchar](200) NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[image]    Script Date: 7/10/2021 8:24:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[image](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[image_name] [nvarchar](200) NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 7/10/2021 8:24:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Customer] [nvarchar](100) NULL,
	[shipping_id] [int] NULL,
	[create_date] [date] NULL,
	[total_price] [float] NULL,
	[note] [nvarchar](2000) NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_detail]    Script Date: 7/10/2021 8:24:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
	[product_name] [nvarchar](200) NULL,
	[product_price] [decimal](18, 0) NULL,
	[quantity] [int] NULL,
	[product_image] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 7/10/2021 8:24:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [int] NULL,
	[code] [nvarchar](50) NULL,
	[name] [nvarchar](200) NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
	[description] [nvarchar](2000) NULL,
	[image] [nvarchar](100) NULL,
	[create_date] [date] NULL,
	[status] [int] NULL,
	[sub_category_id] [int] NULL,
	[sale] [float] NULL,
 CONSTRAINT [PK__product__3213E83FE0F71A36] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role_Account]    Script Date: 7/10/2021 8:24:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role_Account](
	[id] [int] NOT NULL,
	[role] [nvarchar](50) NULL,
 CONSTRAINT [PK_role_Account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipping]    Script Date: 7/10/2021 8:24:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipping](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[phone] [nvarchar](20) NULL,
	[address] [nvarchar](200) NULL,
 CONSTRAINT [PK__Shipping__3213E83F52ED128F] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[status_Account]    Script Date: 7/10/2021 8:24:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status_Account](
	[id] [int] NOT NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_status_Account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[status_category]    Script Date: 7/10/2021 8:24:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status_category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_status_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[status_Order]    Script Date: 7/10/2021 8:24:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status_Order](
	[id] [int] NOT NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_status_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[status_product]    Script Date: 7/10/2021 8:24:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status_product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[status] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[status_sub_category]    Script Date: 7/10/2021 8:24:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status_sub_category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_status_sub_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sub_category]    Script Date: 7/10/2021 8:24:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sub_category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [int] NULL,
	[sub_category_name] [nvarchar](200) NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_sub_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[view]    Script Date: 7/10/2021 8:24:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[view](
	[view] [int] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([userName], [password], [displayName], [address], [email], [phone], [role_id], [status], [create_date], [active_code]) VALUES (N'admin', N'admin', N'Admin', N'Hà Nội', N'admin@fpt.edu.vn', N'0866823499', 1, 1, CAST(N'2019-10-20' AS Date), NULL)
INSERT [dbo].[Account] ([userName], [password], [displayName], [address], [email], [phone], [role_id], [status], [create_date], [active_code]) VALUES (N'anhng', N'123456', N'Nguyễn Thị Ánh', N'Hà Nội', N'anhng2610@gmail.com', N'0869054685', 4, 1, CAST(N'2021-06-26' AS Date), N'LoGb6T')
INSERT [dbo].[Account] ([userName], [password], [displayName], [address], [email], [phone], [role_id], [status], [create_date], [active_code]) VALUES (N'minh', N'123456', N'Lê Nhật Minh', N'Vĩnh Hùng-Vĩnh Lộc-Thanh Hóa', N'minhln@gmail.com', N'0123456789', 4, 1, CAST(N'2019-10-30' AS Date), NULL)
INSERT [dbo].[Account] ([userName], [password], [displayName], [address], [email], [phone], [role_id], [status], [create_date], [active_code]) VALUES (N'nghia', N'123456', N'Hoang Minh Nghia', N'Thanh Hoa', N'nghiahm@gmail.com', N'1234567890', 4, 1, CAST(N'2019-10-31' AS Date), NULL)
INSERT [dbo].[Account] ([userName], [password], [displayName], [address], [email], [phone], [role_id], [status], [create_date], [active_code]) VALUES (N'quan2', N'123456', N'Lê Hồng Quân', N'Vĩnh Hùng-Vĩnh Lộc-Thanh Hóa', N'quan@gmail.com', N'0123456789', 1, 1, CAST(N'2021-05-05' AS Date), NULL)
INSERT [dbo].[Account] ([userName], [password], [displayName], [address], [email], [phone], [role_id], [status], [create_date], [active_code]) VALUES (N'quanlh', N'123456', N'quanlh', N'', N'quanlh@gmail.com', N'0866823499', 4, 1, CAST(N'2020-04-05' AS Date), NULL)
INSERT [dbo].[Account] ([userName], [password], [displayName], [address], [email], [phone], [role_id], [status], [create_date], [active_code]) VALUES (N'sang', N'123456', N'Nguyen Van Sang', N'', N'sangnvhe130388@fpt.edu.vn', N'0393463756', 4, 3, CAST(N'2019-11-04' AS Date), NULL)
INSERT [dbo].[Account] ([userName], [password], [displayName], [address], [email], [phone], [role_id], [status], [create_date], [active_code]) VALUES (N'Tu', N'123456', N'Le Viet Tu', N'Vinh Phuc', N'motdemhuyhoang@gmail.com', N'', 4, 1, CAST(N'2020-03-27' AS Date), NULL)
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([id], [category], [status]) VALUES (1, N'Dụng cụ', 1)
INSERT [dbo].[category] ([id], [category], [status]) VALUES (2, N'Công cụ đo lường', 1)
INSERT [dbo].[category] ([id], [category], [status]) VALUES (3, N'Dụng cụ sửa chữa', 1)
INSERT [dbo].[category] ([id], [category], [status]) VALUES (4, N'Đèn sáng', 1)
INSERT [dbo].[category] ([id], [category], [status]) VALUES (5, N'Dụng cụ nhà vườn', 1)
INSERT [dbo].[category] ([id], [category], [status]) VALUES (6, N'Khác', 1)
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[image] ON 

INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1, 1, N'tools/1_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (2, 1, N'tools/1_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (3, 1, N'tools/1_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (4, 1, N'tools/1_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (5, 1, N'tools/1_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (6, 2, N'tools/2_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (7, 2, N'tools/2_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (8, 2, N'tools/2_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (9, 2, N'tools/2_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (10, 2, N'tools/2_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (11, 3, N'tools/3_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (12, 3, N'tools/3_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (13, 3, N'tools/3_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (14, 3, N'tools/3_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (15, 3, N'tools/3_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (16, 4, N'tools/4_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (17, 4, N'tools/4_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (18, 4, N'tools/4_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (19, 4, N'tools/4_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (20, 4, N'tools/4_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (21, 5, N'tools/5_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (22, 5, N'tools/5_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (23, 5, N'tools/5_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (24, 5, N'tools/5_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (25, 5, N'tools/5_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (26, 6, N'tools/6_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (27, 6, N'tools/6_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (28, 6, N'tools/6_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (29, 6, N'tools/6_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (30, 6, N'tools/6_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (31, 7, N'tools/7_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (32, 7, N'tools/7_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (33, 7, N'tools/7_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (34, 7, N'tools/7_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (35, 7, N'tools/7_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (36, 8, N'tools/8_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (37, 8, N'tools/8_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (38, 8, N'tools/8_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (39, 8, N'tools/8_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (40, 8, N'tools/8_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (41, 9, N'tools/9_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (42, 9, N'tools/9_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (43, 9, N'tools/9_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (44, 9, N'tools/9_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (45, 9, N'tools/9_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (46, 10, N'tools/10_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (47, 10, N'tools/10_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (48, 10, N'tools/10_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (49, 10, N'tools/10_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (50, 10, N'tools/10_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (51, 11, N'tools/11_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (52, 11, N'tools/11_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (53, 11, N'tools/11_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (54, 11, N'tools/11_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (55, 11, N'tools/11_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (56, 12, N'tools/12_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (57, 12, N'tools/12_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (58, 12, N'tools/12_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (59, 12, N'tools/12_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (60, 12, N'tools/12_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (61, 13, N'tools/13_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (62, 13, N'tools/13_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (63, 13, N'tools/13_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (64, 13, N'tools/13_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (65, 13, N'tools/13_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (66, 14, N'tools/14_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (67, 14, N'tools/14_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (68, 14, N'tools/14_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (69, 14, N'tools/14_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (70, 14, N'tools/14_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (71, 15, N'tools/15_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (72, 15, N'tools/15_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (73, 15, N'tools/15_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (74, 15, N'tools/15_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (75, 15, N'tools/15_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (76, 16, N'tools/16_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (77, 16, N'tools/16_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (78, 16, N'tools/16_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (79, 16, N'tools/16_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (80, 16, N'tools/16_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (81, 17, N'tools/17_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (82, 17, N'tools/17_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (83, 17, N'tools/17_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (84, 17, N'tools/17_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (85, 17, N'tools/17_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (86, 18, N'tools/18_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (87, 18, N'tools/18_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (88, 18, N'tools/18_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (89, 18, N'tools/18_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (90, 18, N'tools/18_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (91, 19, N'tools/19_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (92, 19, N'tools/19_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (93, 19, N'tools/19_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (94, 19, N'tools/19_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (95, 19, N'tools/19_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (96, 20, N'tools/20_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (97, 20, N'tools/20_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (98, 20, N'tools/20_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (99, 20, N'tools/20_4.jpg', 1)
GO
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (100, 20, N'tools/20_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (101, 21, N'tools/21_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (102, 21, N'tools/21_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (103, 21, N'tools/21_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (104, 21, N'tools/21_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (105, 21, N'tools/21_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (106, 22, N'tools/22_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (107, 22, N'tools/22_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (108, 22, N'tools/22_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (109, 22, N'tools/22_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (110, 22, N'tools/22_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (111, 23, N'tools/23_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (112, 23, N'tools/23_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (113, 23, N'tools/23_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (114, 23, N'tools/23_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (115, 23, N'tools/23_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (116, 24, N'tools/24_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (117, 24, N'tools/24_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (118, 24, N'tools/24_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (119, 24, N'tools/24_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (120, 24, N'tools/24_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (121, 25, N'tools/25_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (122, 25, N'tools/25_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (123, 25, N'tools/25_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (124, 25, N'tools/25_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (125, 25, N'tools/25_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (126, 26, N'tools/26_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (127, 26, N'tools/26_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (128, 26, N'tools/26_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (129, 26, N'tools/26_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (130, 26, N'tools/26_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (131, 27, N'tools/27_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (132, 27, N'tools/27_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (133, 27, N'tools/27_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (134, 27, N'tools/27_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (135, 27, N'tools/27_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (136, 28, N'tools/28_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (137, 28, N'tools/28_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (138, 28, N'tools/28_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (139, 28, N'tools/28_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (140, 28, N'tools/28_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (141, 29, N'tools/29_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (142, 29, N'tools/29_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (143, 29, N'tools/29_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (144, 29, N'tools/29_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (145, 29, N'tools/29_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (146, 30, N'tools/30_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (147, 30, N'tools/30_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (148, 30, N'tools/30_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (149, 30, N'tools/30_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (150, 30, N'tools/30_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (151, 31, N'tools/31_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (152, 31, N'tools/31_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (153, 31, N'tools/31_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (154, 31, N'tools/31_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (155, 31, N'tools/31_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (156, 32, N'tools/32_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (157, 32, N'tools/32_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (158, 32, N'tools/32_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (159, 32, N'tools/32_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (160, 32, N'tools/32_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (161, 33, N'tools/33_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (162, 33, N'tools/33_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (163, 33, N'tools/33_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (164, 33, N'tools/33_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (165, 33, N'tools/33_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (166, 34, N'tools/34_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (167, 34, N'tools/34_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (168, 34, N'tools/34_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (169, 34, N'tools/34_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (170, 34, N'tools/34_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (171, 35, N'tools/35_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (172, 35, N'tools/35_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (173, 35, N'tools/35_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (174, 35, N'tools/35_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (175, 35, N'tools/35_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (176, 36, N'tools/36_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (177, 36, N'tools/36_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (178, 36, N'tools/36_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (179, 36, N'tools/36_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (180, 36, N'tools/36_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (181, 37, N'tools/37_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (182, 37, N'tools/37_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (183, 37, N'tools/37_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (184, 37, N'tools/37_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (185, 37, N'tools/37_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (186, 38, N'tools/38_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (187, 38, N'tools/38_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (188, 38, N'tools/38_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (189, 38, N'tools/38_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (190, 38, N'tools/38_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (191, 39, N'tools/39_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (192, 39, N'tools/39_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (193, 39, N'tools/39_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (194, 39, N'tools/39_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (195, 39, N'tools/39_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (196, 40, N'tools/40_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (197, 40, N'tools/40_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (198, 40, N'tools/40_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (199, 40, N'tools/40_4.jpg', 1)
GO
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (200, 40, N'tools/40_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (201, 41, N'tools/41_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (202, 41, N'tools/41_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (203, 41, N'tools/41_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (204, 41, N'tools/41_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (205, 41, N'tools/41_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (206, 42, N'tools/42_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (207, 42, N'tools/42_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (208, 42, N'tools/42_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (209, 42, N'tools/42_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (210, 42, N'tools/42_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (211, 43, N'tools/43_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (212, 43, N'tools/43_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (213, 43, N'tools/43_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (214, 43, N'tools/43_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (215, 43, N'tools/43_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (216, 44, N'tools/44_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (217, 44, N'tools/44_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (218, 44, N'tools/44_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (219, 44, N'tools/44_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (220, 44, N'tools/44_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (221, 45, N'tools/45_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (222, 45, N'tools/45_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (223, 45, N'tools/45_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (224, 45, N'tools/45_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (225, 45, N'tools/45_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (226, 46, N'tools/46_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (227, 46, N'tools/46_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (228, 46, N'tools/46_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (229, 46, N'tools/46_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (230, 46, N'tools/46_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (231, 47, N'tools/47_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (232, 47, N'tools/47_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (233, 47, N'tools/47_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (234, 47, N'tools/47_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (235, 47, N'tools/47_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (236, 48, N'tools/48_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (237, 48, N'tools/48_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (238, 48, N'tools/48_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (239, 48, N'tools/48_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (240, 48, N'tools/48_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (241, 49, N'tools/49_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (242, 49, N'tools/49_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (243, 49, N'tools/49_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (244, 49, N'tools/49_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (245, 49, N'tools/49_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (246, 50, N'tools/50_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (247, 50, N'tools/50_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (248, 50, N'tools/50_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (249, 50, N'tools/50_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (250, 50, N'tools/50_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (251, 51, N'tools/51_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (252, 51, N'tools/51_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (253, 51, N'tools/51_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (254, 51, N'tools/51_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (255, 51, N'tools/51_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (256, 52, N'tools/52_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (257, 52, N'tools/52_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (258, 52, N'tools/52_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (259, 52, N'tools/52_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (260, 52, N'tools/52_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (261, 53, N'tools/53_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (262, 53, N'tools/53_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (263, 53, N'tools/53_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (264, 53, N'tools/53_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (265, 53, N'tools/53_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (266, 54, N'tools/54_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (267, 54, N'tools/54_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (268, 54, N'tools/54_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (269, 54, N'tools/54_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (270, 54, N'tools/54_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (271, 55, N'tools/55_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (272, 55, N'tools/55_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (273, 55, N'tools/55_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (274, 55, N'tools/55_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (275, 55, N'tools/55_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (276, 56, N'tools/56_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (277, 56, N'tools/56_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (278, 56, N'tools/56_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (279, 56, N'tools/56_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (280, 56, N'tools/56_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (281, 57, N'tools/57_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (282, 57, N'tools/57_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (283, 57, N'tools/57_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (284, 57, N'tools/57_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (285, 57, N'tools/57_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (286, 58, N'tools/58_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (287, 58, N'tools/58_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (288, 58, N'tools/58_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (289, 58, N'tools/58_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (290, 58, N'tools/58_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (291, 59, N'tools/59_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (292, 59, N'tools/59_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (293, 59, N'tools/59_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (294, 59, N'tools/59_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (295, 59, N'tools/59_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (296, 60, N'tools/60_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (297, 60, N'tools/60_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (298, 60, N'tools/60_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (299, 60, N'tools/60_4.jpg', 1)
GO
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (300, 60, N'tools/60_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (301, 61, N'Measurements/61_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (302, 61, N'Measurements/61_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (303, 61, N'Measurements/61_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (304, 61, N'Measurements/61_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (305, 61, N'Measurements/61_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (306, 62, N'Measurements/62_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (307, 62, N'Measurements/62_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (308, 62, N'Measurements/62_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (309, 62, N'Measurements/62_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (310, 62, N'Measurements/62_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (311, 63, N'Measurements/63_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (312, 63, N'Measurements/63_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (313, 63, N'Measurements/63_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (314, 63, N'Measurements/63_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (315, 63, N'Measurements/63_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (316, 64, N'Measurements/64_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (317, 64, N'Measurements/64_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (318, 64, N'Measurements/64_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (319, 64, N'Measurements/64_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (320, 64, N'Measurements/64_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (321, 65, N'Measurements/65_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (322, 65, N'Measurements/65_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (323, 65, N'Measurements/65_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (324, 65, N'Measurements/65_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (325, 65, N'Measurements/65_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (326, 66, N'Measurements/66_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (327, 66, N'Measurements/66_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (328, 66, N'Measurements/66_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (329, 66, N'Measurements/66_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (330, 66, N'Measurements/66_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (331, 67, N'Measurements/67_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (332, 67, N'Measurements/67_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (333, 67, N'Measurements/67_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (334, 67, N'Measurements/67_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (335, 67, N'Measurements/67_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (336, 68, N'Measurements/68_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (337, 68, N'Measurements/68_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (338, 68, N'Measurements/68_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (339, 68, N'Measurements/68_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (340, 68, N'Measurements/68_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (341, 69, N'Measurements/69_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (342, 69, N'Measurements/69_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (343, 69, N'Measurements/69_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (344, 69, N'Measurements/69_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (345, 69, N'Measurements/69_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (346, 70, N'Measurements/70_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (347, 70, N'Measurements/70_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (348, 70, N'Measurements/70_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (349, 70, N'Measurements/70_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (350, 70, N'Measurements/70_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (351, 71, N'Measurements/71_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (352, 71, N'Measurements/71_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (353, 71, N'Measurements/71_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (354, 71, N'Measurements/71_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (355, 71, N'Measurements/71_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (356, 72, N'Measurements/72_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (357, 72, N'Measurements/72_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (358, 72, N'Measurements/72_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (359, 72, N'Measurements/72_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (360, 72, N'Measurements/72_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (361, 73, N'Measurements/73_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (362, 73, N'Measurements/73_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (363, 73, N'Measurements/73_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (364, 73, N'Measurements/73_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (365, 73, N'Measurements/73_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (366, 74, N'Measurements/74_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (367, 74, N'Measurements/74_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (368, 74, N'Measurements/74_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (369, 74, N'Measurements/74_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (370, 74, N'Measurements/74_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (371, 75, N'Measurements/75_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (372, 75, N'Measurements/75_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (373, 75, N'Measurements/75_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (374, 75, N'Measurements/75_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (375, 75, N'Measurements/75_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (376, 76, N'Measurements/76_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (377, 76, N'Measurements/76_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (378, 76, N'Measurements/76_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (379, 76, N'Measurements/76_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (380, 76, N'Measurements/76_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (381, 77, N'Measurements/77_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (382, 77, N'Measurements/77_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (383, 77, N'Measurements/77_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (384, 77, N'Measurements/77_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (385, 77, N'Measurements/77_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (386, 78, N'Measurements/78_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (387, 78, N'Measurements/78_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (388, 78, N'Measurements/78_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (389, 78, N'Measurements/78_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (390, 78, N'Measurements/78_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (391, 79, N'Measurements/79_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (392, 79, N'Measurements/79_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (393, 79, N'Measurements/79_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (394, 79, N'Measurements/79_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (395, 79, N'Measurements/79_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (396, 80, N'Measurements/80_1.jpg', 0)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (397, 80, N'Measurements/80_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (398, 80, N'Measurements/80_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (399, 80, N'Measurements/80_4.jpg', 1)
GO
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (400, 80, N'Measurements/80_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (401, 81, N'Measurements/81_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (402, 81, N'Measurements/81_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (403, 81, N'Measurements/81_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (404, 81, N'Measurements/81_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (405, 81, N'Measurements/81_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (406, 82, N'Measurements/82_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (407, 82, N'Measurements/82_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (408, 82, N'Measurements/82_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (409, 82, N'Measurements/82_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (410, 82, N'Measurements/82_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (411, 83, N'Measurements/83_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (412, 83, N'Measurements/83_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (413, 83, N'Measurements/83_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (414, 83, N'Measurements/83_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (415, 83, N'Measurements/83_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (416, 84, N'Measurements/84_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (417, 84, N'Measurements/84_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (418, 84, N'Measurements/84_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (419, 84, N'Measurements/84_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (420, 84, N'Measurements/84_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (421, 85, N'Measurements/85_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (422, 85, N'Measurements/85_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (423, 85, N'Measurements/85_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (424, 85, N'Measurements/85_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (425, 85, N'Measurements/85_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (426, 86, N'Measurements/86_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (427, 86, N'Measurements/86_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (428, 86, N'Measurements/86_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (429, 86, N'Measurements/86_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (430, 86, N'Measurements/86_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (431, 87, N'Measurements/87_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (432, 87, N'Measurements/87_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (433, 87, N'Measurements/87_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (434, 87, N'Measurements/87_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (435, 87, N'Measurements/87_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (436, 88, N'Measurements/88_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (437, 88, N'Measurements/88_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (438, 88, N'Measurements/88_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (439, 88, N'Measurements/88_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (440, 88, N'Measurements/88_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (441, 89, N'Measurements/89_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (442, 89, N'Measurements/89_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (443, 89, N'Measurements/89_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (444, 89, N'Measurements/89_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (445, 89, N'Measurements/89_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (446, 90, N'Measurements/90_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (447, 90, N'Measurements/90_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (448, 90, N'Measurements/90_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (449, 90, N'Measurements/90_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (450, 90, N'Measurements/90_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (451, 91, N'Measurements/91_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (452, 91, N'Measurements/91_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (453, 91, N'Measurements/91_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (454, 91, N'Measurements/91_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (455, 91, N'Measurements/91_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (456, 92, N'Measurements/92_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (457, 92, N'Measurements/92_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (458, 92, N'Measurements/92_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (459, 92, N'Measurements/92_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (460, 92, N'Measurements/92_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (461, 93, N'Measurements/93_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (462, 93, N'Measurements/93_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (463, 93, N'Measurements/93_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (464, 93, N'Measurements/93_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (465, 93, N'Measurements/93_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (466, 94, N'Measurements/94_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (467, 94, N'Measurements/94_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (468, 94, N'Measurements/94_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (469, 94, N'Measurements/94_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (470, 94, N'Measurements/94_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (471, 95, N'Measurements/95_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (472, 95, N'Measurements/95_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (473, 95, N'Measurements/95_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (474, 95, N'Measurements/95_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (475, 95, N'Measurements/95_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (476, 96, N'Measurements/96_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (477, 96, N'Measurements/96_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (478, 96, N'Measurements/96_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (479, 96, N'Measurements/96_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (480, 96, N'Measurements/96_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (481, 97, N'Measurements/97_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (482, 97, N'Measurements/97_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (483, 97, N'Measurements/97_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (484, 97, N'Measurements/97_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (485, 97, N'Measurements/97_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (486, 98, N'Measurements/98_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (487, 98, N'Measurements/98_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (488, 98, N'Measurements/98_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (489, 98, N'Measurements/98_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (490, 98, N'Measurements/98_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (491, 99, N'Measurements/99_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (492, 99, N'Measurements/99_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (493, 99, N'Measurements/99_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (494, 99, N'Measurements/99_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (495, 99, N'Measurements/99_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (496, 100, N'Measurements/100_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (497, 100, N'Measurements/100_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (498, 100, N'Measurements/100_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (499, 100, N'Measurements/100_4.jpg', 1)
GO
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (500, 100, N'Measurements/100_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (501, 58, N'Measurements/58_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (502, 58, N'Measurements/58_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (503, 58, N'Measurements/58_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (504, 58, N'Measurements/58_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (505, 58, N'Measurements/58_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (506, 59, N'Measurements/59_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (507, 59, N'Measurements/59_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (508, 59, N'Measurements/59_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (509, 59, N'Measurements/59_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (510, 59, N'Measurements/59_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (511, 60, N'Measurements/60_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (512, 60, N'Measurements/60_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (513, 60, N'Measurements/60_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (514, 60, N'Measurements/60_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (515, 60, N'Measurements/60_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (516, 61, N'Measurements/61_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (517, 61, N'Measurements/61_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (518, 61, N'Measurements/61_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (519, 61, N'Measurements/61_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (520, 61, N'Measurements/61_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (521, 62, N'Measurements/62_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (522, 62, N'Measurements/62_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (523, 62, N'Measurements/62_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (524, 62, N'Measurements/62_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (525, 62, N'Measurements/62_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (526, 63, N'Measurements/63_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (527, 63, N'Measurements/63_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (528, 63, N'Measurements/63_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (529, 63, N'Measurements/63_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (530, 63, N'Measurements/63_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (531, 64, N'Measurements/64_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (532, 64, N'Measurements/64_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (533, 64, N'Measurements/64_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (534, 64, N'Measurements/64_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (535, 64, N'Measurements/64_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (536, 65, N'Measurements/65_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (537, 65, N'Measurements/65_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (538, 65, N'Measurements/65_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (539, 65, N'Measurements/65_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (540, 65, N'Measurements/65_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (541, 66, N'Measurements/66_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (542, 66, N'Measurements/66_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (543, 66, N'Measurements/66_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (544, 66, N'Measurements/66_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (545, 66, N'Measurements/66_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (546, 67, N'Measurements/67_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (547, 67, N'Measurements/67_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (548, 67, N'Measurements/67_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (549, 67, N'Measurements/67_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (550, 67, N'Measurements/67_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (551, 68, N'Measurements/68_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (552, 68, N'Measurements/68_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (553, 68, N'Measurements/68_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (554, 68, N'Measurements/68_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (555, 68, N'Measurements/68_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (556, 69, N'Measurements/69_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (557, 69, N'Measurements/69_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (558, 69, N'Measurements/69_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (559, 69, N'Measurements/69_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (560, 69, N'Measurements/69_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (561, 70, N'Measurements/70_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (562, 70, N'Measurements/70_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (563, 70, N'Measurements/70_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (564, 70, N'Measurements/70_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (565, 70, N'Measurements/70_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (566, 71, N'Measurements/71_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (567, 71, N'Measurements/71_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (568, 71, N'Measurements/71_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (569, 71, N'Measurements/71_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (570, 71, N'Measurements/71_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (571, 72, N'Measurements/72_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (572, 72, N'Measurements/72_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (573, 72, N'Measurements/72_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (574, 72, N'Measurements/72_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (575, 72, N'Measurements/72_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (576, 73, N'Measurements/73_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (577, 73, N'Measurements/73_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (578, 73, N'Measurements/73_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (579, 73, N'Measurements/73_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (580, 73, N'Measurements/73_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (581, 74, N'Measurements/74_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (582, 74, N'Measurements/74_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (583, 74, N'Measurements/74_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (584, 74, N'Measurements/74_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (585, 74, N'Measurements/74_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (586, 75, N'Measurements/75_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (587, 75, N'Measurements/75_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (588, 75, N'Measurements/75_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (589, 75, N'Measurements/75_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (590, 75, N'Measurements/75_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (591, 76, N'Measurements/76_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (592, 76, N'Measurements/76_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (593, 76, N'Measurements/76_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (594, 76, N'Measurements/76_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (595, 76, N'Measurements/76_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (596, 77, N'Measurements/77_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (597, 77, N'Measurements/77_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (598, 77, N'Measurements/77_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (599, 77, N'Measurements/77_4.jpg', 1)
GO
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (600, 77, N'Measurements/77_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (601, 78, N'Measurements/78_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (602, 78, N'Measurements/78_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (603, 78, N'Measurements/78_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (604, 78, N'Measurements/78_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (605, 78, N'Measurements/78_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (606, 79, N'Measurements/79_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (607, 79, N'Measurements/79_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (608, 79, N'Measurements/79_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (609, 79, N'Measurements/79_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (610, 79, N'Measurements/79_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (611, 80, N'Measurements/80_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (612, 80, N'Measurements/80_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (613, 80, N'Measurements/80_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (614, 80, N'Measurements/80_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (615, 80, N'Measurements/80_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (616, 81, N'Measurements/81_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (617, 81, N'Measurements/81_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (618, 81, N'Measurements/81_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (619, 81, N'Measurements/81_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (620, 81, N'Measurements/81_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (621, 82, N'Measurements/82_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (622, 82, N'Measurements/82_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (623, 82, N'Measurements/82_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (624, 82, N'Measurements/82_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (625, 82, N'Measurements/82_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (626, 83, N'Measurements/83_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (627, 83, N'Measurements/83_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (628, 83, N'Measurements/83_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (629, 83, N'Measurements/83_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (630, 83, N'Measurements/83_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (631, 84, N'Measurements/84_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (632, 84, N'Measurements/84_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (633, 84, N'Measurements/84_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (634, 84, N'Measurements/84_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (635, 84, N'Measurements/84_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (636, 85, N'Measurements/85_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (637, 85, N'Measurements/85_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (638, 85, N'Measurements/85_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (639, 85, N'Measurements/85_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (640, 85, N'Measurements/85_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (641, 86, N'Measurements/86_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (642, 86, N'Measurements/86_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (643, 86, N'Measurements/86_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (644, 86, N'Measurements/86_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (645, 86, N'Measurements/86_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (646, 87, N'Measurements/87_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (647, 87, N'Measurements/87_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (648, 87, N'Measurements/87_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (649, 87, N'Measurements/87_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (650, 87, N'Measurements/87_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (651, 88, N'Measurements/88_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (652, 88, N'Measurements/88_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (653, 88, N'Measurements/88_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (654, 88, N'Measurements/88_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (655, 88, N'Measurements/88_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (656, 89, N'Measurements/89_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (657, 89, N'Measurements/89_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (658, 89, N'Measurements/89_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (659, 89, N'Measurements/89_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (660, 89, N'Measurements/89_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (661, 90, N'Measurements/90_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (662, 90, N'Measurements/90_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (663, 90, N'Measurements/90_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (664, 90, N'Measurements/90_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (665, 90, N'Measurements/90_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (666, 91, N'Measurements/91_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (667, 91, N'Measurements/91_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (668, 91, N'Measurements/91_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (669, 91, N'Measurements/91_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (670, 91, N'Measurements/91_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (671, 92, N'Measurements/92_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (672, 92, N'Measurements/92_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (673, 92, N'Measurements/92_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (674, 92, N'Measurements/92_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (675, 92, N'Measurements/92_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (676, 93, N'Measurements/93_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (677, 93, N'Measurements/93_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (678, 93, N'Measurements/93_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (679, 93, N'Measurements/93_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (680, 93, N'Measurements/93_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (681, 94, N'Measurements/94_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (682, 94, N'Measurements/94_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (683, 94, N'Measurements/94_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (684, 94, N'Measurements/94_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (685, 94, N'Measurements/94_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (686, 95, N'Measurements/95_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (687, 95, N'Measurements/95_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (688, 95, N'Measurements/95_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (689, 95, N'Measurements/95_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (690, 95, N'Measurements/95_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (691, 96, N'Measurements/96_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (692, 96, N'Measurements/96_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (693, 96, N'Measurements/96_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (694, 96, N'Measurements/96_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (695, 96, N'Measurements/96_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (696, 97, N'Measurements/97_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (697, 97, N'Measurements/97_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (698, 97, N'Measurements/97_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (699, 97, N'Measurements/97_4.jpg', 1)
GO
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (700, 97, N'Measurements/97_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (701, 98, N'Measurements/98_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (702, 98, N'Measurements/98_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (703, 98, N'Measurements/98_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (704, 98, N'Measurements/98_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (705, 98, N'Measurements/98_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (706, 99, N'Measurements/99_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (707, 99, N'Measurements/99_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (708, 99, N'Measurements/99_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (709, 99, N'Measurements/99_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (710, 99, N'Measurements/99_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (711, 100, N'Measurements/100_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (712, 100, N'Measurements/100_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (713, 100, N'Measurements/100_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (714, 100, N'Measurements/100_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (715, 100, N'Measurements/100_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (716, 101, N'improvement/101_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (717, 101, N'improvement/101_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (718, 101, N'improvement/101_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (719, 101, N'improvement/101_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (720, 101, N'improvement/101_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (721, 102, N'improvement/102_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (722, 102, N'improvement/102_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (723, 102, N'improvement/102_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (724, 102, N'improvement/102_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (725, 102, N'improvement/102_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (726, 103, N'improvement/103_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (727, 103, N'improvement/103_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (728, 103, N'improvement/103_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (729, 103, N'improvement/103_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (730, 103, N'improvement/103_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (731, 104, N'improvement/104_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (732, 104, N'improvement/104_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (733, 104, N'improvement/104_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (734, 104, N'improvement/104_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (735, 104, N'improvement/104_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (736, 105, N'improvement/105_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (737, 105, N'improvement/105_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (738, 105, N'improvement/105_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (739, 105, N'improvement/105_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (740, 105, N'improvement/105_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (741, 106, N'improvement/106_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (742, 106, N'improvement/106_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (743, 106, N'improvement/106_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (744, 106, N'improvement/106_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (745, 106, N'improvement/106_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (746, 107, N'improvement/107_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (747, 107, N'improvement/107_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (748, 107, N'improvement/107_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (749, 107, N'improvement/107_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (750, 107, N'improvement/107_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (751, 108, N'improvement/108_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (752, 108, N'improvement/108_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (753, 108, N'improvement/108_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (754, 108, N'improvement/108_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (755, 108, N'improvement/108_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (756, 109, N'improvement/109_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (757, 109, N'improvement/109_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (758, 109, N'improvement/109_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (759, 109, N'improvement/109_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (760, 109, N'improvement/109_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (761, 110, N'improvement/110_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (762, 110, N'improvement/110_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (763, 110, N'improvement/110_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (764, 110, N'improvement/110_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (765, 110, N'improvement/110_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (766, 111, N'improvement/111_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (767, 111, N'improvement/111_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (768, 111, N'improvement/111_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (769, 111, N'improvement/111_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (770, 111, N'improvement/111_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (771, 112, N'improvement/112_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (772, 112, N'improvement/112_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (773, 112, N'improvement/112_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (774, 112, N'improvement/112_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (775, 112, N'improvement/112_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (776, 113, N'improvement/113_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (777, 113, N'improvement/113_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (778, 113, N'improvement/113_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (779, 113, N'improvement/113_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (780, 113, N'improvement/113_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (781, 114, N'improvement/114_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (782, 114, N'improvement/114_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (783, 114, N'improvement/114_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (784, 114, N'improvement/114_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (785, 114, N'improvement/114_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (786, 115, N'improvement/115_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (787, 115, N'improvement/115_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (788, 115, N'improvement/115_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (789, 115, N'improvement/115_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (790, 115, N'improvement/115_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (791, 116, N'improvement/116_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (792, 116, N'improvement/116_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (793, 116, N'improvement/116_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (794, 116, N'improvement/116_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (795, 116, N'improvement/116_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (796, 117, N'improvement/117_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (797, 117, N'improvement/117_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (798, 117, N'improvement/117_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (799, 117, N'improvement/117_4.jpg', 1)
GO
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (800, 117, N'improvement/117_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (801, 118, N'improvement/118_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (802, 118, N'improvement/118_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (803, 118, N'improvement/118_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (804, 118, N'improvement/118_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (805, 118, N'improvement/118_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (806, 119, N'improvement/119_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (807, 119, N'improvement/119_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (808, 119, N'improvement/119_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (809, 119, N'improvement/119_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (810, 119, N'improvement/119_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (811, 120, N'improvement/120_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (812, 120, N'improvement/120_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (813, 120, N'improvement/120_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (814, 120, N'improvement/120_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (815, 120, N'improvement/120_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (816, 121, N'improvement/121_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (817, 121, N'improvement/121_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (818, 121, N'improvement/121_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (819, 121, N'improvement/121_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (820, 121, N'improvement/121_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (821, 122, N'improvement/122_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (822, 122, N'improvement/122_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (823, 122, N'improvement/122_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (824, 122, N'improvement/122_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (825, 122, N'improvement/122_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (826, 123, N'improvement/123_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (827, 123, N'improvement/123_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (828, 123, N'improvement/123_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (829, 123, N'improvement/123_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (830, 123, N'improvement/123_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (831, 124, N'improvement/124_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (832, 124, N'improvement/124_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (833, 124, N'improvement/124_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (834, 124, N'improvement/124_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (835, 124, N'improvement/124_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (836, 125, N'improvement/125_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (837, 125, N'improvement/125_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (838, 125, N'improvement/125_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (839, 125, N'improvement/125_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (840, 125, N'improvement/125_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (841, 126, N'improvement/126_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (842, 126, N'improvement/126_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (843, 126, N'improvement/126_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (844, 126, N'improvement/126_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (845, 126, N'improvement/126_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (846, 127, N'improvement/127_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (847, 127, N'improvement/127_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (848, 127, N'improvement/127_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (849, 127, N'improvement/127_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (850, 127, N'improvement/127_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (851, 128, N'improvement/128_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (852, 128, N'improvement/128_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (853, 128, N'improvement/128_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (854, 128, N'improvement/128_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (855, 128, N'improvement/128_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (856, 129, N'improvement/129_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (857, 129, N'improvement/129_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (858, 129, N'improvement/129_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (859, 129, N'improvement/129_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (860, 129, N'improvement/129_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (861, 130, N'improvement/130_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (862, 130, N'improvement/130_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (863, 130, N'improvement/130_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (864, 130, N'improvement/130_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (865, 130, N'improvement/130_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (866, 131, N'improvement/131_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (867, 131, N'improvement/131_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (868, 131, N'improvement/131_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (869, 131, N'improvement/131_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (870, 131, N'improvement/131_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (871, 132, N'improvement/132_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (872, 132, N'improvement/132_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (873, 132, N'improvement/132_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (874, 132, N'improvement/132_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (875, 132, N'improvement/132_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (876, 133, N'improvement/133_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (877, 133, N'improvement/133_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (878, 133, N'improvement/133_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (879, 133, N'improvement/133_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (880, 133, N'improvement/133_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (881, 134, N'improvement/134_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (882, 134, N'improvement/134_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (883, 134, N'improvement/134_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (884, 134, N'improvement/134_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (885, 134, N'improvement/134_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (886, 135, N'improvement/135_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (887, 135, N'improvement/135_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (888, 135, N'improvement/135_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (889, 135, N'improvement/135_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (890, 135, N'improvement/135_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (891, 136, N'improvement/136_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (892, 136, N'improvement/136_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (893, 136, N'improvement/136_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (894, 136, N'improvement/136_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (895, 136, N'improvement/136_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (896, 137, N'improvement/137_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (897, 137, N'improvement/137_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (898, 137, N'improvement/137_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (899, 137, N'improvement/137_4.jpg', 1)
GO
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (900, 137, N'improvement/137_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (901, 138, N'improvement/138_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (902, 138, N'improvement/138_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (903, 138, N'improvement/138_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (904, 138, N'improvement/138_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (905, 138, N'improvement/138_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (906, 139, N'improvement/139_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (907, 139, N'improvement/139_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (908, 139, N'improvement/139_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (909, 139, N'improvement/139_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (910, 139, N'improvement/139_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (911, 140, N'improvement/140_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (912, 140, N'improvement/140_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (913, 140, N'improvement/140_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (914, 140, N'improvement/140_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (915, 140, N'improvement/140_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (916, 141, N'improvement/141_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (917, 141, N'improvement/141_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (918, 141, N'improvement/141_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (919, 141, N'improvement/141_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (920, 141, N'improvement/141_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (921, 142, N'improvement/142_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (922, 142, N'improvement/142_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (923, 142, N'improvement/142_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (924, 142, N'improvement/142_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (925, 142, N'improvement/142_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (926, 143, N'improvement/143_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (927, 143, N'improvement/143_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (928, 143, N'improvement/143_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (929, 143, N'improvement/143_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (930, 143, N'improvement/143_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (931, 144, N'improvement/144_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (932, 144, N'improvement/144_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (933, 144, N'improvement/144_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (934, 144, N'improvement/144_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (935, 144, N'improvement/144_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (936, 145, N'improvement/145_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (937, 145, N'improvement/145_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (938, 145, N'improvement/145_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (939, 145, N'improvement/145_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (940, 145, N'improvement/145_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (941, 146, N'improvement/146_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (942, 146, N'improvement/146_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (943, 146, N'improvement/146_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (944, 146, N'improvement/146_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (945, 146, N'improvement/146_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (946, 147, N'improvement/147_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (947, 147, N'improvement/147_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (948, 147, N'improvement/147_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (949, 147, N'improvement/147_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (950, 147, N'improvement/147_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (951, 148, N'improvement/148_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (952, 148, N'improvement/148_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (953, 148, N'improvement/148_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (954, 148, N'improvement/148_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (955, 148, N'improvement/148_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (956, 149, N'improvement/149_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (957, 149, N'improvement/149_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (958, 149, N'improvement/149_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (959, 149, N'improvement/149_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (960, 149, N'improvement/149_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (961, 150, N'improvement/150_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (962, 150, N'improvement/150_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (963, 150, N'improvement/150_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (964, 150, N'improvement/150_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (965, 150, N'improvement/150_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (966, 151, N'Home&Garden/201_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (967, 151, N'Home&Garden/201_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (968, 151, N'Home&Garden/201_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (969, 151, N'Home&Garden/201_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (970, 151, N'Home&Garden/201_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (971, 152, N'Home&Garden/202_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (972, 152, N'Home&Garden/202_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (973, 152, N'Home&Garden/202_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (974, 152, N'Home&Garden/202_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (975, 152, N'Home&Garden/202_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (976, 153, N'Home&Garden/203_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (977, 153, N'Home&Garden/203_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (978, 153, N'Home&Garden/203_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (979, 153, N'Home&Garden/203_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (980, 153, N'Home&Garden/203_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (981, 154, N'Home&Garden/204_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (982, 154, N'Home&Garden/204_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (983, 154, N'Home&Garden/204_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (984, 154, N'Home&Garden/204_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (985, 154, N'Home&Garden/204_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (986, 155, N'Home&Garden/205_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (987, 155, N'Home&Garden/205_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (988, 155, N'Home&Garden/205_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (989, 155, N'Home&Garden/205_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (990, 155, N'Home&Garden/205_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (991, 156, N'Home&Garden/206_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (992, 156, N'Home&Garden/206_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (993, 156, N'Home&Garden/206_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (994, 156, N'Home&Garden/206_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (995, 156, N'Home&Garden/206_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (996, 157, N'Home&Garden/207_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (997, 157, N'Home&Garden/207_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (998, 157, N'Home&Garden/207_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (999, 157, N'Home&Garden/207_4.jpg', 1)
GO
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1000, 157, N'Home&Garden/207_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1001, 158, N'Home&Garden/208_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1002, 158, N'Home&Garden/208_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1003, 158, N'Home&Garden/208_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1004, 158, N'Home&Garden/208_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1005, 158, N'Home&Garden/208_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1006, 159, N'Home&Garden/209_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1007, 159, N'Home&Garden/209_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1008, 159, N'Home&Garden/209_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1009, 159, N'Home&Garden/209_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1010, 159, N'Home&Garden/209_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1011, 160, N'Home&Garden/210_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1012, 160, N'Home&Garden/210_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1013, 160, N'Home&Garden/210_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1014, 160, N'Home&Garden/210_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1015, 160, N'Home&Garden/210_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1016, 161, N'Home&Garden/211_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1017, 161, N'Home&Garden/211_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1018, 161, N'Home&Garden/211_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1019, 161, N'Home&Garden/211_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1020, 161, N'Home&Garden/211_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1021, 162, N'Home&Garden/212_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1022, 162, N'Home&Garden/212_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1023, 162, N'Home&Garden/212_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1024, 162, N'Home&Garden/212_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1025, 162, N'Home&Garden/212_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1026, 163, N'Home&Garden/213_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1027, 163, N'Home&Garden/213_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1028, 163, N'Home&Garden/213_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1029, 163, N'Home&Garden/213_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1030, 163, N'Home&Garden/213_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1031, 164, N'Home&Garden/214_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1032, 164, N'Home&Garden/214_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1033, 164, N'Home&Garden/214_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1034, 164, N'Home&Garden/214_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1035, 164, N'Home&Garden/214_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1036, 165, N'Home&Garden/215_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1037, 165, N'Home&Garden/215_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1038, 165, N'Home&Garden/215_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1039, 165, N'Home&Garden/215_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1040, 165, N'Home&Garden/215_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1041, 166, N'Home&Garden/216_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1042, 166, N'Home&Garden/216_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1043, 166, N'Home&Garden/216_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1044, 166, N'Home&Garden/216_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1045, 166, N'Home&Garden/216_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1046, 167, N'Home&Garden/217_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1047, 167, N'Home&Garden/217_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1048, 167, N'Home&Garden/217_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1049, 167, N'Home&Garden/217_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1050, 167, N'Home&Garden/217_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1051, 168, N'Home&Garden/218_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1052, 168, N'Home&Garden/218_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1053, 168, N'Home&Garden/218_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1054, 168, N'Home&Garden/218_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1055, 168, N'Home&Garden/218_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1056, 169, N'Home&Garden/219_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1057, 169, N'Home&Garden/219_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1058, 169, N'Home&Garden/219_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1059, 169, N'Home&Garden/219_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1060, 169, N'Home&Garden/219_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1061, 170, N'Home&Garden/220_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1062, 170, N'Home&Garden/220_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1063, 170, N'Home&Garden/220_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1064, 170, N'Home&Garden/220_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1065, 170, N'Home&Garden/220_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1066, 171, N'Home&Garden/221_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1067, 171, N'Home&Garden/221_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1068, 171, N'Home&Garden/221_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1069, 171, N'Home&Garden/221_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1070, 171, N'Home&Garden/221_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1071, 172, N'Home&Garden/222_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1072, 172, N'Home&Garden/222_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1073, 172, N'Home&Garden/222_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1074, 172, N'Home&Garden/222_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1075, 172, N'Home&Garden/222_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1076, 173, N'Home&Garden/223_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1077, 173, N'Home&Garden/223_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1078, 173, N'Home&Garden/223_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1079, 173, N'Home&Garden/223_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1080, 173, N'Home&Garden/223_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1081, 174, N'Home&Garden/224_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1082, 174, N'Home&Garden/224_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1083, 174, N'Home&Garden/224_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1084, 174, N'Home&Garden/224_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1085, 174, N'Home&Garden/224_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1086, 175, N'Home&Garden/225_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1087, 175, N'Home&Garden/225_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1088, 175, N'Home&Garden/225_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1089, 175, N'Home&Garden/225_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1090, 175, N'Home&Garden/225_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1091, 176, N'Home&Garden/226_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1092, 176, N'Home&Garden/226_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1093, 176, N'Home&Garden/226_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1094, 176, N'Home&Garden/226_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1095, 176, N'Home&Garden/226_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1096, 177, N'Home&Garden/227_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1097, 177, N'Home&Garden/227_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1098, 177, N'Home&Garden/227_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1099, 177, N'Home&Garden/227_4.jpg', 1)
GO
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1100, 177, N'Home&Garden/227_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1101, 178, N'Home&Garden/228_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1102, 178, N'Home&Garden/228_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1103, 178, N'Home&Garden/228_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1104, 178, N'Home&Garden/228_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1105, 178, N'Home&Garden/228_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1106, 179, N'Home&Garden/229_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1107, 179, N'Home&Garden/229_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1108, 179, N'Home&Garden/229_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1109, 179, N'Home&Garden/229_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1110, 179, N'Home&Garden/229_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1111, 180, N'Home&Garden/230_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1112, 180, N'Home&Garden/230_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1113, 180, N'Home&Garden/230_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1114, 180, N'Home&Garden/230_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1115, 180, N'Home&Garden/230_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1116, 181, N'Home&Garden/231_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1117, 181, N'Home&Garden/231_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1118, 181, N'Home&Garden/231_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1119, 181, N'Home&Garden/231_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1120, 181, N'Home&Garden/231_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1121, 182, N'Home&Garden/232_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1122, 182, N'Home&Garden/232_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1123, 182, N'Home&Garden/232_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1124, 182, N'Home&Garden/232_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1125, 182, N'Home&Garden/232_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1126, 183, N'Home&Garden/233_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1127, 183, N'Home&Garden/233_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1128, 183, N'Home&Garden/233_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1129, 183, N'Home&Garden/233_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1130, 183, N'Home&Garden/233_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1131, 184, N'Home&Garden/234_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1132, 184, N'Home&Garden/234_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1133, 184, N'Home&Garden/234_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1134, 184, N'Home&Garden/234_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1135, 184, N'Home&Garden/234_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1136, 185, N'Home&Garden/235_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1137, 185, N'Home&Garden/235_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1138, 185, N'Home&Garden/235_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1139, 185, N'Home&Garden/235_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1140, 185, N'Home&Garden/235_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1141, 186, N'Home&Garden/236_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1142, 186, N'Home&Garden/236_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1143, 186, N'Home&Garden/236_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1144, 186, N'Home&Garden/236_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1145, 186, N'Home&Garden/236_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1146, 187, N'Home&Garden/237_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1147, 187, N'Home&Garden/237_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1148, 187, N'Home&Garden/237_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1149, 187, N'Home&Garden/237_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1150, 187, N'Home&Garden/237_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1151, 188, N'Home&Garden/238_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1152, 188, N'Home&Garden/238_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1153, 188, N'Home&Garden/238_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1154, 188, N'Home&Garden/238_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1155, 188, N'Home&Garden/238_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1156, 189, N'Home&Garden/239_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1157, 189, N'Home&Garden/239_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1158, 189, N'Home&Garden/239_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1159, 189, N'Home&Garden/239_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1160, 189, N'Home&Garden/239_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1161, 190, N'Home&Garden/240_1.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1162, 190, N'Home&Garden/240_2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1163, 190, N'Home&Garden/240_3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1164, 190, N'Home&Garden/240_4.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1165, 190, N'Home&Garden/240_5.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1166, 191, N'2.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1167, 191, N'3.jpg', 1)
INSERT [dbo].[image] ([id], [product_id], [image_name], [status]) VALUES (1168, 192, N'2.jpg', 1)
SET IDENTITY_INSERT [dbo].[image] OFF
GO
SET IDENTITY_INSERT [dbo].[order] ON 

INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (1, N'minh', 1, CAST(N'2021-04-04' AS Date), 55000, N'Hàng dễ vỡ, ship cẩn thận nhé !!!!!!', 5)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (2, N'minh', 2, CAST(N'2021-05-05' AS Date), 175000, N'ok', 5)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (3, N'minh', 3, CAST(N'2021-05-05' AS Date), 134000, N'okkkkk', 5)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (4, N'minh', 4, CAST(N'2021-05-05' AS Date), 321000, N'aaaaaaaaaaaaa', 5)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (1002, N'minh', 1002, CAST(N'2021-05-07' AS Date), 162000, N'okkkkkkkkkkkk', 5)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (1003, N'minh', 1003, CAST(N'2021-05-07' AS Date), 7.78, N'aaaaaaaaaaaaaa', 4)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (1004, N'minh', 1004, CAST(N'2021-05-07' AS Date), 19.53, N'sss', 4)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (1005, N'minh', 1005, CAST(N'2021-05-07' AS Date), 14.34, N'ddddddddđ', 4)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (1006, N'minh', 1006, CAST(N'2021-05-07' AS Date), 9.27, N'aaaaaaaaaaa', 4)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (1007, N'minh', 1007, CAST(N'2021-05-07' AS Date), 8.6, N'11111111111111111111', 4)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (1008, N'minh', 1008, CAST(N'2021-05-07' AS Date), 8.6, N'11111111111111111111', 4)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (1009, N'minh', 1009, CAST(N'2021-05-07' AS Date), 16.61, N'11111111111111', 4)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (2002, N'minh', 2002, CAST(N'2021-05-27' AS Date), 198000, N'asasss', 5)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (3002, N'anhng', 3002, CAST(N'2021-06-26' AS Date), 312000, N'okkkkkkkkkkkk', 5)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (3003, N'anhng', 3003, CAST(N'2021-06-26' AS Date), 502000, N'Ship can than', 5)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (3008, N'minh', 3008, CAST(N'2021-06-27' AS Date), 161000, N'oke', 5)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (3010, N'minh', 3010, CAST(N'2021-06-27' AS Date), 152000, N'aaaaaaaaaaaaaaaaaa', 5)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (3011, N'minh', 3011, CAST(N'2021-06-27' AS Date), 158000, N'aaa', 5)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (3012, N'minh', 3012, CAST(N'2021-06-27' AS Date), 12000, N'aaa', 5)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (3013, N'minh', 3013, CAST(N'2021-06-27' AS Date), 36000, N's', 5)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (3014, N'minh', 3014, CAST(N'2021-06-27' AS Date), 59000, N's', 5)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (3015, N'minh', 3015, CAST(N'2021-06-27' AS Date), 56000, N'g', 5)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (3016, N'minh', 3016, CAST(N'2021-06-27' AS Date), 97000, N'ok', 5)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (3017, N'anhng', 3017, CAST(N'2021-06-27' AS Date), 260000, N'Ẩn tên hàng', 5)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (3018, N'anhng', 3018, CAST(N'2021-06-27' AS Date), 18000, N'Ẩn tên hàng', 5)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (3019, N'anhng', 3019, CAST(N'2021-06-27' AS Date), 53000, N'sssss', 5)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (3020, N'anhng', 3020, CAST(N'2021-06-27' AS Date), 53000, N'sssss', 5)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (3021, N'anhng', 3021, CAST(N'2021-06-27' AS Date), 280000, N'nhẹ tay', 2)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (3022, N'anhng', 3022, CAST(N'2021-06-27' AS Date), 280000, N'nhẹ tay', 5)
INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (3023, N'anhng', 3023, CAST(N'2021-06-28' AS Date), 236000, N'Giao hàng trong giờ hành chính', 2)
SET IDENTITY_INSERT [dbo].[order] OFF
GO
SET IDENTITY_INSERT [dbo].[order_detail] ON 

INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (1, 1, 1, N'Repair Tool', CAST(17 AS Decimal(18, 0)), 1, N'tools/1_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (2, 1, 2, N'Measure Tools', CAST(9 AS Decimal(18, 0)), 1, N'tools/2_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (3, 1, 3, N'Manual Screw', CAST(9 AS Decimal(18, 0)), 1, N'tools/3_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (4, 1, 4, N'Painting Brush', CAST(6 AS Decimal(18, 0)), 1, N'tools/4_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (5, 1, 5, N'Hiro Crimping Pliers', CAST(15 AS Decimal(18, 0)), 1, N'tools/5_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (1002, 2, 2, N'Measure Tools', CAST(9 AS Decimal(18, 0)), 1, N'tools/2_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (1003, 2, 3, N'Manual Screw', CAST(9 AS Decimal(18, 0)), 1, N'tools/3_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (1004, 3, 1, N'Repair Tool', CAST(17 AS Decimal(18, 0)), 1, N'tools/1_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (1005, 3, 3, N'Manual Screw', CAST(9 AS Decimal(18, 0)), 1, N'tools/3_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (1006, 4, 1, N'Repair Tool', CAST(17 AS Decimal(18, 0)), 1, N'tools/1_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (2002, 1002, 185, N'Floor Mop Pad', CAST(16 AS Decimal(18, 0)), 1, N'Home&Garden/235_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (2003, 1003, 47, N'Anti-Slip Hex S2', CAST(8 AS Decimal(18, 0)), 1, N'tools/47_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (2004, 1004, 85, N'Protractor Ruler', CAST(20 AS Decimal(18, 0)), 1, N'Measurements/85_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (2005, 1005, 180, N'Straws Heart', CAST(14 AS Decimal(18, 0)), 1, N'Home&Garden/230_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (2006, 1006, 2, N'Measure Tools', CAST(9 AS Decimal(18, 0)), 1, N'tools/2_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (2007, 1007, 3, N'Manual Screw', CAST(9 AS Decimal(18, 0)), 1, N'tools/3_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (2008, 1008, 3, N'Manual Screw', CAST(9 AS Decimal(18, 0)), 1, N'tools/3_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (2009, 1009, 1, N'Repair Tool', CAST(17 AS Decimal(18, 0)), 1, N'tools/1_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (3002, 2002, 2, N'Measure Tools', CAST(9 AS Decimal(18, 0)), 1, N'tools/2_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (3003, 2002, 3, N'Manual Screw', CAST(9 AS Decimal(18, 0)), 1, N'tools/3_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (4002, 3002, 1, N'Repair Tool', CAST(17 AS Decimal(18, 0)), 2, N'tools/1_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (4003, 3002, 2, N'Measure Tools', CAST(9 AS Decimal(18, 0)), 1, N'tools/2_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (4004, 3002, 4, N'Painting Brush', CAST(6 AS Decimal(18, 0)), 3, N'tools/4_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (4005, 3003, 1, N'Repair Tools', CAST(17 AS Decimal(18, 0)), 1, N'tools/1_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (4010, 3008, 1, N'Repair Tools', CAST(17 AS Decimal(18, 0)), 2, N'tools/1_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (4013, 3010, 2, N'Measure Tools', CAST(9 AS Decimal(18, 0)), 2, N'tools/2_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (4014, 3010, 4, N'Painting Brush', CAST(6 AS Decimal(18, 0)), 6, N'tools/4_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (4015, 3011, 6, N'Stripping Pliers', CAST(12 AS Decimal(18, 0)), 3, N'tools/6_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (4016, 3012, 6, N'Stripping Pliers', CAST(12 AS Decimal(18, 0)), 3, N'tools/6_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (4017, 3013, 4, N'Painting Brush', CAST(6 AS Decimal(18, 0)), 1, N'tools/4_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (4018, 3014, 4, N'Painting Brush', CAST(6 AS Decimal(18, 0)), 1, N'tools/4_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (4019, 3015, 5, N'Hiro Crimping Pliers', CAST(15 AS Decimal(18, 0)), 1, N'tools/5_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (4020, 3016, 1, N'Repair Tools', CAST(17 AS Decimal(18, 0)), 1, N'tools/1_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (4021, 3016, 104, N'Plastic Shower ', CAST(14 AS Decimal(18, 0)), 1, N'improvement/104_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (4022, 3016, 59, N'Cordless Drill', CAST(23 AS Decimal(18, 0)), 2, N'tools/59_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (4023, 3016, 142, N'Door Lock', CAST(22 AS Decimal(18, 0)), 2, N'improvement/142_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (4024, 3016, 143, N'Car Interior', CAST(19 AS Decimal(18, 0)), 1, N'improvement/143_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (4025, 3017, 1, N'Repair Tools', CAST(17 AS Decimal(18, 0)), 1, N'tools/1_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (4026, 3017, 2, N'Measure Tools', CAST(9 AS Decimal(18, 0)), 1, N'tools/2_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (4027, 3018, 10, N'Brush Point Paint', CAST(18 AS Decimal(18, 0)), 1, N'tools/10_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (4028, 3019, 1, N'Repair Tools', CAST(17 AS Decimal(18, 0)), 1, N'tools/1_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (4029, 3019, 2, N'Measure Tools', CAST(9 AS Decimal(18, 0)), 1, N'tools/2_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (4030, 3019, 5, N'Hiro Crimping Pliers', CAST(15 AS Decimal(18, 0)), 1, N'tools/5_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (4031, 3019, 3, N'Manual Screw', CAST(9 AS Decimal(18, 0)), 1, N'tools/3_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (4032, 3019, 9, N'Cutting Saw', CAST(3 AS Decimal(18, 0)), 2, N'tools/9_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (4033, 3020, 1, N'Repair Tools', CAST(17 AS Decimal(18, 0)), 1, N'tools/1_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (4034, 3020, 2, N'Measure Tools', CAST(9 AS Decimal(18, 0)), 1, N'tools/2_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (4035, 3020, 5, N'Hiro Crimping Pliers', CAST(15 AS Decimal(18, 0)), 1, N'tools/5_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (4036, 3020, 3, N'Manual Screw', CAST(9 AS Decimal(18, 0)), 1, N'tools/3_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (4037, 3020, 9, N'Cutting Saw', CAST(3 AS Decimal(18, 0)), 2, N'tools/9_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (4038, 3021, 1, N'Kìm bấm đinh', CAST(150000 AS Decimal(18, 0)), 2, N'tools/1_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (4039, 3021, 2, N'Dụng cụ sửa kim', CAST(100000 AS Decimal(18, 0)), 2, N'tools/2_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (4040, 3021, 3, N'Tua vit', CAST(30000 AS Decimal(18, 0)), 2, N'tools/3_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (4041, 3022, 1, N'Kìm bấm đinh', CAST(150000 AS Decimal(18, 0)), 2, N'tools/1_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (4042, 3022, 2, N'Dụng cụ sửa kim', CAST(100000 AS Decimal(18, 0)), 2, N'tools/2_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (4043, 3022, 3, N'Tua vit', CAST(30000 AS Decimal(18, 0)), 2, N'tools/3_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (4044, 3023, 1, N'Kìm bấm đinh', CAST(150000 AS Decimal(18, 0)), 1, N'tools/1_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (4045, 3023, 25, N'Băng dính dán ', CAST(12000 AS Decimal(18, 0)), 3, N'tools/25_0.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (4046, 3023, 17, N'Làm nhuyễn ', CAST(50000 AS Decimal(18, 0)), 1, N'tools/17_0.jpg')
SET IDENTITY_INSERT [dbo].[order_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (1, 1, N'HW-01', N'Kìm bấm đinh', 10, 150000, N'Thân bằng thép dày xử lý bề mặt đen nhám, tay cầm bằng nhựa chất lượng cao

- Dùng cho đinh rút nhôm kích thước: 2.4mm, 3.2mm, 4mm và 4.8mm ( thông dụng )

- Sản xuất bởi thương hiệu TOLSEN, được đánh giá là thương hiệu chất lượng và giá phù hợp

- Sản phẩm đạt tiêu chuẩn xuất khẩu Châu Âu', N'tools/1_0.jpg', CAST(N'2019-10-09' AS Date), 3, 1, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (2, 1, N'HW-02', N'Dụng cụ sửa kim', 10, 100000, N'- Sản xuất bởi thương hiệu TOLSEN, được đánh giá là thương hiệu chất lượng và giá phù hợp

- Sản phẩm đạt tiêu chuẩn xuất khẩu Châu Âu', N'tools/2_0.jpg', CAST(N'2019-10-09' AS Date), 2, 1, 0.11)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (3, 1, N'HW-03', N'Tua vit', 10, 30000, N'Là sản phẩm chuyên dụng trong nhiều ngành nghề

- Sản phẩm chống gỉ, có độ bền cao

- Thiết kế nhỏ gọn, tinh xảo', N'tools/3_0.jpg', CAST(N'2019-10-09' AS Date), 1, 1, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (4, 1, N'HW-04', N'Dụng cụ ghép ', 10, 40000, N'Là sản phẩm chuyên dụng trong nhiều ngành nghề

- Sản phẩm chống gỉ, có độ bền cao

- Thiết kế nhỏ gọn, tinh xảo', N'tools/4_0.jpg', CAST(N'2019-10-09' AS Date), 1, 1, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (5, 1, N'HW-05', N'Cắt sắt mini', 10, 40000, N'Là sản phẩm chuyên dụng trong nhiều ngành nghề

- Sản phẩm chống gỉ, có độ bền cao

- Thiết kế nhỏ gọn, tinh xảo', N'tools/5_0.jpg', CAST(N'2019-10-09' AS Date), 3, 1, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (6, 1, N'HW-06', N'Kìm đa năng', 10, 70000, N'Kìm cắt FUTURO -# 441718 chuẩn DIN ISO 5745, chế tạo bằng thép hợp kim siêu cứng 60-62HRC. Sản phẩm nhập khẩu từ Đức, bảo hành tới 2 năm.', N'tools/6_0.jpg', CAST(N'2019-10-09' AS Date), 2, 1, 0.15)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (7, 1, N'HW-07', N'Bộ tua vit mini', 10, 50000, N'- Là sản phẩm chuyên dụng trong nhiều ngành nghề

- Sản phẩm chống gỉ, có độ bền cao

- Thiết kế nhỏ gọn, tinh xảo', N'tools/7_0.jpg', CAST(N'2019-10-09' AS Date), 3, 1, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (8, 1, N'HW-08', N'Tua vit FAVO', 10, 30000, N'Là sản phẩm chuyên dụng trong nhiều ngành nghề

Sản phẩm chống gỉ, có độ bền cao
', N'tools/8_0.jpg', CAST(N'2019-10-09' AS Date), 2, 1, 0.08)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (9, 1, N'HW-09', N'Hút bụi mini cầm tay', 12, 20000, N'Là sản phẩm chuyên dụng trong nhiều ngành nghề
Thiết kế nhỏ gọn, tinh xảo', N'tools/9_0.jpg', CAST(N'2019-10-09' AS Date), 1, 1, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (10, 1, N'HW-010', N'Miếng mút dán', 12, 10000, N'Là sản phẩm chuyên dụng trong nhiều ngành nghề', N'tools/10_0.jpg', CAST(N'2019-10-18' AS Date), 2, 1, 0.2)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (11, 1, N'HW-011', N'Kìm Nhật đa năng', 13, 40000, N'Thiết kế mới mẻ, độc lạ. Sử dụng cho nhiều ngành nghề.
- Sản phẩm chống gỉ, có độ bền cao', N'tools/11_0.jpg', CAST(N'2019-10-18' AS Date), 2, 1, 0.13)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (12, 1, N'HW-012', N'Dụng cụ cạy, mở mini', 13, 20000, N'Thiết kế nhỏ gọn, dễ cầm theo', N'tools/12_0.jpg', CAST(N'2019-10-18' AS Date), 1, 1, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (13, 1, N'HW-013', N'Miếng dán nhựa déo', 14, 30000, N'Nhỏ gọn, không bị đau tay. Lớp dính chặt chẽ không bị bong tróc', N'tools/13_0.jpg', CAST(N'2019-10-18' AS Date), 2, 1, 0.1)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (14, 1, N'HW-014', N'Bộ làm vườn mini', 14, 50000, N'Thiết kế nhỏ gọn, thuận tiện cầm tay. Phù hợp trồng chậu nhỏ', N'tools/14_0.jpg', CAST(N'2019-10-18' AS Date), 2, 14, 0.1)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (15, 1, N'HW-015', N'KÌm vặn mini', 14, 10000, N'thiết kế nhỏ gọn, tinh xảo, nhiều màu sắc', N'tools/15_0.jpg', CAST(N'2019-10-18' AS Date), 2, 1, 0.02)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (16, 1, N'HW-016', N'Bộ khắc gỗ cầm tay', 14, 120000, N'Thiết kế nhỏ gọn, tinh xảo', N'tools/16_0.jpg', CAST(N'2019-10-18' AS Date), 2, 1, 0.02)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (17, 1, N'HW-017', N'Làm nhuyễn ', 14, 50000, N'•	Sản phẩm làm bằng inox cao cấp , không bị gỉ sét, an toàn cho sức khỏe.
•	Dễ dàng lau rửa dụng cụ sau khi sử dụng xong
•	Kích thước: 19.5 x 6.5 cm', N'tools/17_0.jpg', CAST(N'2019-10-18' AS Date), 2, 8, 0.09)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (18, 1, N'HW-018', N'Bộ cờ lê, tua vit', 14, 70000, N'•	Sản phẩm làm bằng inox cao cấp , không bị gỉ sét, an toàn cho sức khỏe.
•	Dễ dàng lau rửa dụng cụ sau khi sử dụng xong
•	Kích thước: 19.5 x 6.5 cm', N'tools/18_0.jpg', CAST(N'2019-10-18' AS Date), 1, 1, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (19, 1, N'HW-019', N'Mũi khoan', 14, 40000, N'- Sản phẩm chống gỉ, có độ bền cao', N'tools/19_0.jpg', CAST(N'2019-10-18' AS Date), 2, 1, 0.15)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (20, 1, N'HW-020', N'DỤng cụ tháo ốc vit', 14, 50000, N'- Sản phẩm chống gỉ, có độ bền cao', N'tools/20_0.jpg', CAST(N'2019-10-18' AS Date), 1, 1, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (21, 1, N'HW-021', N'Bộ tháo lắp', 14, 200000, N'- Sản phẩm chống gỉ, có độ bền cao', N'tools/21_0.jpg', CAST(N'2019-10-18' AS Date), 1, 2, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (22, 1, N'HW-022', N'Dụng cụ chống xước', 14, 40000, N'- Sản phẩm chống gỉ, có độ bền cao', N'tools/22_0.jpg', CAST(N'2019-10-18' AS Date), 1, 2, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (23, 1, N'HW-023', N'Cuộn dây đồng mini', 14, 50000, N'- Sản phẩm chống gỉ, có độ bền cao', N'tools/23_0.jpg', CAST(N'2019-10-18' AS Date), 3, 3, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (24, 1, N'HW-024', N'Túi đựng dụng cụ', 14, 100000, N'- Sản phẩm chống xước, có độ bền cao', N'tools/24_0.jpg', CAST(N'2019-10-18' AS Date), 2, 10, 0.14)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (25, 1, N'HW-025', N'Băng dính dán ', 14, 12000, N'- Sản phẩm chống gỉ, có độ bền cao', N'tools/25_0.jpg', CAST(N'2019-10-18' AS Date), 3, 7, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (26, 1, N'HW-026', N'Đinh lắp ráp gỗ', 14, 10000, N'- Sản phẩm chống gỉ, có độ bền cao', N'tools/26_0.jpg', CAST(N'2019-10-18' AS Date), 3, 2, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (27, 1, N'HW-027', N'Hộp ốc vít nhiều kích thước', 14, 100000, N'- Sản phẩm chống gỉ, có độ bền cao', N'tools/27_0.jpg', CAST(N'2019-10-18' AS Date), 3, 2, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (28, 1, N'HW-028', N'Răng cưa ', 14, 30000, N'- Sản phẩm chống gỉ, có độ bền cao', N'tools/28_0.jpg', CAST(N'2019-10-18' AS Date), 1, 2, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (29, 1, N'HW-029', N'Đầu bọc mũi khoan', 14, 10000, N'- Sản phẩm chống gỉ, có độ bền cao', N'tools/29_0.jpg', CAST(N'2019-10-18' AS Date), 3, 2, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (30, 1, N'HW-030', N'Cuộn dây đồng 10cm', 14, 70000, N'- Sản phẩm chống gỉ, có độ bền cao. Đường kính 10cm', N'tools/30_0.jpg', CAST(N'2019-10-18' AS Date), 1, 1, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (31, 1, N'HW-031', N'Bộ dao đa năng', 14, 265000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'tools/31_0.jpg', CAST(N'2019-10-18' AS Date), 2, 2, 0.07)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (32, 1, N'HW-032', N'Máy hút bụi', 14, 406000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'tools/32_0.jpg', CAST(N'2019-10-18' AS Date), 2, 2, 0.03)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (33, 1, N'HW-033', N'Máy lọc nước', 14, 329000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'tools/33_0.jpg', CAST(N'2019-10-18' AS Date), 3, 2, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (34, 1, N'HW-034', N'Dụng cụ đựng rau', 14, 340000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'tools/34_0.jpg', CAST(N'2019-10-18' AS Date), 2, 2, 0.16)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (35, 1, N'HW-035', N'Thảm trải nhà', 14, 454000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'tools/35_0.jpg', CAST(N'2019-10-18' AS Date), 2, 2, 0.02)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (36, 1, N'HW-036', N'Dung cụ lau nhà', 14, 483000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'tools/36_0.jpg', CAST(N'2019-10-18' AS Date), 2, 2, 0.1)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (37, 1, N'HW-037', N'Dụng cụ đào bới', 14, 359000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'tools/37_0.jpg', CAST(N'2019-10-18' AS Date), 1, 2, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (38, 1, N'HW-038', N'Máy vắt cam', 14, 164000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'tools/38_0.jpg', CAST(N'2019-10-18' AS Date), 2, 2, 0.2)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (39, 1, N'HW-039', N'Máy say sinh tố', 14, 394000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'tools/39_0.jpg', CAST(N'2019-10-18' AS Date), 2, 2, 0.13)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (40, 1, N'HW-040', N'Máy đánh trứng', 14, 292000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'tools/40_0.jpg', CAST(N'2019-10-18' AS Date), 1, 2, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (41, 1, N'HW-041', N'Bộ dao đa năng', 14, 210000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'tools/41_0.jpg', CAST(N'2019-10-18' AS Date), 3, 3, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (42, 1, N'HW-042', N'Máy hút bụi', 14, 488000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'tools/42_0.jpg', CAST(N'2019-10-18' AS Date), 3, 3, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (43, 1, N'HW-043', N'Máy lọc nước', 14, 241000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'tools/43_0.jpg', CAST(N'2019-10-18' AS Date), 2, 3, 0.1)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (44, 1, N'HW-044', N'Dụng cụ đựng rau', 14, 262000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'tools/44_0.jpg', CAST(N'2019-10-18' AS Date), 1, 3, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (45, 1, N'HW-045', N'Thảm trải nhà', 14, 320000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'tools/45_0.jpg', CAST(N'2019-10-18' AS Date), 3, 3, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (46, 1, N'HW-046', N'Dung cụ lau nhà', 14, 346000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'tools/46_0.jpg', CAST(N'2019-10-18' AS Date), 2, 3, 0.08)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (47, 1, N'HW-047', N'Dụng cụ đào bới', 14, 387000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'tools/47_0.jpg', CAST(N'2019-10-18' AS Date), 2, 3, 0.19)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (48, 1, N'HW-048', N'Máy vắt cam', 14, 476000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'tools/48_0.jpg', CAST(N'2019-10-18' AS Date), 2, 3, 0.12)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (49, 1, N'HW-049', N'Máy say sinh tố', 14, 187000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'tools/49_0.jpg', CAST(N'2019-10-18' AS Date), 1, 3, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (50, 1, N'HW-050', N'Máy đánh trứng', 14, 393000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'tools/50_0.jpg', CAST(N'2019-10-18' AS Date), 1, 3, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (51, 1, N'HW-051', N'Bộ dao đa năng', 14, 265000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'tools/51_0.jpg', CAST(N'2019-10-27' AS Date), 3, 3, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (52, 1, N'HW-052', N'Máy hút bụi', 14, 160000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'tools/52_0.jpg', CAST(N'2019-10-27' AS Date), 2, 3, 0.01)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (53, 1, N'HW-053', N'Máy lọc nước', 14, 257000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'tools/53_0.jpg', CAST(N'2019-10-27' AS Date), 2, 3, 0.14)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (54, 1, N'HW-054', N'Dụng cụ đựng rau', 14, 336000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'tools/54_0.jpg', CAST(N'2019-10-27' AS Date), 2, 3, 0.01)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (55, 1, N'HW-055', N'Thảm trải nhà', 14, 374000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'tools/55_0.jpg', CAST(N'2019-10-27' AS Date), 1, 3, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (56, 1, N'HW-056', N'Dung cụ lau nhà', 14, 324000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'tools/56_0.jpg', CAST(N'2019-10-27' AS Date), 3, 3, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (57, 1, N'HW-057', N'Dụng cụ đào bới', 14, 338000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'tools/57_0.jpg', CAST(N'2019-10-27' AS Date), 2, 3, 0.07)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (58, 1, N'HW-058', N'Máy vắt cam', 14, 379000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'tools/58_0.jpg', CAST(N'2019-10-27' AS Date), 2, 3, 0.07)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (59, 1, N'HW-059', N'Máy say sinh tố', 14, 300000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'tools/59_0.jpg', CAST(N'2019-10-27' AS Date), 2, 3, 0.01)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (60, 1, N'HW-060', N'Máy đánh trứng', 14, 331000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'tools/60_0.jpg', CAST(N'2019-10-27' AS Date), 3, 3, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (61, 2, N'HW-061', N'Bộ dao đa năng', 20, 203000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Measurements/61_0.jpg', CAST(N'2019-11-01' AS Date), 2, 4, 0.08)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (62, 2, N'HW-062', N'Máy hút bụi', 20, 265000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Measurements/62_0.jpg', CAST(N'2019-11-01' AS Date), 3, 4, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (63, 2, N'HW-063', N'Máy lọc nước', 20, 410000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Measurements/63_0.jpg', CAST(N'2019-11-01' AS Date), 3, 4, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (64, 2, N'HW-064', N'Dụng cụ đựng rau', 20, 158000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Measurements/64_0.jpg', CAST(N'2019-11-01' AS Date), 2, 4, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (65, 2, N'HW-065', N'Thảm trải nhà', 20, 379000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Measurements/65_0.jpg', CAST(N'2019-11-01' AS Date), 3, 4, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (66, 2, N'HW-066', N'Dung cụ lau nhà', 20, 453000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Measurements/66_0.jpg', CAST(N'2019-11-01' AS Date), 1, 4, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (67, 2, N'HW-067', N'Dụng cụ đào bới', 20, 332000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Measurements/67_0.jpg', CAST(N'2019-11-01' AS Date), 3, 4, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (68, 2, N'HW-068', N'Máy vắt cam', 20, 193000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Measurements/68_0.jpg', CAST(N'2019-11-01' AS Date), 2, 4, 0.19)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (69, 2, N'HW-069', N'Máy say sinh tố', 20, 403000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Measurements/69_0.jpg', CAST(N'2019-11-01' AS Date), 2, 4, 0.07)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (70, 2, N'HW-070', N'Máy đánh trứng', 20, 276000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Measurements/70_0.jpg', CAST(N'2019-11-01' AS Date), 2, 4, 0.07)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (71, 2, N'HW-071', N'Bộ dao đa năng', 20, 224000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Measurements/71_0.jpg', CAST(N'2019-11-01' AS Date), 2, 4, 0.09)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (72, 2, N'HW-072', N'Máy hút bụi', 20, 289000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Measurements/72_0.jpg', CAST(N'2019-11-01' AS Date), 1, 4, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (73, 2, N'HW-073', N'Máy lọc nước', 20, 351000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Measurements/73_0.jpg', CAST(N'2019-11-01' AS Date), 3, 4, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (74, 2, N'HW-074', N'Dụng cụ đựng rau', 20, 217000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Measurements/74_0.jpg', CAST(N'2019-11-01' AS Date), 3, 4, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (75, 2, N'HW-075', N'Thảm trải nhà', 20, 467000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Measurements/75_0.jpg', CAST(N'2019-11-01' AS Date), 2, 4, 0.01)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (76, 2, N'HW-076', N'Dung cụ lau nhà', 20, 294000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Measurements/76_0.jpg', CAST(N'2019-11-01' AS Date), 1, 4, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (77, 2, N'HW-077', N'Dụng cụ đào bới', 20, 400000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Measurements/77_0.jpg', CAST(N'2019-11-01' AS Date), 3, 4, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (78, 2, N'HW-078', N'Máy vắt cam', 20, 279000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Measurements/78_0.jpg', CAST(N'2019-11-01' AS Date), 3, 4, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (79, 2, N'HW-079', N'Máy say sinh tố', 20, 463000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Measurements/79_0.jpg', CAST(N'2019-11-01' AS Date), 3, 4, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (80, 2, N'HW-080', N'Máy đánh trứng', 20, 208000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Measurements/80_0.jpg', CAST(N'2019-11-01' AS Date), 3, 4, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (81, 2, N'HW-081', N'Bộ dao đa năng', 10, 389000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Measurements/81_0.jpg', CAST(N'2019-11-03' AS Date), 1, 5, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (82, 2, N'HW-082', N'Máy hút bụi', 10, 266000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Measurements/82_0.jpg', CAST(N'2019-11-03' AS Date), 2, 5, 0.12)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (83, 2, N'HW-083', N'Máy lọc nước', 10, 377000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Measurements/83_0.jpg', CAST(N'2019-11-03' AS Date), 2, 5, 0.14)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (84, 2, N'HW-084', N'Dụng cụ đựng rau', 10, 455000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Measurements/84_0.jpg', CAST(N'2019-11-03' AS Date), 1, 5, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (85, 2, N'HW-085', N'Thảm trải nhà', 10, 231000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Measurements/85_0.jpg', CAST(N'2019-11-03' AS Date), 2, 5, 0.16)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (86, 2, N'HW-086', N'Dung cụ lau nhà', 10, 161000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Measurements/86_0.jpg', CAST(N'2019-11-03' AS Date), 3, 5, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (87, 2, N'HW-087', N'Dụng cụ đào bới', 10, 410000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Measurements/87_0.jpg', CAST(N'2019-11-03' AS Date), 2, 5, 0.15)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (88, 2, N'HW-088', N'Máy vắt cam', 10, 245000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Measurements/88_0.jpg', CAST(N'2019-11-03' AS Date), 1, 5, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (89, 2, N'HW-089', N'Máy say sinh tố', 10, 280000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Measurements/89_0.jpg', CAST(N'2019-11-03' AS Date), 3, 5, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (90, 2, N'HW-090', N'Máy đánh trứng', 10, 165000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Measurements/90_0.jpg', CAST(N'2019-11-03' AS Date), 2, 5, 0.02)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (91, 2, N'HW-091', N'Bộ dao đa năng', 10, 496000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Measurements/91_0.jpg', CAST(N'2019-11-03' AS Date), 3, 5, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (92, 2, N'HW-092', N'Máy hút bụi', 10, 398000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Measurements/92_0.jpg', CAST(N'2019-11-04' AS Date), 1, 5, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (93, 2, N'HW-093', N'Máy lọc nước', 10, 468000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Measurements/93_0.jpg', CAST(N'2019-11-04' AS Date), 1, 5, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (94, 2, N'HW-094', N'Dụng cụ đựng rau', 10, 288000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Measurements/94_0.jpg', CAST(N'2019-11-04' AS Date), 2, 5, 0.07)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (95, 2, N'HW-095', N'Thảm trải nhà', 10, 359000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Measurements/95_0.jpg', CAST(N'2019-11-04' AS Date), 2, 5, 0.11)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (96, 2, N'HW-096', N'Dung cụ lau nhà', 10, 450000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Measurements/96_0.jpg', CAST(N'2019-11-04' AS Date), 1, 5, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (97, 2, N'HW-097', N'Dụng cụ đào bới', 10, 268000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Measurements/97_0.jpg', CAST(N'2019-11-04' AS Date), 3, 5, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (98, 2, N'HW-098', N'Máy vắt cam', 10, 366000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Measurements/98_0.jpg', CAST(N'2019-11-04' AS Date), 1, 5, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (99, 2, N'HW-099', N'Máy say sinh tố', 10, 474000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Measurements/99_0.jpg', CAST(N'2019-11-04' AS Date), 2, 5, 0.04)
GO
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (100, 2, N'HW-100', N'Máy đánh trứng', 10, 210000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Measurements/100_0.jpg', CAST(N'2019-11-04' AS Date), 2, 5, 0.01)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (101, 3, N'HW-101', N'Bộ dao đa năng', 10, 347000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/101_0.jpg', CAST(N'2019-11-08' AS Date), 2, 7, 0.18)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (102, 3, N'HW-102', N'Máy hút bụi', 10, 250000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/102_0.jpg', CAST(N'2019-11-08' AS Date), 2, 7, 0.11)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (103, 3, N'HW-103', N'Máy lọc nước', 10, 471000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/103_0.jpg', CAST(N'2019-11-08' AS Date), 1, 7, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (104, 3, N'HW-104', N'Dụng cụ đựng rau', 10, 335000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/104_0.jpg', CAST(N'2019-11-08' AS Date), 1, 7, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (105, 3, N'HW-105', N'Thảm trải nhà', 10, 414000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/105_0.jpg', CAST(N'2019-11-08' AS Date), 3, 7, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (106, 3, N'HW-106', N'Dung cụ lau nhà', 10, 333000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/106_0.jpg', CAST(N'2019-11-08' AS Date), 2, 7, 0.08)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (107, 3, N'HW-107', N'Dụng cụ đào bới', 10, 318000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/107_0.jpg', CAST(N'2019-11-08' AS Date), 1, 7, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (108, 3, N'HW-108', N'Máy vắt cam', 10, 232000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/108_0.jpg', CAST(N'2019-11-08' AS Date), 1, 7, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (109, 3, N'HW-109', N'Máy say sinh tố', 10, 231000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/109_0.jpg', CAST(N'2019-11-08' AS Date), 1, 7, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (110, 3, N'HW-110', N'Máy đánh trứng', 10, 200000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/110_0.jpg', CAST(N'2019-11-08' AS Date), 2, 7, 0.1)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (111, 3, N'HW-111', N'Bộ dao đa năng', 10, 158000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/111_0.jpg', CAST(N'2019-11-08' AS Date), 2, 7, 0.03)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (112, 3, N'HW-112', N'Máy hút bụi', 10, 412000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/112_0.jpg', CAST(N'2019-11-08' AS Date), 2, 7, 0.04)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (113, 3, N'HW-113', N'Máy lọc nước', 10, 353000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/113_0.jpg', CAST(N'2019-11-08' AS Date), 2, 7, 0.19)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (114, 3, N'HW-114', N'Dụng cụ đựng rau', 10, 408000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/114_0.jpg', CAST(N'2019-11-08' AS Date), 2, 7, 0.08)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (115, 3, N'HW-115', N'Thảm trải nhà', 10, 362000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/115_0.jpg', CAST(N'2019-11-08' AS Date), 2, 7, 0.04)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (116, 3, N'HW-116', N'Dung cụ lau nhà', 10, 243000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/116_0.jpg', CAST(N'2019-11-08' AS Date), 1, 7, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (117, 3, N'HW-117', N'Dụng cụ đào bới', 10, 272000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/117_0.jpg', CAST(N'2019-11-08' AS Date), 1, 7, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (118, 3, N'HW-118', N'Máy vắt cam', 10, 427000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/118_0.jpg', CAST(N'2019-11-08' AS Date), 3, 7, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (119, 3, N'HW-119', N'Máy say sinh tố', 10, 408000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/119_0.jpg', CAST(N'2019-11-08' AS Date), 1, 7, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (120, 3, N'HW-120', N'Máy đánh trứng', 10, 337000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/120_0.jpg', CAST(N'2019-11-08' AS Date), 3, 7, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (121, 3, N'HW-121', N'Bộ dao đa năng', 10, 190000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/121_0.jpg', CAST(N'2019-11-10' AS Date), 3, 8, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (122, 3, N'HW-122', N'Máy hút bụi', 10, 210000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/122_0.jpg', CAST(N'2019-11-10' AS Date), 1, 8, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (123, 3, N'HW-123', N'Máy lọc nước', 10, 188000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/123_0.jpg', CAST(N'2019-11-10' AS Date), 1, 8, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (124, 3, N'HW-124', N'Dụng cụ đựng rau', 10, 205000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/124_0.jpg', CAST(N'2019-11-10' AS Date), 1, 8, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (125, 3, N'HW-125', N'Thảm trải nhà', 10, 202000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/125_0.jpg', CAST(N'2019-11-10' AS Date), 1, 8, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (126, 3, N'HW-126', N'Dung cụ lau nhà', 10, 227000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/126_0.jpg', CAST(N'2019-11-10' AS Date), 2, 8, 0.12)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (127, 3, N'HW-127', N'Dụng cụ đào bới', 10, 193000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/127_0.jpg', CAST(N'2019-11-10' AS Date), 2, 8, 0.08)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (128, 3, N'HW-128', N'Máy vắt cam', 10, 440000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/128_0.jpg', CAST(N'2019-11-10' AS Date), 3, 8, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (129, 3, N'HW-129', N'Máy say sinh tố', 10, 307000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/129_0.jpg', CAST(N'2019-11-10' AS Date), 1, 8, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (130, 3, N'HW-130', N'Máy đánh trứng', 10, 426000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/130_0.jpg', CAST(N'2019-11-10' AS Date), 1, 8, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (131, 3, N'HW-131', N'Bộ dao đa năng', 10, 229000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/131_0.jpg', CAST(N'2019-11-10' AS Date), 3, 9, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (132, 3, N'HW-132', N'Máy hút bụi', 10, 291000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/132_0.jpg', CAST(N'2019-11-10' AS Date), 2, 9, 0.14)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (133, 3, N'HW-133', N'Máy lọc nước', 10, 473000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/133_0.jpg', CAST(N'2019-11-10' AS Date), 3, 9, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (134, 3, N'HW-134', N'Dụng cụ đựng rau', 10, 309000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/134_0.jpg', CAST(N'2019-11-10' AS Date), 1, 9, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (135, 3, N'HW-135', N'Thảm trải nhà', 10, 240000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/135_0.jpg', CAST(N'2019-11-10' AS Date), 2, 9, 0.11)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (136, 3, N'HW-136', N'Dung cụ lau nhà', 10, 258000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/136_0.jpg', CAST(N'2019-11-10' AS Date), 1, 9, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (137, 3, N'HW-137', N'Dụng cụ đào bới', 10, 209000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/137_0.jpg', CAST(N'2019-11-10' AS Date), 3, 9, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (138, 3, N'HW-138', N'Máy vắt cam', 10, 256000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/138_0.jpg', CAST(N'2019-11-10' AS Date), 2, 9, 0.04)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (139, 3, N'HW-139', N'Máy say sinh tố', 10, 402000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/139_0.jpg', CAST(N'2019-11-10' AS Date), 3, 9, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (140, 3, N'HW-140', N'Máy đánh trứng', 10, 494000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/140_0.jpg', CAST(N'2019-11-10' AS Date), 2, 9, 0.01)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (141, 3, N'HW-141', N'Bộ dao đa năng', 10, 260000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/141_0.jpg', CAST(N'2019-11-10' AS Date), 3, 9, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (142, 3, N'HW-142', N'Máy hút bụi', 10, 157000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/142_0.jpg', CAST(N'2019-11-11' AS Date), 1, 9, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (143, 3, N'HW-143', N'Máy lọc nước', 10, 405000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/143_0.jpg', CAST(N'2019-11-11' AS Date), 2, 9, 0.16)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (144, 3, N'HW-144', N'Dụng cụ đựng rau', 10, 476000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/144_0.jpg', CAST(N'2019-11-11' AS Date), 1, 9, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (145, 3, N'HW-145', N'Thảm trải nhà', 10, 445000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/145_0.jpg', CAST(N'2019-11-11' AS Date), 1, 9, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (146, 3, N'HW-146', N'Dung cụ lau nhà', 10, 233000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/146_0.jpg', CAST(N'2019-11-11' AS Date), 3, 9, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (147, 3, N'HW-147', N'Dụng cụ đào bới', 10, 329000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/147_0.jpg', CAST(N'2019-11-11' AS Date), 3, 9, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (148, 3, N'HW-148', N'Máy vắt cam', 10, 344000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/148_0.jpg', CAST(N'2019-11-11' AS Date), 2, 9, 0.02)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (149, 3, N'HW-149', N'Máy say sinh tố', 10, 314000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/149_0.jpg', CAST(N'2019-11-11' AS Date), 2, 9, 0.13)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (150, 3, N'HW-150', N'Máy đánh trứng', 10, 392000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'improvement/150_0.jpg', CAST(N'2019-11-11' AS Date), 1, 9, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (151, 5, N'HW-151', N'Bộ dao đa năng', 10, 208000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Home&Garden/201_0.jpg', CAST(N'2019-11-11' AS Date), 1, 14, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (152, 5, N'HW-152', N'Máy hút bụi', 10, 330000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Home&Garden/202_0.jpg', CAST(N'2019-11-11' AS Date), 2, 14, 0.16)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (153, 5, N'HW-153', N'Máy lọc nước', 10, 317000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Home&Garden/203_0.jpg', CAST(N'2019-11-11' AS Date), 1, 14, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (154, 5, N'HW-154', N'Dụng cụ đựng rau', 10, 444000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Home&Garden/204_0.jpg', CAST(N'2019-11-11' AS Date), 3, 14, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (155, 5, N'HW-155', N'Thảm trải nhà', 10, 354000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Home&Garden/205_0.jpg', CAST(N'2019-11-11' AS Date), 2, 14, 0.01)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (156, 5, N'HW-156', N'Dung cụ lau nhà', 10, 156000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Home&Garden/206_0.jpg', CAST(N'2019-11-11' AS Date), 1, 14, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (157, 5, N'HW-157', N'Dụng cụ đào bới', 10, 491000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Home&Garden/207_0.jpg', CAST(N'2019-11-11' AS Date), 3, 14, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (158, 5, N'HW-158', N'Máy vắt cam', 10, 386000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Home&Garden/208_0.jpg', CAST(N'2019-11-11' AS Date), 2, 14, 0.09)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (159, 5, N'HW-159', N'Máy say sinh tố', 10, 165000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Home&Garden/209_0.jpg', CAST(N'2019-11-11' AS Date), 1, 14, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (160, 5, N'HW-160', N'Máy đánh trứng', 10, 376000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Home&Garden/210_0.jpg', CAST(N'2019-11-11' AS Date), 2, 14, 0.02)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (161, 5, N'HW-161', N'Bộ dao đa năng', 10, 224000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Home&Garden/211_0.jpg', CAST(N'2019-11-11' AS Date), 1, 14, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (162, 5, N'HW-162', N'Máy hút bụi', 10, 285000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Home&Garden/212_0.jpg', CAST(N'2019-11-11' AS Date), 1, 14, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (163, 5, N'HW-163', N'Máy lọc nước', 10, 155000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Home&Garden/213_0.jpg', CAST(N'2019-11-11' AS Date), 3, 14, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (164, 5, N'HW-164', N'Dụng cụ đựng rau', 10, 279000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Home&Garden/214_0.jpg', CAST(N'2019-11-11' AS Date), 1, 14, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (165, 5, N'HW-165', N'Thảm trải nhà', 10, 190000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Home&Garden/215_0.jpg', CAST(N'2019-11-11' AS Date), 3, 14, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (166, 5, N'HW-166', N'Dung cụ lau nhà', 10, 494000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Home&Garden/216_0.jpg', CAST(N'2019-11-11' AS Date), 2, 14, 0.03)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (167, 5, N'HW-167', N'Dụng cụ đào bới', 10, 248000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Home&Garden/217_0.jpg', CAST(N'2019-11-11' AS Date), 2, 14, 0.14)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (168, 5, N'HW-168', N'Máy vắt cam', 10, 240000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Home&Garden/218_0.jpg', CAST(N'2019-11-11' AS Date), 3, 14, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (169, 5, N'HW-169', N'Máy say sinh tố', 10, 323000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Home&Garden/219_0.jpg', CAST(N'2019-11-11' AS Date), 2, 14, 0.12)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (170, 5, N'HW-170', N'Máy đánh trứng', 10, 497000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Home&Garden/220_0.jpg', CAST(N'2019-11-11' AS Date), 3, 14, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (171, 5, N'HW-171', N'Bộ dao đa năng', 10, 475000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Home&Garden/221_0.jpg', CAST(N'2019-11-11' AS Date), 3, 15, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (172, 5, N'HW-172', N'Máy hút bụi', 10, 387000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Home&Garden/222_0.jpg', CAST(N'2019-11-11' AS Date), 3, 15, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (173, 5, N'HW-173', N'Máy lọc nước', 10, 252000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Home&Garden/223_0.jpg', CAST(N'2019-11-11' AS Date), 3, 15, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (174, 5, N'HW-174', N'Dụng cụ đựng rau', 10, 185000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Home&Garden/224_0.jpg', CAST(N'2019-11-11' AS Date), 1, 15, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (175, 5, N'HW-175', N'Thảm trải nhà', 10, 443000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Home&Garden/225_0.jpg', CAST(N'2019-11-11' AS Date), 2, 15, 0.19)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (176, 5, N'HW-176', N'Dung cụ lau nhà', 10, 246000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Home&Garden/226_0.jpg', CAST(N'2019-11-11' AS Date), 3, 15, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (177, 5, N'HW-177', N'Dụng cụ đào bới', 10, 374000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Home&Garden/227_0.jpg', CAST(N'2019-11-11' AS Date), 1, 15, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (178, 5, N'HW-178', N'Máy vắt cam', 10, 196000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Home&Garden/228_0.jpg', CAST(N'2019-11-11' AS Date), 3, 15, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (179, 5, N'HW-179', N'Máy say sinh tố', 10, 318000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Home&Garden/229_0.jpg', CAST(N'2019-11-11' AS Date), 1, 15, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (180, 5, N'HW-180', N'Máy đánh trứng', 10, 187000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Home&Garden/230_0.jpg', CAST(N'2019-11-11' AS Date), 2, 15, 0.08)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (181, 5, N'HW-181', N'Bộ dao đa năng', 10, 420000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Home&Garden/231_0.jpg', CAST(N'2019-11-11' AS Date), 3, 15, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (182, 5, N'HW-182', N'Máy hút bụi', 10, 323000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Home&Garden/232_0.jpg', CAST(N'2019-11-11' AS Date), 2, 15, 0.07)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (183, 5, N'HW-183', N'Máy lọc nước', 10, 421000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Home&Garden/233_0.jpg', CAST(N'2019-11-11' AS Date), 1, 15, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (184, 5, N'HW-184', N'Dụng cụ đựng rau', 10, 483000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Home&Garden/234_0.jpg', CAST(N'2019-11-11' AS Date), 1, 15, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (185, 5, N'HW-185', N'Thảm trải nhà', 10, 398000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Home&Garden/235_0.jpg', CAST(N'2019-11-11' AS Date), 1, 15, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (186, 5, N'HW-186', N'Dung cụ lau nhà', 10, 295000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Home&Garden/236_0.jpg', CAST(N'2019-11-11' AS Date), 2, 15, 0.04)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (187, 5, N'HW-187', N'Dụng cụ đào bới', 10, 217000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Home&Garden/237_0.jpg', CAST(N'2019-11-11' AS Date), 1, 15, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (188, 5, N'HW-188', N'Máy vắt cam', 10, 483000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Home&Garden/238_0.jpg', CAST(N'2019-11-11' AS Date), 1, 15, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (189, 5, N'HW-189', N'Máy say sinh tố', 10, 378000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Home&Garden/239_0.jpg', CAST(N'2019-11-11' AS Date), 2, 15, 0.19)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (190, 5, N'HW-190', N'Máy đánh trứng', 10, 301000, N'- Là dụng cụ đa năng, tiện tích, thuận tiện, nhỏ gọn và dễ sử dụng <br/>- Thiết kế nhiều mẫu mã<br/>- Sản phẩm bền đẹp<br/>- Tiện lợi cho việc di chuyển', N'Home&Garden/240_0.jpg', CAST(N'2019-11-11' AS Date), 3, 15, 0)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (191, 1, N'test', N'test', 10, 150000, N'abc', N'1.jpg', CAST(N'2021-07-10' AS Date), 2, 1, 0.15)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status], [sub_category_id], [sale]) VALUES (192, 1, N'test', N'test', 10, 150000, N'abc', N'1.jpg', CAST(N'2021-07-10' AS Date), 2, 1, 0.1)
SET IDENTITY_INSERT [dbo].[product] OFF
GO
INSERT [dbo].[role_Account] ([id], [role]) VALUES (1, N'Quản trị viên')
INSERT [dbo].[role_Account] ([id], [role]) VALUES (2, N'Nhân viên')
INSERT [dbo].[role_Account] ([id], [role]) VALUES (3, N'Vip')
INSERT [dbo].[role_Account] ([id], [role]) VALUES (4, N'Khách hàng')
GO
SET IDENTITY_INSERT [dbo].[Shipping] ON 

INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (1, N'Nguyễn Thị Ánh', N'0123456789', N'Thái Bình')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (2, N'Lê Nhật Minh', N'0123456789', N'Thanh Hóa')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (3, N'Lê Nhật Minh', N'12345678', N'Thanh Hóa')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (4, N'Lê Nhật Minh', N'12345', N'TH')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (1002, N'Lê Nhật Minh', N'123456789', N'Thanh Hoa')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (1003, N'Lê Nhật Minh', N'222222222', N'Vinh Hung')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (1004, N'Lê Nhật Minh', N'12345678', N'sss')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (1005, N'Lê Nhật Minh', N'333333333', N'ddddddđ')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (1006, N'Lê Nhật Minh', N'1111111111111', N'11aaaaaaaaaaaa')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (1007, N'Lê Nhật Minh', N'1111111111', N'111111')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (1008, N'Lê Nhật Minh', N'1111111111', N'111111')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (1009, N'Lê Nhật Minh', N'11111111111111', N'111111111111')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (2002, N'Nguyễn Thị Ánh', N'123456', N'abc')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (3002, N'Nguyễn Thị Ánh', N'0869054685', N'Hà Nội')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (3003, N'Nguyen Thi Anh', N'0866823499', N'Ha Noi')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (3004, N'Nguyen Thi Anh', N'0866823499', N'Ha Noi')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (3005, N'Nguyen Thi Anh', N'0866823499', N'Bac tu liem')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (3006, N'Nguyen Thi Anh', N'0866823499', N'Ha Noi')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (3007, N'Nguyen Thi Anh', N'0866823499', N'Ha Noi')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (3008, N'Lê Nhật Minh', N'0123456789', N'Vĩnh Hùng')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (3009, N'test', N'1234', N'Vĩnh Hùng')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (3010, N'test', N'1234', N'Vĩnh Hùng')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (3011, N'test2', N'123', N'aaaa')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (3012, N'test2', N'123', N'aaaa')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (3013, N'test3', N'234', N's')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (3014, N'test3', N'234', N's')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (3015, N'test4', N'456', N'f')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (3016, N'Nguyễn Thị Ánh', N'0866823499', N'Vĩnh Lộc')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (3017, N'Ánh', N'098789', N'Hà Nội')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (3018, N'Nguyễn Thị Ánh', N'1234', N'Hà Nội')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (3019, N'Lê Hồng Quân', N'12345', N'Hà Nội')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (3020, N'Lê Hồng Quân', N'12345', N'Hà Nội')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (3021, N'Nguyen Thi Anh', N'0866823499', N'Ha Noi')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (3022, N'Nguyen Thi Anh', N'0866823499', N'Ha Noi')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (3023, N'Nguyễn Thị Ánh', N'0869054688', N'Cổ Nhuế - Bắc Từ Liêm - Hà Nội')
SET IDENTITY_INSERT [dbo].[Shipping] OFF
GO
INSERT [dbo].[status_Account] ([id], [status]) VALUES (1, N'Kích hoạt')
INSERT [dbo].[status_Account] ([id], [status]) VALUES (2, N'Chờ')
INSERT [dbo].[status_Account] ([id], [status]) VALUES (3, N'Bị chặn')
GO
SET IDENTITY_INSERT [dbo].[status_category] ON 

INSERT [dbo].[status_category] ([id], [status]) VALUES (1, N'Đang bán')
INSERT [dbo].[status_category] ([id], [status]) VALUES (2, N'Đang khuyến mãi')
INSERT [dbo].[status_category] ([id], [status]) VALUES (3, N'Miễn phí vận chuyển')
INSERT [dbo].[status_category] ([id], [status]) VALUES (4, N'Hết hàng')
INSERT [dbo].[status_category] ([id], [status]) VALUES (5, N'Ngừng kinh doanh')
SET IDENTITY_INSERT [dbo].[status_category] OFF
GO
INSERT [dbo].[status_Order] ([id], [status]) VALUES (1, N'Chờ xác nhận')
INSERT [dbo].[status_Order] ([id], [status]) VALUES (2, N'Được chấp nhận')
INSERT [dbo].[status_Order] ([id], [status]) VALUES (3, N'Đang vận chuyển')
INSERT [dbo].[status_Order] ([id], [status]) VALUES (4, N'Thanh toán online')
INSERT [dbo].[status_Order] ([id], [status]) VALUES (5, N'Thành công')
GO
SET IDENTITY_INSERT [dbo].[status_product] ON 

INSERT [dbo].[status_product] ([id], [status]) VALUES (1, N'Đang bán')
INSERT [dbo].[status_product] ([id], [status]) VALUES (2, N'Đang khuyến mãi')
INSERT [dbo].[status_product] ([id], [status]) VALUES (3, N'Miễn phí vận chuyển')
INSERT [dbo].[status_product] ([id], [status]) VALUES (4, N'Hết hàng')
INSERT [dbo].[status_product] ([id], [status]) VALUES (5, N'Ngừng kinh doanh')
SET IDENTITY_INSERT [dbo].[status_product] OFF
GO
SET IDENTITY_INSERT [dbo].[status_sub_category] ON 

INSERT [dbo].[status_sub_category] ([id], [status]) VALUES (1, N'Đang bán')
INSERT [dbo].[status_sub_category] ([id], [status]) VALUES (2, N'Đang khuyến mãi')
INSERT [dbo].[status_sub_category] ([id], [status]) VALUES (3, N'Miễn phí vận chuyển')
INSERT [dbo].[status_sub_category] ([id], [status]) VALUES (4, N'Hết hàng')
INSERT [dbo].[status_sub_category] ([id], [status]) VALUES (5, N'Ngừng kinh doanh')
SET IDENTITY_INSERT [dbo].[status_sub_category] OFF
GO
SET IDENTITY_INSERT [dbo].[sub_category] ON 

INSERT [dbo].[sub_category] ([id], [category_id], [sub_category_name], [status]) VALUES (1, 1, N'Dụng cụ cầm tay', 1)
INSERT [dbo].[sub_category] ([id], [category_id], [sub_category_name], [status]) VALUES (2, 1, N'Dụng cụ tháo lắp', 1)
INSERT [dbo].[sub_category] ([id], [category_id], [sub_category_name], [status]) VALUES (3, 1, N'Dụng cụ điện', 1)
INSERT [dbo].[sub_category] ([id], [category_id], [sub_category_name], [status]) VALUES (4, 2, N'Dụng cụ đo nhiệt', 1)
INSERT [dbo].[sub_category] ([id], [category_id], [sub_category_name], [status]) VALUES (5, 2, N'Công cụ đo và phân tích', 1)
INSERT [dbo].[sub_category] ([id], [category_id], [sub_category_name], [status]) VALUES (6, 2, N'Dụng cụ đo', 1)
INSERT [dbo].[sub_category] ([id], [category_id], [sub_category_name], [status]) VALUES (7, 3, N'Dụng cụ nhà tắm', 1)
INSERT [dbo].[sub_category] ([id], [category_id], [sub_category_name], [status]) VALUES (8, 3, N'Dụng cụ nhà bếp', 1)
INSERT [dbo].[sub_category] ([id], [category_id], [sub_category_name], [status]) VALUES (9, 3, N'Dụng cụ cửa', 1)
INSERT [dbo].[sub_category] ([id], [category_id], [sub_category_name], [status]) VALUES (10, 3, N'Dụng cụ đựng ', 1)
INSERT [dbo].[sub_category] ([id], [category_id], [sub_category_name], [status]) VALUES (11, 4, N'Đèn sân khấu', 1)
INSERT [dbo].[sub_category] ([id], [category_id], [sub_category_name], [status]) VALUES (12, 4, N'Đèn ống', 1)
INSERT [dbo].[sub_category] ([id], [category_id], [sub_category_name], [status]) VALUES (13, 4, N'Đèn lắp trong nhà', 1)
INSERT [dbo].[sub_category] ([id], [category_id], [sub_category_name], [status]) VALUES (14, 5, N'Làm vườn', 1)
INSERT [dbo].[sub_category] ([id], [category_id], [sub_category_name], [status]) VALUES (15, 5, N'Dụng cụ làm sạch', 1)
INSERT [dbo].[sub_category] ([id], [category_id], [sub_category_name], [status]) VALUES (16, 5, N'Dụng cụ làm nhà ', 1)
SET IDENTITY_INSERT [dbo].[sub_category] OFF
GO
INSERT [dbo].[view] ([view]) VALUES (1167)
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_create_date]  DEFAULT (getdate()) FOR [create_date]
GO
ALTER TABLE [dbo].[order] ADD  CONSTRAINT [DF_order_create_date]  DEFAULT (getdate()) FOR [create_date]
GO
ALTER TABLE [dbo].[product] ADD  CONSTRAINT [DF__product__create___145C0A3F]  DEFAULT (getdate()) FOR [create_date]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([role_id])
REFERENCES [dbo].[role_Account] ([id])
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([status])
REFERENCES [dbo].[status_Account] ([id])
GO
ALTER TABLE [dbo].[category]  WITH CHECK ADD FOREIGN KEY([status])
REFERENCES [dbo].[status_category] ([id])
GO
ALTER TABLE [dbo].[image]  WITH CHECK ADD  CONSTRAINT [FK__image__product_i__6383C8BA] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[image] CHECK CONSTRAINT [FK__image__product_i__6383C8BA]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD FOREIGN KEY([Customer])
REFERENCES [dbo].[Account] ([userName])
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD FOREIGN KEY([shipping_id])
REFERENCES [dbo].[Shipping] ([id])
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD FOREIGN KEY([status])
REFERENCES [dbo].[status_Order] ([id])
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[order] ([id])
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK__product__status__6477ECF3] FOREIGN KEY([status])
REFERENCES [dbo].[status_product] ([id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK__product__status__6477ECF3]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([sub_category_id])
REFERENCES [dbo].[sub_category] ([id])
GO
ALTER TABLE [dbo].[sub_category]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[sub_category]  WITH CHECK ADD FOREIGN KEY([status])
REFERENCES [dbo].[status_sub_category] ([id])
GO
USE [master]
GO
ALTER DATABASE [HouseWareShop] SET  READ_WRITE 
GO
