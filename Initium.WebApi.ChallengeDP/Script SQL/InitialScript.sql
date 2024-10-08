USE [master]
GO
CREATE DATABASE [LibraryManagementDB]
CONTAINMENT = NONE
ON PRIMARY 
( NAME = N'LibraryManagementDB', SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
LOG ON 
( NAME = N'LibraryManagementDB_log', SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [LibraryManagementDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
BEGIN
    EXEC [LibraryManagementDB].[dbo].[sp_fulltext_database] @action = 'enable'
END
GO
ALTER DATABASE [LibraryManagementDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LibraryManagementDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LibraryManagementDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LibraryManagementDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LibraryManagementDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [LibraryManagementDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LibraryManagementDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LibraryManagementDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LibraryManagementDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LibraryManagementDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LibraryManagementDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LibraryManagementDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LibraryManagementDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LibraryManagementDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LibraryManagementDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LibraryManagementDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LibraryManagementDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LibraryManagementDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LibraryManagementDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LibraryManagementDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LibraryManagementDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LibraryManagementDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LibraryManagementDB] SET RECOVERY FULL 
GO
ALTER DATABASE [LibraryManagementDB] SET  MULTI_USER 
GO
ALTER DATABASE [LibraryManagementDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LibraryManagementDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LibraryManagementDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LibraryManagementDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LibraryManagementDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LibraryManagementDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'LibraryManagementDB', N'ON'
GO
ALTER DATABASE [LibraryManagementDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [LibraryManagementDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [LibraryManagementDB]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 7/9/2024 22:30:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Author] [nvarchar](100) NOT NULL,
	[PublishedYear] [int] NOT NULL,
	[Genre] [nvarchar](50) NOT NULL,
	[UserId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/9/2024 22:30:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](256) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedYear], [Genre], [UserId]) VALUES (1, N'Cien años de soledad', N'Gabriel García Márquez', 1967, N'Realismo mágico', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedYear], [Genre], [UserId]) VALUES (2, N'Don Quijote de la Mancha', N'Miguel de Cervantes', 1605, N'Novela', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedYear], [Genre], [UserId]) VALUES (3, N'La sombra del viento', N'Carlos Ruiz Zafón', 2001, N'Suspense', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedYear], [Genre], [UserId]) VALUES (4, N'El amor en los tiempos del cólera', N'Gabriel García Márquez', 1985, N'Romántico', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedYear], [Genre], [UserId]) VALUES (5, N'Ficciones', N'Jorge Luis Borges', 1944, N'Ficción', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedYear], [Genre], [UserId]) VALUES (6, N'Los detectives salvajes', N'Roberto Bolaño', 1998, N'Novela', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedYear], [Genre], [UserId]) VALUES (7, N'El túnel', N'Ernesto Sabato', 1948, N'Psicológico', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedYear], [Genre], [UserId]) VALUES (8, N'Rayuela', N'Julio Cortázar', 1963, N'Experimental', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedYear], [Genre], [UserId]) VALUES (9, N'El principito', N'Antoine de Saint-Exupéry', 1943, N'Fábula', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedYear], [Genre], [UserId]) VALUES (10, N'El señor de los anillos', N'J.R.R. Tolkien', 1954, N'Fantasía', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedYear], [Genre], [UserId]) VALUES (11, N'El jardín de los Finzi-Contini', N'Giorgio Bassani', 1962, N'Drama', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedYear], [Genre], [UserId]) VALUES (12, N'Sobre héroes y tumbas', N'Ernesto Sabato', 1961, N'Novela', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedYear], [Genre], [UserId]) VALUES (13, N'La casa de los espíritus', N'Isabel Allende', 1982, N'Realismo mágico', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedYear], [Genre], [UserId]) VALUES (14, N'Los premios', N'Juan Carlos Onetti', 1960, N'Novela', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedYear], [Genre], [UserId]) VALUES (15, N'El Aleph', N'Jorge Luis Borges', 1949, N'Ficción', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedYear], [Genre], [UserId]) VALUES (16, N'La colmena', N'Camilo José Cela', 1951, N'Novela', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedYear], [Genre], [UserId]) VALUES (17, N'Pedro Páramo', N'Juan Rulfo', 1955, N'Realismo mágico', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedYear], [Genre], [UserId]) VALUES (18, N'La ciudad y los perros', N'Mario Vargas Llosa', 1963, N'Novela', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedYear], [Genre], [UserId]) VALUES (19, N'Crónica de una muerte anunciada', N'Gabriel García Márquez', 1981, N'Novela', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedYear], [Genre], [UserId]) VALUES (20, N'La mujer del porvenir', N'María Luisa Bombal', 1950, N'Ficción', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedYear], [Genre], [UserId]) VALUES (21, N'La casa de la playa', N'Mónica Carrillo', 1985, N'Novela', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedYear], [Genre], [UserId]) VALUES (22, N'La tregua', N'Mario Benedetti', 1960, N'Novela', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedYear], [Genre], [UserId]) VALUES (23, N'El hombre de la arena', N'E.T.A. Hoffmann', 1816, N'Cuento', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedYear], [Genre], [UserId]) VALUES (24, N'La autopista del sur y otros relatos', N'Julio Cortázar', 1966, N'Relatos', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedYear], [Genre], [UserId]) VALUES (25, N'La guerra del fin del mundo', N'Mario Vargas Llosa', 1981, N'Novela', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedYear], [Genre], [UserId]) VALUES (26, N'Los siete locos', N'Roberto Arlt', 1929, N'Novela', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedYear], [Genre], [UserId]) VALUES (27, N'El juego de los abalorios', N'Hermann Hesse', 1943, N'Ficción', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedYear], [Genre], [UserId]) VALUES (28, N'Como agua para chocolate', N'Laura Esquivel', 1989, N'Romántico', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedYear], [Genre], [UserId]) VALUES (29, N'El retrato de Dorian Gray', N'Oscar Wilde', 1890, N'Novela', NULL)
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Username], [Password], [FullName], [Email]) VALUES (1, N'dperez', N'5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', N'Diego Pérez', N'dperez@example.com')
INSERT [dbo].[Users] ([Id], [Username], [Password], [FullName], [Email]) VALUES (2, N'admin', N'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', N'Administrador', N'admin@example')
INSERT [dbo].[Users] ([Id], [Username], [Password], [FullName], [Email]) VALUES (3, N'user123', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', N'Usuario 123', N'user123@example.com')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__536C85E44C26C1B6]    Script Date: 7/9/2024 22:30:15 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D10534BD051479]    Script Date: 7/9/2024 22:30:15 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_User_Books] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_User_Books]
GO
USE [master]
GO
ALTER DATABASE [LibraryManagementDB] SET  READ_WRITE 
GO
