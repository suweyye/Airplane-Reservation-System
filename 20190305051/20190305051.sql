
--CREATE DATABASE [20190305051] 
--GO

--ÖNCE UST TARAFI SEÇ VE ÇALIŞTIR

-- DAHA SONRA YORUM SATIRI YAP 
-- DAHA SONRA HEPSİNİ SEÇ VE ÇALIŞTIR

USE [20190305051]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 19.05.2023 21:08:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[ID] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_admin] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AircraftModels]    Script Date: 19.05.2023 21:08:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AircraftModels](
	[ModelID] [int] NOT NULL,
	[ModelName] [varchar](100) NULL,
	[Manufacturer] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ModelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Airports]    Script Date: 19.05.2023 21:08:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Airports](
	[AirportID] [int] NOT NULL,
	[AirportName] [varchar](100) NULL,
	[City] [varchar](100) NULL,
	[Country] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[AirportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flights]    Script Date: 19.05.2023 21:08:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flights](
	[FlightID] [int] NOT NULL,
	[DepartureAirportID] [int] NULL,
	[ArrivalAirportID] [int] NULL,
	[ModelID] [int] NULL,
	[DepartureDate] [date] NULL,
	[ArrivalDate] [date] NULL,
	[SeatCount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[FlightID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Passengers]    Script Date: 19.05.2023 21:08:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Passengers](
	[PassengerID] [int] NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](100) NULL,
	[Phone] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[PassengerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 19.05.2023 21:08:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservations](
	[ReservationID] [int] NOT NULL,
	[PassengerID] [int] NULL,
	[FlightID] [int] NULL,
	[ReservationDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Admin] ([ID], [Password]) VALUES (N'20190305051', N'admin123')
GO
INSERT [dbo].[AircraftModels] ([ModelID], [ModelName], [Manufacturer]) VALUES (1, N'Boeing 737', N'Boeing')
INSERT [dbo].[AircraftModels] ([ModelID], [ModelName], [Manufacturer]) VALUES (2, N'Airbus A320', N'Airbus')
INSERT [dbo].[AircraftModels] ([ModelID], [ModelName], [Manufacturer]) VALUES (3, N'Embraer E190', N'Embraer')
INSERT [dbo].[AircraftModels] ([ModelID], [ModelName], [Manufacturer]) VALUES (4, N'Bombardier CRJ900', N'Bombardier')
INSERT [dbo].[AircraftModels] ([ModelID], [ModelName], [Manufacturer]) VALUES (5, N'Boeing 777', N'Boeing')
INSERT [dbo].[AircraftModels] ([ModelID], [ModelName], [Manufacturer]) VALUES (6, N'Airbus A380', N'Airbus')
INSERT [dbo].[AircraftModels] ([ModelID], [ModelName], [Manufacturer]) VALUES (7, N'Cessna 172', N'Cessna')
INSERT [dbo].[AircraftModels] ([ModelID], [ModelName], [Manufacturer]) VALUES (8, N'Bombardier Challenger 350', N'Bombardier')
INSERT [dbo].[AircraftModels] ([ModelID], [ModelName], [Manufacturer]) VALUES (9, N'Gulfstream G650', N'Gulfstream')
INSERT [dbo].[AircraftModels] ([ModelID], [ModelName], [Manufacturer]) VALUES (10, N'Embraer Phenom 300', N'Embraer')
GO
INSERT [dbo].[Airports] ([AirportID], [AirportName], [City], [Country]) VALUES (1, N'John F. Kennedy International Airport', N'New York', N'United States')
INSERT [dbo].[Airports] ([AirportID], [AirportName], [City], [Country]) VALUES (2, N'Heathrow Airport', N'London', N'United Kingdom')
INSERT [dbo].[Airports] ([AirportID], [AirportName], [City], [Country]) VALUES (3, N'Charles de Gaulle Airport', N'Paris', N'France')
INSERT [dbo].[Airports] ([AirportID], [AirportName], [City], [Country]) VALUES (4, N'Dubai International Airport', N'Dubai', N'United Arab Emirates')
INSERT [dbo].[Airports] ([AirportID], [AirportName], [City], [Country]) VALUES (5, N'Beijing Capital International Airport', N'Beijing', N'China')
INSERT [dbo].[Airports] ([AirportID], [AirportName], [City], [Country]) VALUES (6, N'Los Angeles International Airport', N'Los Angeles', N'United States')
INSERT [dbo].[Airports] ([AirportID], [AirportName], [City], [Country]) VALUES (7, N'Tokyo Haneda Airport', N'Tokyo', N'Japan')
INSERT [dbo].[Airports] ([AirportID], [AirportName], [City], [Country]) VALUES (8, N'Sydney Airport', N'Sydney', N'Australia')
INSERT [dbo].[Airports] ([AirportID], [AirportName], [City], [Country]) VALUES (9, N'Frankfurt Airport', N'Frankfurt', N'Germany')
INSERT [dbo].[Airports] ([AirportID], [AirportName], [City], [Country]) VALUES (10, N'Singapore Changi Airport', N'Singapore', N'Singapore')
INSERT [dbo].[Airports] ([AirportID], [AirportName], [City], [Country]) VALUES (11, N'Incheon International Airport', N'Seoul', N'South Korea')
INSERT [dbo].[Airports] ([AirportID], [AirportName], [City], [Country]) VALUES (12, N'Amsterdam Airport Schiphol', N'Amsterdam', N'Netherlands')
INSERT [dbo].[Airports] ([AirportID], [AirportName], [City], [Country]) VALUES (13, N'Suvarnabhumi Airport', N'Bangkok', N'Thailand')
INSERT [dbo].[Airports] ([AirportID], [AirportName], [City], [Country]) VALUES (14, N'Toronto Pearson International Airport', N'Toronto', N'Canada')
INSERT [dbo].[Airports] ([AirportID], [AirportName], [City], [Country]) VALUES (15, N'Mumbai Chhatrapati Shivaji Maharaj International Airport', N'Mumbai', N'India')
GO
INSERT [dbo].[Flights] ([FlightID], [DepartureAirportID], [ArrivalAirportID], [ModelID], [DepartureDate], [ArrivalDate], [SeatCount]) VALUES (1, 2, 6, 1, CAST(N'2023-05-20' AS Date), CAST(N'2023-05-20' AS Date), 5)
INSERT [dbo].[Flights] ([FlightID], [DepartureAirportID], [ArrivalAirportID], [ModelID], [DepartureDate], [ArrivalDate], [SeatCount]) VALUES (3, 4, 11, 3, CAST(N'2023-05-22' AS Date), CAST(N'2023-05-22' AS Date), 90)
INSERT [dbo].[Flights] ([FlightID], [DepartureAirportID], [ArrivalAirportID], [ModelID], [DepartureDate], [ArrivalDate], [SeatCount]) VALUES (4, 5, 10, 4, CAST(N'2023-05-23' AS Date), CAST(N'2023-05-23' AS Date), 200)
INSERT [dbo].[Flights] ([FlightID], [DepartureAirportID], [ArrivalAirportID], [ModelID], [DepartureDate], [ArrivalDate], [SeatCount]) VALUES (5, 6, 2, 1, CAST(N'2023-05-24' AS Date), CAST(N'2023-05-24' AS Date), 160)
INSERT [dbo].[Flights] ([FlightID], [DepartureAirportID], [ArrivalAirportID], [ModelID], [DepartureDate], [ArrivalDate], [SeatCount]) VALUES (6, 9, 3, 2, CAST(N'2023-05-25' AS Date), CAST(N'2023-05-25' AS Date), 110)
INSERT [dbo].[Flights] ([FlightID], [DepartureAirportID], [ArrivalAirportID], [ModelID], [DepartureDate], [ArrivalDate], [SeatCount]) VALUES (7, 8, 4, 3, CAST(N'2023-05-26' AS Date), CAST(N'2023-05-26' AS Date), 80)
INSERT [dbo].[Flights] ([FlightID], [DepartureAirportID], [ArrivalAirportID], [ModelID], [DepartureDate], [ArrivalDate], [SeatCount]) VALUES (8, 10, 5, 4, CAST(N'2023-05-27' AS Date), CAST(N'2023-05-27' AS Date), 190)
INSERT [dbo].[Flights] ([FlightID], [DepartureAirportID], [ArrivalAirportID], [ModelID], [DepartureDate], [ArrivalDate], [SeatCount]) VALUES (9, 2, 6, 1, CAST(N'2023-05-28' AS Date), CAST(N'2023-05-28' AS Date), 140)
INSERT [dbo].[Flights] ([FlightID], [DepartureAirportID], [ArrivalAirportID], [ModelID], [DepartureDate], [ArrivalDate], [SeatCount]) VALUES (10, 3, 9, 2, CAST(N'2023-05-29' AS Date), CAST(N'2023-05-29' AS Date), 130)
INSERT [dbo].[Flights] ([FlightID], [DepartureAirportID], [ArrivalAirportID], [ModelID], [DepartureDate], [ArrivalDate], [SeatCount]) VALUES (11, 1, 2, 7, CAST(N'2023-05-19' AS Date), CAST(N'2023-05-19' AS Date), 150)
INSERT [dbo].[Flights] ([FlightID], [DepartureAirportID], [ArrivalAirportID], [ModelID], [DepartureDate], [ArrivalDate], [SeatCount]) VALUES (12, 3, 4, 3, CAST(N'2023-05-20' AS Date), CAST(N'2023-05-20' AS Date), 180)
INSERT [dbo].[Flights] ([FlightID], [DepartureAirportID], [ArrivalAirportID], [ModelID], [DepartureDate], [ArrivalDate], [SeatCount]) VALUES (13, 2, 3, 10, CAST(N'2023-05-21' AS Date), CAST(N'2023-05-21' AS Date), 200)
INSERT [dbo].[Flights] ([FlightID], [DepartureAirportID], [ArrivalAirportID], [ModelID], [DepartureDate], [ArrivalDate], [SeatCount]) VALUES (14, 4, 5, 4, CAST(N'2023-05-22' AS Date), CAST(N'2023-05-22' AS Date), 220)
INSERT [dbo].[Flights] ([FlightID], [DepartureAirportID], [ArrivalAirportID], [ModelID], [DepartureDate], [ArrivalDate], [SeatCount]) VALUES (15, 1, 3, 2, CAST(N'2023-05-23' AS Date), CAST(N'2023-05-23' AS Date), 180)
INSERT [dbo].[Flights] ([FlightID], [DepartureAirportID], [ArrivalAirportID], [ModelID], [DepartureDate], [ArrivalDate], [SeatCount]) VALUES (16, 2, 4, 6, CAST(N'2023-05-24' AS Date), CAST(N'2023-05-24' AS Date), 200)
INSERT [dbo].[Flights] ([FlightID], [DepartureAirportID], [ArrivalAirportID], [ModelID], [DepartureDate], [ArrivalDate], [SeatCount]) VALUES (17, 3, 5, 9, CAST(N'2023-05-25' AS Date), CAST(N'2023-05-25' AS Date), 150)
INSERT [dbo].[Flights] ([FlightID], [DepartureAirportID], [ArrivalAirportID], [ModelID], [DepartureDate], [ArrivalDate], [SeatCount]) VALUES (18, 4, 1, 8, CAST(N'2023-05-26' AS Date), CAST(N'2023-05-26' AS Date), 220)
INSERT [dbo].[Flights] ([FlightID], [DepartureAirportID], [ArrivalAirportID], [ModelID], [DepartureDate], [ArrivalDate], [SeatCount]) VALUES (19, 5, 2, 1, CAST(N'2023-05-27' AS Date), CAST(N'2023-05-27' AS Date), 180)
INSERT [dbo].[Flights] ([FlightID], [DepartureAirportID], [ArrivalAirportID], [ModelID], [DepartureDate], [ArrivalDate], [SeatCount]) VALUES (20, 1, 4, 5, CAST(N'2023-05-28' AS Date), CAST(N'2023-05-28' AS Date), 200)
INSERT [dbo].[Flights] ([FlightID], [DepartureAirportID], [ArrivalAirportID], [ModelID], [DepartureDate], [ArrivalDate], [SeatCount]) VALUES (21, 3, 1, 2, CAST(N'2023-05-30' AS Date), CAST(N'2023-05-30' AS Date), 220)
INSERT [dbo].[Flights] ([FlightID], [DepartureAirportID], [ArrivalAirportID], [ModelID], [DepartureDate], [ArrivalDate], [SeatCount]) VALUES (22, 4, 2, 8, CAST(N'2023-05-31' AS Date), CAST(N'2023-05-31' AS Date), 180)
INSERT [dbo].[Flights] ([FlightID], [DepartureAirportID], [ArrivalAirportID], [ModelID], [DepartureDate], [ArrivalDate], [SeatCount]) VALUES (23, 5, 3, 6, CAST(N'2023-06-01' AS Date), CAST(N'2023-06-01' AS Date), 150)
INSERT [dbo].[Flights] ([FlightID], [DepartureAirportID], [ArrivalAirportID], [ModelID], [DepartureDate], [ArrivalDate], [SeatCount]) VALUES (24, 1, 5, 4, CAST(N'2023-06-02' AS Date), CAST(N'2023-06-02' AS Date), 200)
INSERT [dbo].[Flights] ([FlightID], [DepartureAirportID], [ArrivalAirportID], [ModelID], [DepartureDate], [ArrivalDate], [SeatCount]) VALUES (25, 2, 1, 9, CAST(N'2023-06-03' AS Date), CAST(N'2023-06-03' AS Date), 220)
INSERT [dbo].[Flights] ([FlightID], [DepartureAirportID], [ArrivalAirportID], [ModelID], [DepartureDate], [ArrivalDate], [SeatCount]) VALUES (26, 4, 3, 3, CAST(N'2023-06-05' AS Date), CAST(N'2023-06-05' AS Date), 180)
INSERT [dbo].[Flights] ([FlightID], [DepartureAirportID], [ArrivalAirportID], [ModelID], [DepartureDate], [ArrivalDate], [SeatCount]) VALUES (27, 5, 4, 5, CAST(N'2023-06-06' AS Date), CAST(N'2023-06-06' AS Date), 200)
INSERT [dbo].[Flights] ([FlightID], [DepartureAirportID], [ArrivalAirportID], [ModelID], [DepartureDate], [ArrivalDate], [SeatCount]) VALUES (28, 1, 2, 7, CAST(N'2023-06-07' AS Date), CAST(N'2023-06-07' AS Date), 150)
INSERT [dbo].[Flights] ([FlightID], [DepartureAirportID], [ArrivalAirportID], [ModelID], [DepartureDate], [ArrivalDate], [SeatCount]) VALUES (29, 3, 1, 1, CAST(N'2023-06-08' AS Date), CAST(N'2023-06-08' AS Date), 220)
INSERT [dbo].[Flights] ([FlightID], [DepartureAirportID], [ArrivalAirportID], [ModelID], [DepartureDate], [ArrivalDate], [SeatCount]) VALUES (30, 2, 4, 10, CAST(N'2023-06-09' AS Date), CAST(N'2023-06-09' AS Date), 180)
INSERT [dbo].[Flights] ([FlightID], [DepartureAirportID], [ArrivalAirportID], [ModelID], [DepartureDate], [ArrivalDate], [SeatCount]) VALUES (31, 4, 5, 3, CAST(N'2023-06-10' AS Date), CAST(N'2023-06-10' AS Date), 200)
INSERT [dbo].[Flights] ([FlightID], [DepartureAirportID], [ArrivalAirportID], [ModelID], [DepartureDate], [ArrivalDate], [SeatCount]) VALUES (32, 5, 3, 6, CAST(N'2023-06-11' AS Date), CAST(N'2023-06-11' AS Date), 150)
INSERT [dbo].[Flights] ([FlightID], [DepartureAirportID], [ArrivalAirportID], [ModelID], [DepartureDate], [ArrivalDate], [SeatCount]) VALUES (33, 1, 2, 2, CAST(N'2023-06-12' AS Date), CAST(N'2023-06-12' AS Date), 220)
INSERT [dbo].[Flights] ([FlightID], [DepartureAirportID], [ArrivalAirportID], [ModelID], [DepartureDate], [ArrivalDate], [SeatCount]) VALUES (34, 2, 4, 9, CAST(N'2023-06-13' AS Date), CAST(N'2023-06-13' AS Date), 180)
INSERT [dbo].[Flights] ([FlightID], [DepartureAirportID], [ArrivalAirportID], [ModelID], [DepartureDate], [ArrivalDate], [SeatCount]) VALUES (35, 3, 5, 4, CAST(N'2023-06-14' AS Date), CAST(N'2023-06-14' AS Date), 150)
INSERT [dbo].[Flights] ([FlightID], [DepartureAirportID], [ArrivalAirportID], [ModelID], [DepartureDate], [ArrivalDate], [SeatCount]) VALUES (36, 4, 1, 8, CAST(N'2023-06-15' AS Date), CAST(N'2023-06-15' AS Date), 200)
INSERT [dbo].[Flights] ([FlightID], [DepartureAirportID], [ArrivalAirportID], [ModelID], [DepartureDate], [ArrivalDate], [SeatCount]) VALUES (37, 5, 2, 5, CAST(N'2023-06-16' AS Date), CAST(N'2023-06-16' AS Date), 220)
INSERT [dbo].[Flights] ([FlightID], [DepartureAirportID], [ArrivalAirportID], [ModelID], [DepartureDate], [ArrivalDate], [SeatCount]) VALUES (38, 1, 3, 7, CAST(N'2023-06-17' AS Date), CAST(N'2023-06-17' AS Date), 180)
GO
INSERT [dbo].[Passengers] ([PassengerID], [FirstName], [LastName], [Email], [Phone]) VALUES (1, N'John', N'Doe', N'john.doe@example.com', N'123-456-7890')
INSERT [dbo].[Passengers] ([PassengerID], [FirstName], [LastName], [Email], [Phone]) VALUES (2, N'Emily', N'Smith', N'emily.smith@example.com', N'987-654-3210')
INSERT [dbo].[Passengers] ([PassengerID], [FirstName], [LastName], [Email], [Phone]) VALUES (3, N'Michael', N'Johnson', N'michael.johnson@example.com', N'456-789-0123')
INSERT [dbo].[Passengers] ([PassengerID], [FirstName], [LastName], [Email], [Phone]) VALUES (4, N'Sophia', N'Brown', N'sophia.brown@example.com', N'321-654-9870')
INSERT [dbo].[Passengers] ([PassengerID], [FirstName], [LastName], [Email], [Phone]) VALUES (5, N'James', N'Taylor', N'james.taylor@example.com', N'789-012-3456')
INSERT [dbo].[Passengers] ([PassengerID], [FirstName], [LastName], [Email], [Phone]) VALUES (6, N'Olivia', N'Miller', N'olivia.miller@example.com', N'234-567-8901')
INSERT [dbo].[Passengers] ([PassengerID], [FirstName], [LastName], [Email], [Phone]) VALUES (7, N'William', N'Anderson', N'william.anderson@example.com', N'890-123-4567')
INSERT [dbo].[Passengers] ([PassengerID], [FirstName], [LastName], [Email], [Phone]) VALUES (8, N'Emma', N'Wilson', N'emma.wilson@example.com', N'567-890-1234')
INSERT [dbo].[Passengers] ([PassengerID], [FirstName], [LastName], [Email], [Phone]) VALUES (9, N'Alexander', N'Davis', N'alexander.davis@example.com', N'012-345-6789')
INSERT [dbo].[Passengers] ([PassengerID], [FirstName], [LastName], [Email], [Phone]) VALUES (10, N'Ava', N'Martinez', N'ava.martinez@example.com', N'456-789-0123')
INSERT [dbo].[Passengers] ([PassengerID], [FirstName], [LastName], [Email], [Phone]) VALUES (11, N'Daniel', N'Garcia', N'daniel.garcia@example.com', N'901-234-5678')
INSERT [dbo].[Passengers] ([PassengerID], [FirstName], [LastName], [Email], [Phone]) VALUES (12, N'Mia', N'Rodriguez', N'mia.rodriguez@example.com', N'789-012-3456')
INSERT [dbo].[Passengers] ([PassengerID], [FirstName], [LastName], [Email], [Phone]) VALUES (13, N'David', N'Lopez', N'david.lopez@example.com', N'234-567-8901')
INSERT [dbo].[Passengers] ([PassengerID], [FirstName], [LastName], [Email], [Phone]) VALUES (14, N'Isabella', N'Hernandez', N'isabella.hernandez@example.com', N'012-345-6789')
INSERT [dbo].[Passengers] ([PassengerID], [FirstName], [LastName], [Email], [Phone]) VALUES (15, N'Jackson', N'Gonzalez', N'jackson.gonzalez@example.com', N'567-890-1234')
INSERT [dbo].[Passengers] ([PassengerID], [FirstName], [LastName], [Email], [Phone]) VALUES (16, N'Sophie', N'Perez', N'sophie.perez@example.com', N'890-123-4567')
INSERT [dbo].[Passengers] ([PassengerID], [FirstName], [LastName], [Email], [Phone]) VALUES (17, N'Joseph', N'Adams', N'joseph.adams@example.com', N'234-567-8901')
INSERT [dbo].[Passengers] ([PassengerID], [FirstName], [LastName], [Email], [Phone]) VALUES (18, N'Charlotte', N'Campbell', N'charlotte.campbell@example.com', N'901-234-5678')
GO
INSERT [dbo].[Reservations] ([ReservationID], [PassengerID], [FlightID], [ReservationDate]) VALUES (1, 1, 1, CAST(N'2023-05-19' AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [PassengerID], [FlightID], [ReservationDate]) VALUES (3, 3, 3, CAST(N'2023-05-21' AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [PassengerID], [FlightID], [ReservationDate]) VALUES (4, 4, 4, CAST(N'2023-05-22' AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [PassengerID], [FlightID], [ReservationDate]) VALUES (5, 5, 5, CAST(N'2023-05-23' AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [PassengerID], [FlightID], [ReservationDate]) VALUES (6, 6, 6, CAST(N'2023-05-24' AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [PassengerID], [FlightID], [ReservationDate]) VALUES (7, 7, 7, CAST(N'2023-05-25' AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [PassengerID], [FlightID], [ReservationDate]) VALUES (8, 8, 8, CAST(N'2023-05-26' AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [PassengerID], [FlightID], [ReservationDate]) VALUES (9, 9, 9, CAST(N'2023-05-27' AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [PassengerID], [FlightID], [ReservationDate]) VALUES (10, 10, 10, CAST(N'2023-05-28' AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [PassengerID], [FlightID], [ReservationDate]) VALUES (11, 11, 1, CAST(N'2023-05-19' AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [PassengerID], [FlightID], [ReservationDate]) VALUES (13, 13, 3, CAST(N'2023-05-21' AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [PassengerID], [FlightID], [ReservationDate]) VALUES (14, 14, 4, CAST(N'2023-05-22' AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [PassengerID], [FlightID], [ReservationDate]) VALUES (15, 15, 5, CAST(N'2023-05-23' AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [PassengerID], [FlightID], [ReservationDate]) VALUES (16, 16, 6, CAST(N'2023-05-24' AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [PassengerID], [FlightID], [ReservationDate]) VALUES (17, 17, 7, CAST(N'2023-05-25' AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [PassengerID], [FlightID], [ReservationDate]) VALUES (18, 18, 8, CAST(N'2023-05-26' AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [PassengerID], [FlightID], [ReservationDate]) VALUES (19, 1, 9, CAST(N'2023-05-27' AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [PassengerID], [FlightID], [ReservationDate]) VALUES (20, 2, 10, CAST(N'2023-05-28' AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [PassengerID], [FlightID], [ReservationDate]) VALUES (21, 3, 1, CAST(N'2023-05-19' AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [PassengerID], [FlightID], [ReservationDate]) VALUES (23, 5, 3, CAST(N'2023-05-21' AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [PassengerID], [FlightID], [ReservationDate]) VALUES (24, 6, 4, CAST(N'2023-05-22' AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [PassengerID], [FlightID], [ReservationDate]) VALUES (25, 7, 5, CAST(N'2023-05-23' AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [PassengerID], [FlightID], [ReservationDate]) VALUES (26, 8, 6, CAST(N'2023-05-24' AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [PassengerID], [FlightID], [ReservationDate]) VALUES (27, 9, 7, CAST(N'2023-05-25' AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [PassengerID], [FlightID], [ReservationDate]) VALUES (28, 10, 8, CAST(N'2023-05-26' AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [PassengerID], [FlightID], [ReservationDate]) VALUES (29, 11, 9, CAST(N'2023-05-27' AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [PassengerID], [FlightID], [ReservationDate]) VALUES (30, 12, 10, CAST(N'2023-05-28' AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [PassengerID], [FlightID], [ReservationDate]) VALUES (111, 17, 1, NULL)
INSERT [dbo].[Reservations] ([ReservationID], [PassengerID], [FlightID], [ReservationDate]) VALUES (1111, 1, 1, CAST(N'2023-05-19' AS Date))
GO
ALTER TABLE [dbo].[Flights]  WITH CHECK ADD FOREIGN KEY([ArrivalAirportID])
REFERENCES [dbo].[Airports] ([AirportID])
GO
ALTER TABLE [dbo].[Flights]  WITH CHECK ADD FOREIGN KEY([DepartureAirportID])
REFERENCES [dbo].[Airports] ([AirportID])
GO
ALTER TABLE [dbo].[Flights]  WITH CHECK ADD FOREIGN KEY([ModelID])
REFERENCES [dbo].[AircraftModels] ([ModelID])
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD FOREIGN KEY([FlightID])
REFERENCES [dbo].[Flights] ([FlightID])
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD FOREIGN KEY([PassengerID])
REFERENCES [dbo].[Passengers] ([PassengerID])
GO
