USE [master]


GO


/****** Object:  Database [MyAssignmentPRJ301]    Script Date: 16/6/2022 2:41:19 AM ******/


CREATE DATABASE [MyAssignmentPRJ301]


CONTAINMENT = NONE


ON  PRIMARY


( NAME = N'MyAssignmentPRJ301', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MyAssignmentPRJ301.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )


LOG ON


( NAME = N'MyAssignmentPRJ301_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MyAssignmentPRJ301_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )


WITH CATALOG_COLLATION = DATABASE_DEFAULT


GO


ALTER DATABASE [MyAssignmentPRJ301] SET COMPATIBILITY_LEVEL = 150


GO


IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))


begin


EXEC [MyAssignmentPRJ301].[dbo].[sp_fulltext_database] @action = 'enable'


end


GO


ALTER DATABASE [MyAssignmentPRJ301] SET ANSI_NULL_DEFAULT OFF


GO


ALTER DATABASE [MyAssignmentPRJ301] SET ANSI_NULLS OFF


GO


ALTER DATABASE [MyAssignmentPRJ301] SET ANSI_PADDING OFF


GO


ALTER DATABASE [MyAssignmentPRJ301] SET ANSI_WARNINGS OFF


GO


ALTER DATABASE [MyAssignmentPRJ301] SET ARITHABORT OFF


GO


ALTER DATABASE [MyAssignmentPRJ301] SET AUTO_CLOSE OFF


GO


ALTER DATABASE [MyAssignmentPRJ301] SET AUTO_SHRINK OFF


GO


ALTER DATABASE [MyAssignmentPRJ301] SET AUTO_UPDATE_STATISTICS ON


GO


ALTER DATABASE [MyAssignmentPRJ301] SET CURSOR_CLOSE_ON_COMMIT OFF


GO


ALTER DATABASE [MyAssignmentPRJ301] SET CURSOR_DEFAULT  GLOBAL


GO


ALTER DATABASE [MyAssignmentPRJ301] SET CONCAT_NULL_YIELDS_NULL OFF


GO


ALTER DATABASE [MyAssignmentPRJ301] SET NUMERIC_ROUNDABORT OFF


GO


ALTER DATABASE [MyAssignmentPRJ301] SET QUOTED_IDENTIFIER OFF


GO


ALTER DATABASE [MyAssignmentPRJ301] SET RECURSIVE_TRIGGERS OFF


GO


ALTER DATABASE [MyAssignmentPRJ301] SET  DISABLE_BROKER


GO


ALTER DATABASE [MyAssignmentPRJ301] SET AUTO_UPDATE_STATISTICS_ASYNC OFF


GO


ALTER DATABASE [MyAssignmentPRJ301] SET DATE_CORRELATION_OPTIMIZATION OFF


GO


ALTER DATABASE [MyAssignmentPRJ301] SET TRUSTWORTHY OFF


GO


ALTER DATABASE [MyAssignmentPRJ301] SET ALLOW_SNAPSHOT_ISOLATION OFF


GO


ALTER DATABASE [MyAssignmentPRJ301] SET PARAMETERIZATION SIMPLE


GO


ALTER DATABASE [MyAssignmentPRJ301] SET READ_COMMITTED_SNAPSHOT OFF


GO


ALTER DATABASE [MyAssignmentPRJ301] SET HONOR_BROKER_PRIORITY OFF


GO


ALTER DATABASE [MyAssignmentPRJ301] SET RECOVERY FULL


GO


ALTER DATABASE [MyAssignmentPRJ301] SET  MULTI_USER


GO


ALTER DATABASE [MyAssignmentPRJ301] SET PAGE_VERIFY CHECKSUM 


GO


ALTER DATABASE [MyAssignmentPRJ301] SET DB_CHAINING OFF


GO


ALTER DATABASE [MyAssignmentPRJ301] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF )


GO


ALTER DATABASE [MyAssignmentPRJ301] SET TARGET_RECOVERY_TIME = 60 SECONDS


GO


ALTER DATABASE [MyAssignmentPRJ301] SET DELAYED_DURABILITY = DISABLED


GO


ALTER DATABASE [MyAssignmentPRJ301] SET ACCELERATED_DATABASE_RECOVERY = OFF 


GO


EXEC sys.sp_db_vardecimal_storage_format N'MyAssignmentPRJ301', N'ON'


GO


ALTER DATABASE [MyAssignmentPRJ301] SET QUERY_STORE = OFF


GO


USE [MyAssignmentPRJ301]


GO


/****** Object:  Table [dbo].[Attendance]    Script Date: 16/6/2022 2:41:19 AM ******/


SET ANSI_NULLS ON


GO


SET QUOTED_IDENTIFIER ON


GO


CREATE TABLE [dbo].[Attendance](


	[AttendanceID] [int] IDENTITY(1,1) NOT NULL,


	[SessionID] [int] NOT NULL,


	[StudentID] [int] NOT NULL,


	[Absent] [bit] NOT NULL,


CONSTRAINT [PK_Attendance] PRIMARY KEY CLUSTERED


(


	[AttendanceID] ASC


)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]


) ON [PRIMARY]


GO


/****** Object:  Table [dbo].[Group]    Script Date: 16/6/2022 2:41:19 AM ******/


SET ANSI_NULLS ON


GO


SET QUOTED_IDENTIFIER ON


GO


