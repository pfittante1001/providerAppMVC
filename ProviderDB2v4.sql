USE [master]
GO
/****** Object:  Database [DB_A3EACF_ProviderDB4]    Script Date: 7/30/2018 7:00:54 PM ******/
CREATE DATABASE [DB_A3EACF_ProviderDB4]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_A3EACF_ProviderDB4', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\DB_A3EACF_ProviderDB4.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DB_A3EACF_ProviderDB4_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\DB_A3EACF_ProviderDB4_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DB_A3EACF_ProviderDB4] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_A3EACF_ProviderDB4].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_A3EACF_ProviderDB4] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_A3EACF_ProviderDB4] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_A3EACF_ProviderDB4] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_A3EACF_ProviderDB4] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_A3EACF_ProviderDB4] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_A3EACF_ProviderDB4] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_A3EACF_ProviderDB4] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_A3EACF_ProviderDB4] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_A3EACF_ProviderDB4] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_A3EACF_ProviderDB4] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_A3EACF_ProviderDB4] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_A3EACF_ProviderDB4] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_A3EACF_ProviderDB4] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_A3EACF_ProviderDB4] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_A3EACF_ProviderDB4] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB_A3EACF_ProviderDB4] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_A3EACF_ProviderDB4] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_A3EACF_ProviderDB4] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_A3EACF_ProviderDB4] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_A3EACF_ProviderDB4] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_A3EACF_ProviderDB4] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_A3EACF_ProviderDB4] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_A3EACF_ProviderDB4] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB_A3EACF_ProviderDB4] SET  MULTI_USER 
GO
ALTER DATABASE [DB_A3EACF_ProviderDB4] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_A3EACF_ProviderDB4] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_A3EACF_ProviderDB4] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_A3EACF_ProviderDB4] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DB_A3EACF_ProviderDB4] SET DELAYED_DURABILITY = DISABLED 
GO
USE [DB_A3EACF_ProviderDB4]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 7/30/2018 7:00:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 7/30/2018 7:00:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[AddressID] [int] IDENTITY(1,1) NOT NULL,
	[StreetNumber] [nvarchar](50) NULL,
	[StreetName] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[PostalCode] [nvarchar](50) NULL,
	[CustomerID] [int] NULL,
	[ProviderID] [int] NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ArticlesComments]    Script Date: 7/30/2018 7:00:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArticlesComments](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[Comments] [varchar](max) NULL,
	[ThisDateTime] [datetime] NULL,
	[ProviderID] [int] NULL,
	[Rating] [int] NULL,
 CONSTRAINT [PK_ArticlesComments] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 7/30/2018 7:00:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 7/30/2018 7:00:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 7/30/2018 7:00:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 7/30/2018 7:00:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 7/30/2018 7:00:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[IsProvider] [bit] NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 7/30/2018 7:00:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](50) NULL,
	[CustomerPhone] [nvarchar](50) NULL,
	[CustomerEmail] [nvarchar](50) NULL,
	[UserName] [nvarchar](128) NULL,
	[IsSnow] [int] NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ImagesTwo]    Script Date: 7/30/2018 7:00:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ImagesTwo](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[ImageBin] [varbinary](max) NULL,
	[ImageIMG] [image] NULL,
	[CustomerID] [int] NULL,
	[ProviderID] [int] NULL,
 CONSTRAINT [PK_ImagesTwo] PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Providers]    Script Date: 7/30/2018 7:00:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Providers](
	[ProviderID] [int] IDENTITY(1,1) NOT NULL,
	[ProviderName] [nvarchar](50) NULL,
	[ProviderPhone] [nvarchar](50) NULL,
	[ProviderEmail] [nvarchar](128) NULL,
	[UserName] [nvarchar](128) NULL,
	[Title] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
	[Active] [bit] NULL CONSTRAINT [DF_Providers_Active]  DEFAULT ((1)),
	[IsSnow] [bit] NULL,
	[Services] [nvarchar](200) NULL,
 CONSTRAINT [PK_Providers] PRIMARY KEY CLUSTERED 
(
	[ProviderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201807161527361_InitialCreate', N'ProviderAppv2.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C6D6FE33612FE7EC0FD07419F7A87D44A9CEE622FB05BA44E721774F38275B6E8B7052DD18EB012A54A549AE0D05F761FFA93FA176E2851B2F8A6175BB19DA240118BC36786C32167381CEE9FFFFB63F2C37318584F3849FD884CED93D1B16D61E2469E4F56533BA3CB6F3FD83F7CFFF7BF4D2EBDF0D9FAB9A43B6574D093A453FB91D2F8CC7152F71187281D85BE9B4469B4A423370A1DE445CEF8F8F85FCEC9898301C2062CCB9A7CCA08F5439CFF809FB388B838A6190A6E220F0729FF0E2DF31CD5BA45214E63E4E2A97D9F444FBE8793F3387E1A8F0A7ADB3A0F7C04B2CC71B0B42D444844110549CF3EA7784E9388ACE6317C40C1C34B8C816E898214F3119CADC9BB0EE678CC06E3AC3B96506E96D228EC097872CAB5E3C8DD37D2B15D690FF477097AA62F6CD4B90EA7F6B587F34F9FA2001420333C9B0509239EDA37158BF334BEC57454761C15905709C0FD16255F4775C423AB73BFA3CA9AC6A363F6DF9135CB029A25784A704613141C59F7D922F0DD9FF0CB43F41593E9E9C96279FAE1DD7BE49DBEFF0E9FBEAB8F14C60A74C207F804C612E30464C3CB6AFCB6E588FD1CB963D5ADD6A7D00AD8122C0CDBBA41CF1F3159D1475832E30FB675E53F63AFFCC28DEB33F1611D41279A64F0F3360B02B40870D5EE34F264FF6FE03A7EF77E10AEB7E8C95FE5532FF1878593C0BAFA8483BC357DF4E3627909F3FD85935D2551C87E8BF655B47E994759E2B2C14446920794AC3015A59B386BE3ED64D20C6A78B32E510FDFB499A4AA796B49D980365909258B5DAF8652DED7E5DBD9E2C0F7C0E4E5A6C534D264703A773592FA8335D4A9D6E673D2D57C080CEBAFBC1B5E86C80F06D80E3B70815864E92721AE46F96304C687486F99EF519AC26EE0FD07A58F0DA2C39F03883EC76E968091CE290AE357E776FF18117C9B850B66FBBBE335D8D43CFC165D219746C92561BDB6C6FB18B95FA38C5E12EF0251FC99BA2520FBF9E087DD010611E7DC75719A5E8131636F1641A85D025E137A3AEE0DC7B6A87D8723B300F9A13E1E9136D32F25E93A26D153287189814C179B3489FA315AF9A49BA825A959D482A255544ED6575406D64D524E691634276895B3A01A2CDACB6768F8702F873DFC786F3BE76DDA0B6A6A9CC30E89FF8D094E601BF3EE11A53821EB19E8B26FEC2358C8A78F317D75DF9473FA1905D9D0AC365A0DF92630FC6AC8610F7F35E462967174A74350490CF09DE8F5E7ABF6352749B6EBE5200C73D7CC77B3079896CB799A46AE9FAF024DFA8B272F44F92186B3DA3319C568E46C080C0C0CDD672E0FBEC0D86CD9A8EEC8050E30C5D6B95BA40767287591A7AA1106E4F510ACF4A81AC1D6591151B87F2A3CC1D271C23A2176084A61A5FA84AACBC227AE1FA3A0554B52CF8E2E8C8DBDE221B75CE01813C6B055135D98EB93204C808A8F34296D1A9A38358B6B364443D46A9AF3B610763DEF4A6E622736D9123B1BEC92C76FAF6298CD1ADB817136ABA48B00C684DE3E0C949F55BA1A807C70393403954E4C0603E521D54E0C54D4D81E0C5454C99B33D0E288DA75FEA5F3EAA199A77850DEBD5B6F54D71E6C53D0C7819966117B421F0A3D70A29AE7C58235E267AA399C819CFC7C96F250573611063EC7544CD9ACE35D6D1CEA3483C846D404B836B416507E15A800290BAA8770652EAF513A1E45F4802DF36E8DB07CEF97606B36A062D7AF446B84E68B53D9383B9D3EAA9155D6A01879A7C3420D476310F2E6250EBC83524C795955315D62E13ED1706D607C321A14D412B91A94540E66702D95A6D9AE255D40D62724DB4A4B52F864D0523998C1B5C46DB45D499AA0A04758B0958A44173ED0622B331D95B7A9DA264E512BC53F4C1C4351D5E406C5B14F56B5222BFEC59A171556B36FE7FD0B8FC202C371534DFD51256DC58946095A61A9155883A4577E92D20B44D102B13CCFCC0B1532AD6F356CFF25CBBAFB5427B1F4032535FB5B4C9F0917F882B755C3118E7205630C594C9327D23516A0EF6EB1B23714A04493BB9F45411612738865EE5DDCE0D5FB175F54848923C9AF84508ABE944057547EA7A95197C560D354C5309B4F9519C2A4F03202ADABDC14959A51CA24551DC594B8DADBD49982999ED325478AFD67AB15E175D6162F4FA903F04F3D316A150E0A58ADAD3BAA588452C7145BBA234A95267548A9A98794F57A1241C87AC34678068DEA29BA73502B48EAE86A6B77644D2D491D5AD3BC01B64666B9AD3BAAA6DCA40EAC69EE8EBDAE3D91B7D103F65EC6F3CB16EEAB38E46EE7BF0C18AFB3270EE3FE6A77F975A0DAE79E58FCB65E01E3DF0FD29E8C27BD2DECA9C86E6C674F060CF3EE23DC838B9B4FE3E5BD1953B8DC1636F8A6CB7D335E3FAB7D55DB508E7A3249C5BD3AF24947BB093F66B53FAA51CE5D05895D152683737F49290E478C6034FF3598053E665B7949708388BFC4292D0A3AECF1F1C9587A9573382F649C34F502CD31D5F44C469CB31DD466912794B88F28512B25B67845B2065592D0D7C4C3CF53FBBF79AFB33C9FC1FECA3F1F59D7E967E2FF9A41C3439261EB77B5F27398AAFA0EEF382A417F7F130F24BAABFCFA972F45D723EB2E81E574661D4B8ADE64FAC56713BDA429BA6E21CDC68F29DEEE6A135E296851A5D5B2F9A384854F077990504AF94D889EFFD15734EDA383AD10350F0B86C21B4485A687039B60191F0D78F093E68F06FA0D56FF886013D18C0F087CD21F4C7E3ED07D1B2A7BEED10F698E4CBBD892723DB7965F6F558BB96FDFA454696FB5D0D54AEC1E7083565B6F17A2BCB12AE6C15CA7A6487930EC7DDAFDAB57261F4A31F23A68DF6F0DF22ECB8E1BAE95FE52D5C607501FA7A9F7D97F4DF1AE6DCD94033EF0C2CC7E95C307666CDCCDEFBF3E78D7C6664A101FB8B1F5AA023E305BDB97FFDCB3A57576A17BAFE955CB930C7739BA2C725BCD6E917287E3FF2202232822CAE2A9A5BE48ACA9C0B585E19AC4CCD45C9D263356168EC257A16866DB6FACDCE1370E96D334B335D47436F1E6FB7F236F4ED3CCDB5029B98F6A636DADA2AE02BC651F6B2AA27A4BD5C5C2485A8AD9DB62D6C68BF9B7544C3C885284D563B85D7E3BB5C383A864C8A5D3A35658BD2806DF59FB371AC17FA7FE6A0DC1FEC546825DC16B5634D7641995CE5B92A8249132343798220F5CEA7942FD25722934B30474FE563C4FEAB16B9005F6AEC95D46E38CC29071B8088484170B029AF8E705D1A2CC93BB98FD4A87180288E9B3C4FD1DF931F303AF92FB4A93133240B0E882A77BD95C5296F65DBD5448B711E908C4D55705450F388C03004BEFC81C3DE14D6403F3FB8857C87D5967004D20ED1321AA7D72E1A35582C29463ACFBC34FB0612F7CFEFEFFFE60661CAA540000, N'6.2.0-61023')
SET IDENTITY_INSERT [dbo].[Addresses] ON 

INSERT [dbo].[Addresses] ([AddressID], [StreetNumber], [StreetName], [City], [State], [PostalCode], [CustomerID], [ProviderID]) VALUES (1015, N'3175', N'w 92nd', N'cleveland', N'ohio', N'44102', NULL, 8)
INSERT [dbo].[Addresses] ([AddressID], [StreetNumber], [StreetName], [City], [State], [PostalCode], [CustomerID], [ProviderID]) VALUES (1016, N'2121', N'w 117th', N'cleveland', N'ohio', N'44102', NULL, 9)
INSERT [dbo].[Addresses] ([AddressID], [StreetNumber], [StreetName], [City], [State], [PostalCode], [CustomerID], [ProviderID]) VALUES (1017, N'3256', N'w 82nd', N'cleveland', N'ohio', N'44102', 11, NULL)
SET IDENTITY_INSERT [dbo].[Addresses] OFF
SET IDENTITY_INSERT [dbo].[ArticlesComments] ON 

INSERT [dbo].[ArticlesComments] ([CommentID], [Comments], [ThisDateTime], [ProviderID], [Rating]) VALUES (21, N'Worst service ever', CAST(N'2018-07-24 19:53:18.317' AS DateTime), 8, 3)
SET IDENTITY_INSERT [dbo].[ArticlesComments] OFF
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [IsProvider]) VALUES (N'afcc956a-7363-4398-8ea5-ac1ed2ec4317', N'pfittante@yahoo.com', 0, N'AJmu9ZMw7+Sm7TWeg2hvQF3DFmRR2BJJLiTe3CTcHbe5xleoSFhMe4HwMos38Pyxnw==', N'94594d36-4c41-42ab-be55-921a4498a3bf', NULL, 0, 0, NULL, 1, 0, N'pfittante@yahoo.com', 0)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [IsProvider]) VALUES (N'ebb7eacc-f485-4b73-91b6-750a0ea435d0', N'weplow@yahoo.com', 0, N'AC3a5wGxltvwl2MQGpF6SNgi5/9RZ5YzxTLt7qZupMIAg4mYd4qdvDy8T5FJULA1OQ==', N'91d943a8-7ddc-4046-8a0d-1fc99f5e8b17', NULL, 0, 0, NULL, 1, 0, N'weplow@yahoo.com', 1)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [IsProvider]) VALUES (N'fcf56a25-1348-41f6-8f5f-5ac7c89c780d', N'plowit@snow.com', 0, N'AFErpdrE10qhX/QGC4hBqI80kGNqN8CZZTpu2UQV/T32hFoK8cxLlBoExlNjiCuOtw==', N'0f0ced51-d7a7-4bb3-9bf0-e3699ff82559', NULL, 0, 0, NULL, 1, 0, N'plowit@snow.com', 1)
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [CustomerPhone], [CustomerEmail], [UserName], [IsSnow]) VALUES (11, N'Pete Fittante', N'2166098675', NULL, N'afcc956a-7363-4398-8ea5-ac1ed2ec4317', NULL)
SET IDENTITY_INSERT [dbo].[Customers] OFF
SET IDENTITY_INSERT [dbo].[Providers] ON 

