USE [Manage Grade System]
GO
/****** Object:  Table [dbo].[Assesment]    Script Date: 7/9/2022 11:33:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assesment](
	[Asses.ID] [char](10) NOT NULL,
	[CategoryID] [char](10) NOT NULL,
	[Completion Criteria] [smallint] NOT NULL,
 CONSTRAINT [PK_Assesment] PRIMARY KEY CLUSTERED 
(
	[Asses.ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Assesment_Subject]    Script Date: 7/9/2022 11:33:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assesment_Subject](
	[Sub.ID] [char](10) NOT NULL,
	[Ass.ID] [char](10) NOT NULL,
	[Weight] [decimal](5, 2) NULL,
	[Duration] [nvarchar](50) NULL,
	[No Question] [int] NULL,
	[Part] [int] NULL,
 CONSTRAINT [PK_Assesment_Subject] PRIMARY KEY CLUSTERED 
(
	[Sub.ID] ASC,
	[Ass.ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/9/2022 11:33:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [char](10) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 7/9/2022 11:33:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[Class.ID] [char](10) NOT NULL,
	[Sem.ID] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[Class.ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grade]    Script Date: 7/9/2022 11:33:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grade](
	[Gra.ID] [char](10) NOT NULL,
	[Asses.ID] [char](10) NOT NULL,
	[Sub.ID] [char](10) NOT NULL,
	[Lec.ID] [char](10) NOT NULL,
	[Stu.ID] [char](10) NULL,
	[G.ID] [char](10) NULL,
	[Mark] [float] NULL,
 CONSTRAINT [PK_Grade] PRIMARY KEY CLUSTERED 
(
	[Gra.ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 7/9/2022 11:33:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[G.ID] [char](10) NOT NULL,
	[Lec.ID] [char](10) NOT NULL,
	[Sub.ID] [char](10) NOT NULL,
	[Class.ID] [char](10) NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[G.ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group_Student]    Script Date: 7/9/2022 11:33:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group_Student](
	[Stu.ID] [char](10) NOT NULL,
	[G.ID] [char](10) NOT NULL,
 CONSTRAINT [PK_Group_Student] PRIMARY KEY CLUSTERED 
(
	[Stu.ID] ASC,
	[G.ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lecturer]    Script Date: 7/9/2022 11:33:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lecturer](
	[Lec.ID] [char](10) NOT NULL,
	[FName] [nvarchar](50) NOT NULL,
	[LName] [nvarchar](50) NULL,
	[Gender] [bit] NULL,
	[PhoneNumber] [int] NULL,
 CONSTRAINT [PK_Lecturer] PRIMARY KEY CLUSTERED 
(
	[Lec.ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Semester]    Script Date: 7/9/2022 11:33:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Semester](
	[Sem.ID] [nchar](10) NOT NULL,
	[SemesterName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Semester] PRIMARY KEY CLUSTERED 
(
	[Sem.ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 7/9/2022 11:33:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Stu.ID] [char](10) NOT NULL,
	[FName] [nvarchar](50) NULL,
	[LName] [nvarchar](50) NOT NULL,
	[Major] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Stu.ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 7/9/2022 11:33:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[Sub.ID] [char](10) NOT NULL,
	[SubName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[Sub.ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Assesment]  WITH CHECK ADD  CONSTRAINT [FK_Assesment_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Assesment] CHECK CONSTRAINT [FK_Assesment_Category]
GO
ALTER TABLE [dbo].[Assesment_Subject]  WITH CHECK ADD  CONSTRAINT [FK_Assesment_Subject_Assesment] FOREIGN KEY([Ass.ID])
REFERENCES [dbo].[Assesment] ([Asses.ID])
GO
ALTER TABLE [dbo].[Assesment_Subject] CHECK CONSTRAINT [FK_Assesment_Subject_Assesment]
GO
ALTER TABLE [dbo].[Assesment_Subject]  WITH CHECK ADD  CONSTRAINT [FK_Assesment_Subject_Subject] FOREIGN KEY([Sub.ID])
REFERENCES [dbo].[Subject] ([Sub.ID])
GO
ALTER TABLE [dbo].[Assesment_Subject] CHECK CONSTRAINT [FK_Assesment_Subject_Subject]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Semester] FOREIGN KEY([Sem.ID])
REFERENCES [dbo].[Semester] ([Sem.ID])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_Semester]
GO
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD  CONSTRAINT [FK_Grade_Assesment] FOREIGN KEY([Asses.ID])
REFERENCES [dbo].[Assesment] ([Asses.ID])
GO
ALTER TABLE [dbo].[Grade] CHECK CONSTRAINT [FK_Grade_Assesment]
GO
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD  CONSTRAINT [FK_Grade_Group] FOREIGN KEY([G.ID])
REFERENCES [dbo].[Group] ([G.ID])
GO
ALTER TABLE [dbo].[Grade] CHECK CONSTRAINT [FK_Grade_Group]
GO
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD  CONSTRAINT [FK_Grade_Lecturer] FOREIGN KEY([Lec.ID])
REFERENCES [dbo].[Lecturer] ([Lec.ID])
GO
ALTER TABLE [dbo].[Grade] CHECK CONSTRAINT [FK_Grade_Lecturer]
GO
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD  CONSTRAINT [FK_Grade_Student] FOREIGN KEY([Stu.ID])
REFERENCES [dbo].[Student] ([Stu.ID])
GO
ALTER TABLE [dbo].[Grade] CHECK CONSTRAINT [FK_Grade_Student]
GO
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD  CONSTRAINT [FK_Grade_Subject] FOREIGN KEY([Sub.ID])
REFERENCES [dbo].[Subject] ([Sub.ID])
GO
ALTER TABLE [dbo].[Grade] CHECK CONSTRAINT [FK_Grade_Subject]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Class] FOREIGN KEY([Class.ID])
REFERENCES [dbo].[Class] ([Class.ID])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Class]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Lecturer] FOREIGN KEY([Lec.ID])
REFERENCES [dbo].[Lecturer] ([Lec.ID])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Lecturer]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Subject] FOREIGN KEY([Sub.ID])
REFERENCES [dbo].[Subject] ([Sub.ID])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Subject]
GO
ALTER TABLE [dbo].[Group_Student]  WITH CHECK ADD  CONSTRAINT [FK_Group_Student_Group] FOREIGN KEY([G.ID])
REFERENCES [dbo].[Group] ([G.ID])
GO
ALTER TABLE [dbo].[Group_Student] CHECK CONSTRAINT [FK_Group_Student_Group]
GO
ALTER TABLE [dbo].[Group_Student]  WITH CHECK ADD  CONSTRAINT [FK_Group_Student_Student] FOREIGN KEY([Stu.ID])
REFERENCES [dbo].[Student] ([Stu.ID])
GO
ALTER TABLE [dbo].[Group_Student] CHECK CONSTRAINT [FK_Group_Student_Student]
GO
ALTER TABLE [dbo].[Assesment_Subject]  WITH CHECK ADD  CONSTRAINT [CK_Assesment_Subject] CHECK  (([Weight]>(0) AND [Weight]<=(100)))
GO
ALTER TABLE [dbo].[Assesment_Subject] CHECK CONSTRAINT [CK_Assesment_Subject]
GO
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD  CONSTRAINT [CK_Grade] CHECK  (([Mark]>=(0) AND [Mark]<=(10)))
GO
ALTER TABLE [dbo].[Grade] CHECK CONSTRAINT [CK_Grade]
GO