CREATE TABLE [dbo].[Group](


	[GroupID] [int] IDENTITY(1,1) NOT NULL,


	[GroupName] [nvarchar](50) NOT NULL,


	[SubjectID] [int] NOT NULL,


	[LecturerID] [int] NOT NULL,


	[Room] [int] NOT NULL,


CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED


(


	[GroupID] ASC


)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]


) ON [PRIMARY]


GO


/****** Object:  Table [dbo].[Group_Student]    Script Date: 16/6/2022 2:41:19 AM ******/


SET ANSI_NULLS ON


GO


SET QUOTED_IDENTIFIER ON


GO


CREATE TABLE [dbo].[Group_Student](


	[GroupID] [int] NOT NULL,


	[StudentID] [int] NOT NULL


) ON [PRIMARY]


GO


/****** Object:  Table [dbo].[Lecturer]    Script Date: 16/6/2022 2:41:19 AM ******/


SET ANSI_NULLS ON


GO


SET QUOTED_IDENTIFIER ON


GO


CREATE TABLE [dbo].[Lecturer](


	[LecturerID] [int] IDENTITY(1,1) NOT NULL,


	[LecturerFirstName] [nvarchar](50) NOT NULL,


	[LecturerMiddeName] [nvarchar](50) NOT NULL,


	[LecturerLastName] [nvarchar](50) NOT NULL,


CONSTRAINT [PK_Lecturer] PRIMARY KEY CLUSTERED


(


	[LecturerID] ASC


)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]


) ON [PRIMARY]


GO


/****** Object:  Table [dbo].[Room]    Script Date: 16/6/2022 2:41:19 AM ******/


SET ANSI_NULLS ON


GO


SET QUOTED_IDENTIFIER ON


GO


CREATE TABLE [dbo].[Room](


	[RoomID] [int] IDENTITY(1,1) NOT NULL,


	[RoomCode] [nvarchar](50) NOT NULL,


	[Campus] [nvarchar](50) NOT NULL,


CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED


(


	[RoomID] ASC


)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]


) ON [PRIMARY]


GO


/****** Object:  Table [dbo].[Session]    Script Date: 16/6/2022 2:41:19 AM ******/


SET ANSI_NULLS ON


GO


SET QUOTED_IDENTIFIER ON


GO


CREATE TABLE [dbo].[Session](


	[SessionID] [int] IDENTITY(1,1) NOT NULL,


	[GroupID] [int] NOT NULL,


	[TeachDate] [date] NOT NULL,


	[Slot] [int] NOT NULL,


CONSTRAINT [PK_Session] PRIMARY KEY CLUSTERED


(


	[SessionID] ASC


)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]


) ON [PRIMARY]


GO


/****** Object:  Table [dbo].[Student]    Script Date: 16/6/2022 2:41:19 AM ******/


SET ANSI_NULLS ON


GO


SET QUOTED_IDENTIFIER ON


GO


CREATE TABLE [dbo].[Student](


	[StudentID] [int] IDENTITY(1,1) NOT NULL,


	[RoleNumber] [nvarchar](50) NOT NULL,


	[FirstName] [nvarchar](50) NOT NULL,


	[MiddleName] [nvarchar](50) NOT NULL,


	[LastName] [nvarchar](50) NOT NULL,


CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED


(


	[StudentID] ASC


)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]


) ON [PRIMARY]


GO


/****** Object:  Table [dbo].[Subject]    Script Date: 16/6/2022 2:41:19 AM ******/


SET ANSI_NULLS ON


GO


SET QUOTED_IDENTIFIER ON


GO


CREATE TABLE [dbo].[Subject](


	[SubjectID] [int] IDENTITY(1,1) NOT NULL,


	[SubjectCode] [nvarchar](50) NOT NULL,


	[SubjectName] [nvarchar](50) NOT NULL,


CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED


(


	[SubjectID] ASC


)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]


) ON [PRIMARY]


GO


ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Session] FOREIGN KEY([SessionID])


REFERENCES [dbo].[Session] ([SessionID])


GO


ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Session]


GO


ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Student] FOREIGN KEY([StudentID])


REFERENCES [dbo].[Student] ([StudentID])


GO


ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Student]


GO


ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Lecturer] FOREIGN KEY([LecturerID])


REFERENCES [dbo].[Lecturer] ([LecturerID])


GO


ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Lecturer]


GO


ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Room] FOREIGN KEY([Room])


REFERENCES [dbo].[Room] ([RoomID])


GO


ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Room]


GO


ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Subject] FOREIGN KEY([SubjectID])


REFERENCES [dbo].[Subject] ([SubjectID])


GO


ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Subject]


GO


ALTER TABLE [dbo].[Group_Student]  WITH CHECK ADD  CONSTRAINT [FK_Group_Student_Group] FOREIGN KEY([GroupID])


REFERENCES [dbo].[Group] ([GroupID])


GO


ALTER TABLE [dbo].[Group_Student] CHECK CONSTRAINT [FK_Group_Student_Group]


GO


ALTER TABLE [dbo].[Group_Student]  WITH CHECK ADD  CONSTRAINT [FK_Group_Student_Student] FOREIGN KEY([StudentID])


REFERENCES [dbo].[Student] ([StudentID])


GO


ALTER TABLE [dbo].[Group_Student] CHECK CONSTRAINT [FK_Group_Student_Student]


GO


ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Group] FOREIGN KEY([GroupID])


REFERENCES [dbo].[Group] ([GroupID])


GO


ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Group]


GO


USE [master]


GO


ALTER DATABASE [MyAssignmentPRJ301] SET  READ_WRITE


GO