INSERT [dbo].[Providers] ([ProviderID], [ProviderName], [ProviderPhone], [ProviderEmail], [UserName], [Title], [Description], [Active], [IsSnow], [Services]) VALUES (8, N'Plow It Inc', N'2166098675', N'plowit@snow.com', N'fcf56a25-1348-41f6-8f5f-5ac7c89c780d', NULL, NULL, 1, 1, NULL)
INSERT [dbo].[Providers] ([ProviderID], [ProviderName], [ProviderPhone], [ProviderEmail], [UserName], [Title], [Description], [Active], [IsSnow], [Services]) VALUES (9, N'We can plow It Inc', N'2166097788', N'weplow@yahoo.com', N'ebb7eacc-f485-4b73-91b6-750a0ea435d0', NULL, NULL, 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[Providers] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 7/30/2018 7:00:54 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 7/30/2018 7:00:54 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 7/30/2018 7:00:54 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 7/30/2018 7:00:54 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 7/30/2018 7:00:54 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 7/30/2018 7:00:54 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_Customers]
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_Providers] FOREIGN KEY([ProviderID])
REFERENCES [dbo].[Providers] ([ProviderID])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_Providers]
GO
ALTER TABLE [dbo].[ArticlesComments]  WITH CHECK ADD  CONSTRAINT [FK_ArticlesComments_Providers] FOREIGN KEY([ProviderID])
REFERENCES [dbo].[Providers] ([ProviderID])
GO
ALTER TABLE [dbo].[ArticlesComments] CHECK CONSTRAINT [FK_ArticlesComments_Providers]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_AspNetUsers] FOREIGN KEY([UserName])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_AspNetUsers]
GO
ALTER TABLE [dbo].[ImagesTwo]  WITH CHECK ADD  CONSTRAINT [FK_ImagesTwo_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[ImagesTwo] CHECK CONSTRAINT [FK_ImagesTwo_Customers]
GO
ALTER TABLE [dbo].[ImagesTwo]  WITH CHECK ADD  CONSTRAINT [FK_ImagesTwo_Providers] FOREIGN KEY([ProviderID])
REFERENCES [dbo].[Providers] ([ProviderID])
GO
ALTER TABLE [dbo].[ImagesTwo] CHECK CONSTRAINT [FK_ImagesTwo_Providers]
GO
ALTER TABLE [dbo].[Providers]  WITH CHECK ADD  CONSTRAINT [FK_Providers_AspNetUsers] FOREIGN KEY([UserName])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Providers] CHECK CONSTRAINT [FK_Providers_AspNetUsers]
GO
USE [master]
GO
ALTER DATABASE [DB_A3EACF_ProviderDB4] SET  READ_WRITE 
GO
