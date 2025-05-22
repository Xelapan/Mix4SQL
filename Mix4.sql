USE [master]
GO
/****** Object:  Database [Mix4]    Script Date: 22/05/2025 15:48:47 ******/
CREATE DATABASE [Mix4]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Mix4', FILENAME = N'/var/opt/mssql/data/Mix4.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Mix4_log', FILENAME = N'/var/opt/mssql/data/Mix4_log.ldf' , SIZE = 4136960KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Mix4] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Mix4].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Mix4] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Mix4] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Mix4] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Mix4] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Mix4] SET ARITHABORT OFF 
GO
ALTER DATABASE [Mix4] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Mix4] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Mix4] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Mix4] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Mix4] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Mix4] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Mix4] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Mix4] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Mix4] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Mix4] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Mix4] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Mix4] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Mix4] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Mix4] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Mix4] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Mix4] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Mix4] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Mix4] SET RECOVERY FULL 
GO
ALTER DATABASE [Mix4] SET  MULTI_USER 
GO
ALTER DATABASE [Mix4] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Mix4] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Mix4] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Mix4] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Mix4] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Mix4] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Mix4', N'ON'
GO
ALTER DATABASE [Mix4] SET QUERY_STORE = ON
GO
ALTER DATABASE [Mix4] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Mix4]
GO
USE [Mix4]
GO
/****** Object:  Sequence [dbo].[Con_Regimen_IdRegimen_seq]    Script Date: 22/05/2025 15:48:47 ******/
CREATE SEQUENCE [dbo].[Con_Regimen_IdRegimen_seq] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
/****** Object:  Table [dbo].[Con_Cuenta]    Script Date: 22/05/2025 15:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Con_Cuenta](
	[IdCuenta] [int] IDENTITY(1,1) NOT NULL,
	[NombreCuenta] [nvarchar](50) NOT NULL,
	[IdEmpresa] [int] NULL,
	[CodigoCuenta] [nvarchar](255) NULL,
	[CuentaOdoo] [nvarchar](max) NULL,
	[AliasQB] [nvarchar](255) NULL,
	[Debaja] [datetime] NULL,
 CONSTRAINT [PK_Con_Cuenta] PRIMARY KEY CLUSTERED 
(
	[IdCuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Con_CuentaArea]    Script Date: 22/05/2025 15:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Con_CuentaArea](
	[IdCuentaArea] [int] IDENTITY(1,1) NOT NULL,
	[IdCuenta] [int] NULL,
	[IdArea] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCuentaArea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Con_Regimen]    Script Date: 22/05/2025 15:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Con_Regimen](
	[IdRegimen] [int] IDENTITY(1,1) NOT NULL,
	[NombreRegimen] [nvarchar](50) NOT NULL,
	[PorcentajeIVA] [float] NULL,
	[PorcentajeISR] [float] NULL,
	[Iva] [float] NULL,
	[Debaja] [datetime] NULL,
 CONSTRAINT [PK_Con_Regimen] PRIMARY KEY CLUSTERED 
(
	[IdRegimen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeFaceImages]    Script Date: 22/05/2025 15:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeFaceImages](
	[IdImagen] [int] IDENTITY(1,1) NOT NULL,
	[FaceDescriptor] [nvarchar](max) NULL,
	[IdColaborador] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdImagen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fin_Facturas]    Script Date: 22/05/2025 15:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fin_Facturas](
	[IdFactura] [nvarchar](100) NOT NULL,
	[XmlData] [nvarchar](max) NULL,
	[FechaFactura] [datetime2](7) NOT NULL,
	[FechaI] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gen_Cliente]    Script Date: 22/05/2025 15:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gen_Cliente](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[CodigoCliente] [nvarchar](20) NULL,
	[Nit] [nvarchar](20) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Direccion] [nvarchar](200) NULL,
	[Telefono] [nvarchar](20) NULL,
	[Correo] [nvarchar](100) NULL,
	[FechaCreacion] [datetime2](7) NULL,
	[DeBaja] [datetime] NULL,
	[IdTipoCliente] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gen_Empresa]    Script Date: 22/05/2025 15:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gen_Empresa](
	[IdEmpresa] [int] IDENTITY(1,1) NOT NULL,
	[Nit] [nvarchar](15) NOT NULL,
	[Nombre] [nvarchar](100) NULL,
	[NombreComercial] [nvarchar](250) NOT NULL,
	[Direccion] [nvarchar](100) NOT NULL,
	[Telefono1] [varchar](255) NULL,
	[Telefono2] [nvarchar](25) NULL,
	[FechaInicio] [datetime] NULL,
	[Logo] [nvarchar](max) NULL,
	[Debaja] [datetime] NULL,
	[AgenteRetenedor] [bit] NULL,
	[ActividadesLucrativas] [bit] NULL,
	[OpcionalSimplificado] [bit] NULL,
	[IdEmpresaOdoo] [int] NULL,
 CONSTRAINT [PK_Gen_Empresa] PRIMARY KEY CLUSTERED 
(
	[IdEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gen_EmpresaEntidad]    Script Date: 22/05/2025 15:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gen_EmpresaEntidad](
	[IdEmpresaEntidad] [int] IDENTITY(1,1) NOT NULL,
	[IdEmpresa] [int] NOT NULL,
	[IdEntidad] [int] NOT NULL,
	[DeBaja] [datetime] NULL,
	[FechaCreacion] [datetime2](0) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEmpresaEntidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gen_Entidad]    Script Date: 22/05/2025 15:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gen_Entidad](
	[IdEntidad] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [nvarchar](20) NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[FechaInicio] [datetime2](0) NULL,
	[DeBaja] [datetime] NULL,
	[IdEntidadPadre] [int] NULL,
	[IdTipoEntidad] [int] NOT NULL,
	[FechaCreacion] [datetime2](0) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEntidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gen_Proveedor]    Script Date: 22/05/2025 15:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gen_Proveedor](
	[IdProveedor] [int] IDENTITY(1,1) NOT NULL,
	[Nit] [nvarchar](25) NOT NULL,
	[NombreProveedor] [nvarchar](100) NOT NULL,
	[NombreComercial] [nvarchar](100) NULL,
	[Direccion] [nvarchar](100) NULL,
	[Telefono1] [nvarchar](25) NULL,
	[Telefono2] [nvarchar](25) NULL,
	[FechaInicio] [datetime] NULL,
	[Debaja] [datetime] NULL,
	[IdRegimen] [int] NULL,
	[CheckRegimen] [bit] NULL,
	[AgenteRetenedor] [bit] NULL,
	[IdOdooProveedor] [int] NULL,
	[CheckXelapan] [bit] NULL,
	[AliasQBNombre] [nvarchar](max) NULL,
 CONSTRAINT [PK_Gen_Proveedor] PRIMARY KEY CLUSTERED 
(
	[IdProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gen_Proyecto]    Script Date: 22/05/2025 15:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gen_Proyecto](
	[IdProyecto] [int] IDENTITY(1,1) NOT NULL,
	[NombreProyecto] [nvarchar](100) NOT NULL,
	[FechaI] [datetime] NOT NULL,
	[Debaja] [datetime] NULL,
 CONSTRAINT [PK_Gen_Proyecto] PRIMARY KEY CLUSTERED 
(
	[IdProyecto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gen_TipoCliente]    Script Date: 22/05/2025 15:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gen_TipoCliente](
	[IdTipoCliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[DeBaja] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTipoCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gen_TipoDocumento]    Script Date: 22/05/2025 15:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gen_TipoDocumento](
	[IdTipoDocumento] [int] IDENTITY(1,1) NOT NULL,
	[NombreDocumento] [nvarchar](50) NOT NULL,
	[Debaja] [datetime] NULL,
	[Codigo] [nvarchar](255) NULL,
 CONSTRAINT [PK_Gen_TipoDocumento] PRIMARY KEY CLUSTERED 
(
	[IdTipoDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gen_TipoEntidad]    Script Date: 22/05/2025 15:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gen_TipoEntidad](
	[IdTipoEntidad] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Descripcion] [nvarchar](250) NULL,
	[FechaCreacion] [datetime2](0) NULL,
	[DeBaja] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTipoEntidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Geo_Imagen]    Script Date: 22/05/2025 15:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Geo_Imagen](
	[IdImagen] [int] IDENTITY(1,1) NOT NULL,
	[Imagen] [nvarchar](max) NULL,
	[IdUbicacion] [int] NULL,
 CONSTRAINT [PK_Geo_Imagen] PRIMARY KEY CLUSTERED 
(
	[IdImagen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Geo_Tarea]    Script Date: 22/05/2025 15:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Geo_Tarea](
	[IdTarea] [int] IDENTITY(1,1) NOT NULL,
	[NombreTarea] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Geo_Tarea] PRIMARY KEY CLUSTERED 
(
	[IdTarea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Geo_Ubicacion]    Script Date: 22/05/2025 15:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Geo_Ubicacion](
	[IdUbicacion] [int] IDENTITY(1,1) NOT NULL,
	[Latitud] [float] NOT NULL,
	[Longitud] [float] NOT NULL,
	[LatitudFinal] [float] NULL,
	[LongitudFinal] [float] NULL,
	[HoraInicio] [datetime] NOT NULL,
	[HoraFin] [datetime] NULL,
	[ObservacionTarea] [varchar](255) NULL,
	[EstadoTarea] [bit] NOT NULL,
	[IdTarea] [int] NULL,
	[IdUsuario] [int] NULL,
 CONSTRAINT [PK_Geo_Ubicacion] PRIMARY KEY CLUSTERED 
(
	[IdUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gth_Area]    Script Date: 22/05/2025 15:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gth_Area](
	[IdArea] [int] IDENTITY(1,1) NOT NULL,
	[NombreArea] [nvarchar](100) NOT NULL,
	[IdEmpresa] [int] NULL,
	[Debaja] [datetime] NULL,
	[CustomerQbPadre] [nvarchar](max) NULL,
 CONSTRAINT [PK_Gth_Area] PRIMARY KEY CLUSTERED 
(
	[IdArea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gth_Colaborador]    Script Date: 22/05/2025 15:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gth_Colaborador](
	[IdColaborador] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [nvarchar](100) NOT NULL,
	[Apellidos] [nvarchar](100) NOT NULL,
	[Telefono1] [nvarchar](25) NULL,
	[Telefono2] [nvarchar](25) NULL,
	[Direccion] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Debaja] [datetime] NULL,
	[IdEmpresa] [int] NULL,
	[CodigoColaborador] [int] NULL,
	[DPI] [nvarchar](max) NULL,
	[IdModulos] [int] NULL,
	[Area] [nvarchar](max) NULL,
 CONSTRAINT [PK_Gth_Colaborador] PRIMARY KEY CLUSTERED 
(
	[IdColaborador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MarcajeGuardiania]    Script Date: 22/05/2025 15:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MarcajeGuardiania](
	[IdMarcaje] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[NombreEmpleado] [nvarchar](255) NOT NULL,
	[CodigoEmpleado] [int] NOT NULL,
	[FechaHora] [datetime] NOT NULL,
	[Movimiento] [bit] NOT NULL,
	[Area] [nvarchar](255) NOT NULL,
	[Departamento] [nvarchar](255) NOT NULL,
	[Observaciones] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMarcaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Opg_Articulos]    Script Date: 22/05/2025 15:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Opg_Articulos](
	[IdArticulos] [int] IDENTITY(1,1) NOT NULL,
	[NombreArticulo] [nvarchar](250) NOT NULL,
	[IdOdooArticulo] [int] NOT NULL,
	[Debaja] [datetime] NULL,
	[IdEmpresa] [int] NULL,
	[IdEmpresaOdoo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdArticulos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Opg_Estado]    Script Date: 22/05/2025 15:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Opg_Estado](
	[IdEstado] [int] IDENTITY(1,1) NOT NULL,
	[NombreEstado] [nvarchar](100) NOT NULL,
	[DescripcionEstado] [nvarchar](255) NULL,
	[Debaja] [datetime] NULL,
 CONSTRAINT [PK_Opg_Estado] PRIMARY KEY CLUSTERED 
(
	[IdEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Opg_OrdenPago]    Script Date: 22/05/2025 15:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Opg_OrdenPago](
	[IdOrdenPago] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NULL,
	[Total] [float] NULL,
	[Observaciones] [text] NULL,
	[FechaI] [datetime] NULL,
	[FechaU] [datetime] NULL,
	[ExpoQB] [datetime] NULL,
	[Debaja] [datetime] NULL,
	[FechaPago] [datetime] NULL,
	[ExpoOdoo] [datetime] NULL,
	[IvaRetenido] [float] NULL,
	[TotalPagar] [float] NULL,
	[RetencionIsr] [float] NULL,
	[IdEstado] [int] NULL,
	[IdTipoOrden] [int] NULL,
	[IdUsuarioIngreso] [int] NULL,
	[IdUsuarioAutorizo] [int] NULL,
	[IdUsuarioPago] [int] NULL,
	[IdPrioridad] [int] NULL,
	[IdProveedor] [int] NULL,
	[IdEmpresa] [int] NULL,
	[IdLiquidacion] [int] NULL,
	[IdRegimen] [int] NULL,
	[IdModulos] [int] NULL,
	[UsuarioPago] [nvarchar](255) NULL,
	[CuentaXelapan] [bit] NULL,
	[FechaAutorizacion] [datetime] NULL,
 CONSTRAINT [PK_Opg_OrdenPago] PRIMARY KEY CLUSTERED 
(
	[IdOrdenPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Opg_OrdenPagoFactura]    Script Date: 22/05/2025 15:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Opg_OrdenPagoFactura](
	[IdOrdenPagoFactura] [int] IDENTITY(1,1) NOT NULL,
	[FechaDocumento] [datetime] NOT NULL,
	[Serie] [nvarchar](30) NULL,
	[Numero] [nvarchar](30) NULL,
	[Descripcion] [text] NULL,
	[Descuento] [float] NULL,
	[IdProveedor] [int] NULL,
	[IdTipoDocumento] [int] NULL,
	[IdOrdenPago] [int] NULL,
	[Idp] [float] NULL,
	[Expo] [datetime] NULL,
	[Iva] [float] NULL,
	[RetencionIsr] [float] NULL,
	[IvaRetenido] [float] NULL,
	[TotalOrden] [float] NULL,
	[TotalApagar] [float] NULL,
	[IdRegimen] [int] NULL,
	[TimbrePrensa] [float] NULL,
	[Galones] [float] NULL,
	[Neto] [float] NULL,
	[FacturaEspecial] [float] NULL,
	[Debaja] [datetime] NULL,
	[FirmaFel] [varchar](50) NULL,
	[FirmaFelAnulacion] [varchar](50) NULL,
 CONSTRAINT [PK_Opg_OrdenPagoFactura] PRIMARY KEY CLUSTERED 
(
	[IdOrdenPagoFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Opg_OrdenPagoFacturaDetalle]    Script Date: 22/05/2025 15:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Opg_OrdenPagoFacturaDetalle](
	[IdOrdenPagonFacturaDetalle] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [text] NULL,
	[Cantidad] [float] NULL,
	[Precio] [float] NULL,
	[Monto] [float] NULL,
	[IdTipoArticulo] [int] NULL,
	[IdArea] [int] NULL,
	[IdCuenta] [int] NULL,
	[IdOrdenPagoFactura] [int] NULL,
	[IdProyecto] [int] NULL,
	[IdArticulos] [int] NULL,
	[MontoFacturaEspecial] [float] NULL,
 CONSTRAINT [PK_Opg_OrdenPagoFacturaDetalle] PRIMARY KEY CLUSTERED 
(
	[IdOrdenPagonFacturaDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Opg_Prioridad]    Script Date: 22/05/2025 15:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Opg_Prioridad](
	[IdPrioridad] [int] IDENTITY(1,1) NOT NULL,
	[NombrePrioridad] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Opg_Prioridad] PRIMARY KEY CLUSTERED 
(
	[IdPrioridad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Opg_TipoArticulo]    Script Date: 22/05/2025 15:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Opg_TipoArticulo](
	[IdTipoArticulo] [int] IDENTITY(1,1) NOT NULL,
	[NombreTipoArticulo] [nvarchar](100) NOT NULL,
	[Debaja] [datetime] NULL,
 CONSTRAINT [PK_Opg_TipoArticulo] PRIMARY KEY CLUSTERED 
(
	[IdTipoArticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Opg_TipoOrden]    Script Date: 22/05/2025 15:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Opg_TipoOrden](
	[IdTipoOrden] [int] IDENTITY(1,1) NOT NULL,
	[NombreTipoOrden] [nvarchar](50) NOT NULL,
	[DescripcionTipoOrden] [nvarchar](100) NULL,
	[Debaja] [datetime] NULL,
 CONSTRAINT [PK_Opg_TipoOrden] PRIMARY KEY CLUSTERED 
(
	[IdTipoOrden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rrhh_MarcajeDetalle]    Script Date: 22/05/2025 15:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rrhh_MarcajeDetalle](
	[IdMarcajeDetalle] [int] IDENTITY(1,1) NOT NULL,
	[IdMarcaje] [int] NOT NULL,
	[FechaMarcajeHora] [datetime] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Observaciones] [nvarchar](max) NULL,
	[TipoMarcaje] [nvarchar](max) NULL,
	[LugarMarcaje] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMarcajeDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rrhh_MarcajeEncabezado]    Script Date: 22/05/2025 15:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rrhh_MarcajeEncabezado](
	[IdMarcaje] [int] IDENTITY(1,1) NOT NULL,
	[IdColaborador] [int] NOT NULL,
	[FechaJornada] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMarcaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_BitacoraUsuario]    Script Date: 22/05/2025 15:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_BitacoraUsuario](
	[IdBitacoraUser] [int] IDENTITY(1,1) NOT NULL,
	[AccionBitacora] [varchar](100) NOT NULL,
	[FechaBitacora] [datetime] NOT NULL,
	[IdUsuario] [int] NULL,
 CONSTRAINT [PK_User_BitacoraUsuario] PRIMARY KEY CLUSTERED 
(
	[IdBitacoraUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_DepartamentoUsuarios]    Script Date: 22/05/2025 15:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_DepartamentoUsuarios](
	[IdDepartamentoUsuario] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[IdModulos] [int] NOT NULL,
	[Debaja] [datetime] NULL,
	[Predeterminado] [bit] NULL,
 CONSTRAINT [PK_User_DepartamentoUsuarios] PRIMARY KEY CLUSTERED 
(
	[IdDepartamentoUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Estado]    Script Date: 22/05/2025 15:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Estado](
	[IdEstado] [int] IDENTITY(1,1) NOT NULL,
	[NombreEstado] [varchar](55) NOT NULL,
	[Descripcion] [varchar](255) NULL,
 CONSTRAINT [PK_User_Estado] PRIMARY KEY CLUSTERED 
(
	[IdEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Modulos]    Script Date: 22/05/2025 15:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Modulos](
	[IdModulos] [int] IDENTITY(1,1) NOT NULL,
	[NombreModulo] [varchar](55) NOT NULL,
	[DescripcionModulo] [varchar](100) NULL,
	[AbreviacionModulo] [varchar](20) NULL,
 CONSTRAINT [PK_User_Modulos] PRIMARY KEY CLUSTERED 
(
	[IdModulos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_ModulosPermisos]    Script Date: 22/05/2025 15:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_ModulosPermisos](
	[IdPermisosModulos] [int] IDENTITY(1,1) NOT NULL,
	[IdPermiso] [int] NOT NULL,
	[IdModulos] [int] NOT NULL,
 CONSTRAINT [PK_User_ModulosPermisos] PRIMARY KEY CLUSTERED 
(
	[IdPermisosModulos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_ModulosRoles]    Script Date: 22/05/2025 15:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_ModulosRoles](
	[IdModulosRoles] [int] IDENTITY(1,1) NOT NULL,
	[IdRole] [int] NOT NULL,
	[IdModulos] [int] NOT NULL,
 CONSTRAINT [PK_User_ModulosRoles] PRIMARY KEY CLUSTERED 
(
	[IdModulosRoles] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Permisos]    Script Date: 22/05/2025 15:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Permisos](
	[IdPermiso] [int] IDENTITY(1,1) NOT NULL,
	[NombrePermiso] [varchar](55) NOT NULL,
	[DescripcionPermiso] [varchar](55) NULL,
 CONSTRAINT [PK_User_Permisos] PRIMARY KEY CLUSTERED 
(
	[IdPermiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_ResetPassword]    Script Date: 22/05/2025 15:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_ResetPassword](
	[IdToken] [int] IDENTITY(1,1) NOT NULL,
	[NombreToken] [varchar](255) NOT NULL,
	[FechaCreacionToken] [datetime] NOT NULL,
	[FechaExpiracionToken] [datetime] NOT NULL,
	[IdUsuario] [int] NULL,
 CONSTRAINT [PK_User_ResetPassword] PRIMARY KEY CLUSTERED 
(
	[IdToken] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Roles]    Script Date: 22/05/2025 15:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Roles](
	[IdRole] [int] IDENTITY(1,1) NOT NULL,
	[NombreRol] [varchar](55) NOT NULL,
	[DescripcionRol] [varchar](100) NULL,
	[Debaja] [datetime] NULL,
 CONSTRAINT [PK_User_Roles] PRIMARY KEY CLUSTERED 
(
	[IdRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_RolesPermisos]    Script Date: 22/05/2025 15:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_RolesPermisos](
	[IdRolePermiso] [int] IDENTITY(1,1) NOT NULL,
	[IdRole] [int] NOT NULL,
	[IdPermiso] [int] NOT NULL,
 CONSTRAINT [PK_User_RolesPermisos] PRIMARY KEY CLUSTERED 
(
	[IdRolePermiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_User]    Script Date: 22/05/2025 15:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_User](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[NombreUsuario] [varchar](55) NOT NULL,
	[Password] [varchar](55) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[IdEstado] [int] NULL,
	[IdColaborador] [int] NULL,
 CONSTRAINT [PK_User_User] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_UserRoles]    Script Date: 22/05/2025 15:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_UserRoles](
	[IdUserRoles] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[IdRole] [int] NOT NULL,
	[FechaAsignacion] [datetime] NOT NULL,
 CONSTRAINT [PK_User_UserRoles] PRIMARY KEY CLUSTERED 
(
	[IdUserRoles] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vts_UnidadNegocio]    Script Date: 22/05/2025 15:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vts_UnidadNegocio](
	[IdUnidadNegocio] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NULL,
	[NombreComercial] [nvarchar](100) NULL,
	[NumeroEstablecimiento] [nvarchar](20) NULL,
	[Departamento] [nvarchar](50) NULL,
	[Municipio] [nvarchar](50) NULL,
	[NombreEmisor] [nvarchar](100) NULL,
	[OrdenEntidad] [int] NULL,
	[FechaCreacion] [datetime2](0) NULL,
	[FechaUltimaActualizacion] [datetime] NULL,
	[DeBaja] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUnidadNegocio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vts_UnidadNegocioEntidad]    Script Date: 22/05/2025 15:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vts_UnidadNegocioEntidad](
	[IdUnidadNegocioEntidad] [int] IDENTITY(1,1) NOT NULL,
	[IdUnidadNegocio] [int] NOT NULL,
	[IdEntidad] [int] NOT NULL,
	[DeBaja] [datetime] NULL,
	[FechaCreacion] [datetime2](0) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUnidadNegocioEntidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_Relationship46]    Script Date: 22/05/2025 15:48:47 ******/
CREATE NONCLUSTERED INDEX [IX_Relationship46] ON [dbo].[Gen_Proveedor]
(
	[IdRegimen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Relationship20]    Script Date: 22/05/2025 15:48:47 ******/
CREATE NONCLUSTERED INDEX [IX_Relationship20] ON [dbo].[Geo_Imagen]
(
	[IdUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Relationship14]    Script Date: 22/05/2025 15:48:47 ******/
CREATE NONCLUSTERED INDEX [IX_Relationship14] ON [dbo].[Geo_Ubicacion]
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Relationship19]    Script Date: 22/05/2025 15:48:47 ******/
CREATE NONCLUSTERED INDEX [IX_Relationship19] ON [dbo].[Geo_Ubicacion]
(
	[IdTarea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Relationship33]    Script Date: 22/05/2025 15:48:47 ******/
CREATE NONCLUSTERED INDEX [IX_Relationship33] ON [dbo].[Gth_Colaborador]
(
	[IdEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Relationship21]    Script Date: 22/05/2025 15:48:47 ******/
CREATE NONCLUSTERED INDEX [IX_Relationship21] ON [dbo].[Opg_OrdenPago]
(
	[IdEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Relationship22]    Script Date: 22/05/2025 15:48:47 ******/
CREATE NONCLUSTERED INDEX [IX_Relationship22] ON [dbo].[Opg_OrdenPago]
(
	[IdTipoOrden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Relationship27]    Script Date: 22/05/2025 15:48:47 ******/
CREATE NONCLUSTERED INDEX [IX_Relationship27] ON [dbo].[Opg_OrdenPago]
(
	[IdUsuarioIngreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Relationship28]    Script Date: 22/05/2025 15:48:47 ******/
CREATE NONCLUSTERED INDEX [IX_Relationship28] ON [dbo].[Opg_OrdenPago]
(
	[IdUsuarioAutorizo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Relationship29]    Script Date: 22/05/2025 15:48:47 ******/
CREATE NONCLUSTERED INDEX [IX_Relationship29] ON [dbo].[Opg_OrdenPago]
(
	[IdUsuarioPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Relationship30]    Script Date: 22/05/2025 15:48:47 ******/
CREATE NONCLUSTERED INDEX [IX_Relationship30] ON [dbo].[Opg_OrdenPago]
(
	[IdPrioridad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Relationship47]    Script Date: 22/05/2025 15:48:47 ******/
CREATE NONCLUSTERED INDEX [IX_Relationship47] ON [dbo].[Opg_OrdenPago]
(
	[IdProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Relationship48]    Script Date: 22/05/2025 15:48:47 ******/
CREATE NONCLUSTERED INDEX [IX_Relationship48] ON [dbo].[Opg_OrdenPago]
(
	[IdEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Relationship36]    Script Date: 22/05/2025 15:48:47 ******/
CREATE NONCLUSTERED INDEX [IX_Relationship36] ON [dbo].[Opg_OrdenPagoFactura]
(
	[IdProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Relationship37]    Script Date: 22/05/2025 15:48:47 ******/
CREATE NONCLUSTERED INDEX [IX_Relationship37] ON [dbo].[Opg_OrdenPagoFactura]
(
	[IdTipoDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Relationship43]    Script Date: 22/05/2025 15:48:47 ******/
CREATE NONCLUSTERED INDEX [IX_Relationship43] ON [dbo].[Opg_OrdenPagoFactura]
(
	[IdOrdenPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Relationship39]    Script Date: 22/05/2025 15:48:47 ******/
CREATE NONCLUSTERED INDEX [IX_Relationship39] ON [dbo].[Opg_OrdenPagoFacturaDetalle]
(
	[IdTipoArticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Relationship41]    Script Date: 22/05/2025 15:48:47 ******/
CREATE NONCLUSTERED INDEX [IX_Relationship41] ON [dbo].[Opg_OrdenPagoFacturaDetalle]
(
	[IdArea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Relationship42]    Script Date: 22/05/2025 15:48:47 ******/
CREATE NONCLUSTERED INDEX [IX_Relationship42] ON [dbo].[Opg_OrdenPagoFacturaDetalle]
(
	[IdCuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Relationship44]    Script Date: 22/05/2025 15:48:47 ******/
CREATE NONCLUSTERED INDEX [IX_Relationship44] ON [dbo].[Opg_OrdenPagoFacturaDetalle]
(
	[IdOrdenPagoFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Relationship3]    Script Date: 22/05/2025 15:48:47 ******/
CREATE NONCLUSTERED INDEX [IX_Relationship3] ON [dbo].[User_BitacoraUsuario]
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Relationship49]    Script Date: 22/05/2025 15:48:47 ******/
CREATE NONCLUSTERED INDEX [IX_Relationship49] ON [dbo].[User_DepartamentoUsuarios]
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Relationship50]    Script Date: 22/05/2025 15:48:47 ******/
CREATE NONCLUSTERED INDEX [IX_Relationship50] ON [dbo].[User_DepartamentoUsuarios]
(
	[IdModulos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Relationship15]    Script Date: 22/05/2025 15:48:47 ******/
CREATE NONCLUSTERED INDEX [IX_Relationship15] ON [dbo].[User_ModulosPermisos]
(
	[IdPermiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Relationship16]    Script Date: 22/05/2025 15:48:47 ******/
CREATE NONCLUSTERED INDEX [IX_Relationship16] ON [dbo].[User_ModulosPermisos]
(
	[IdModulos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Relationship17]    Script Date: 22/05/2025 15:48:47 ******/
CREATE NONCLUSTERED INDEX [IX_Relationship17] ON [dbo].[User_ModulosRoles]
(
	[IdRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Relationship18]    Script Date: 22/05/2025 15:48:47 ******/
CREATE NONCLUSTERED INDEX [IX_Relationship18] ON [dbo].[User_ModulosRoles]
(
	[IdModulos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Relationship2]    Script Date: 22/05/2025 15:48:47 ******/
CREATE NONCLUSTERED INDEX [IX_Relationship2] ON [dbo].[User_ResetPassword]
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Relationship4]    Script Date: 22/05/2025 15:48:47 ******/
CREATE NONCLUSTERED INDEX [IX_Relationship4] ON [dbo].[User_RolesPermisos]
(
	[IdRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Relationship5]    Script Date: 22/05/2025 15:48:47 ******/
CREATE NONCLUSTERED INDEX [IX_Relationship5] ON [dbo].[User_RolesPermisos]
(
	[IdPermiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Relationship1]    Script Date: 22/05/2025 15:48:47 ******/
CREATE NONCLUSTERED INDEX [IX_Relationship1] ON [dbo].[User_User]
(
	[IdEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Relationship7]    Script Date: 22/05/2025 15:48:47 ******/
CREATE NONCLUSTERED INDEX [IX_Relationship7] ON [dbo].[User_UserRoles]
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Relationship8]    Script Date: 22/05/2025 15:48:47 ******/
CREATE NONCLUSTERED INDEX [IX_Relationship8] ON [dbo].[User_UserRoles]
(
	[IdRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Fin_Facturas] ADD  DEFAULT (getdate()) FOR [FechaI]
GO
ALTER TABLE [dbo].[Gen_Cliente] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Gen_EmpresaEntidad] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Gen_Entidad] ADD  DEFAULT (getdate()) FOR [FechaInicio]
GO
ALTER TABLE [dbo].[Gen_Entidad] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Gen_Proveedor] ADD  DEFAULT ((0)) FOR [CheckRegimen]
GO
ALTER TABLE [dbo].[Gen_Proveedor] ADD  DEFAULT ((0)) FOR [AgenteRetenedor]
GO
ALTER TABLE [dbo].[Gen_TipoEntidad] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Vts_UnidadNegocio] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Vts_UnidadNegocioEntidad] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Con_Cuenta]  WITH CHECK ADD  CONSTRAINT [FK_Con_Cuenta_Gen_Empresa] FOREIGN KEY([IdEmpresa])
REFERENCES [dbo].[Gen_Empresa] ([IdEmpresa])
GO
ALTER TABLE [dbo].[Con_Cuenta] CHECK CONSTRAINT [FK_Con_Cuenta_Gen_Empresa]
GO
ALTER TABLE [dbo].[Con_CuentaArea]  WITH CHECK ADD  CONSTRAINT [FK_Con_CuentaArea_Area] FOREIGN KEY([IdArea])
REFERENCES [dbo].[Gth_Area] ([IdArea])
GO
ALTER TABLE [dbo].[Con_CuentaArea] CHECK CONSTRAINT [FK_Con_CuentaArea_Area]
GO
ALTER TABLE [dbo].[Con_CuentaArea]  WITH CHECK ADD  CONSTRAINT [FK_Con_CuentaArea_Cuenta] FOREIGN KEY([IdCuenta])
REFERENCES [dbo].[Con_Cuenta] ([IdCuenta])
GO
ALTER TABLE [dbo].[Con_CuentaArea] CHECK CONSTRAINT [FK_Con_CuentaArea_Cuenta]
GO
ALTER TABLE [dbo].[EmployeeFaceImages]  WITH CHECK ADD FOREIGN KEY([IdColaborador])
REFERENCES [dbo].[Gth_Colaborador] ([IdColaborador])
GO
ALTER TABLE [dbo].[Gen_Cliente]  WITH CHECK ADD FOREIGN KEY([IdTipoCliente])
REFERENCES [dbo].[Gen_TipoCliente] ([IdTipoCliente])
GO
ALTER TABLE [dbo].[Gen_EmpresaEntidad]  WITH CHECK ADD  CONSTRAINT [FK_Empresa] FOREIGN KEY([IdEmpresa])
REFERENCES [dbo].[Gen_Empresa] ([IdEmpresa])
GO
ALTER TABLE [dbo].[Gen_EmpresaEntidad] CHECK CONSTRAINT [FK_Empresa]
GO
ALTER TABLE [dbo].[Gen_EmpresaEntidad]  WITH CHECK ADD  CONSTRAINT [FK_EmpresaEntidad_Entidad] FOREIGN KEY([IdEntidad])
REFERENCES [dbo].[Gen_Entidad] ([IdEntidad])
GO
ALTER TABLE [dbo].[Gen_EmpresaEntidad] CHECK CONSTRAINT [FK_EmpresaEntidad_Entidad]
GO
ALTER TABLE [dbo].[Gen_Entidad]  WITH CHECK ADD FOREIGN KEY([IdEntidadPadre])
REFERENCES [dbo].[Gen_Entidad] ([IdEntidad])
GO
ALTER TABLE [dbo].[Gen_Entidad]  WITH CHECK ADD FOREIGN KEY([IdTipoEntidad])
REFERENCES [dbo].[Gen_TipoEntidad] ([IdTipoEntidad])
GO
ALTER TABLE [dbo].[Gen_Proveedor]  WITH CHECK ADD  CONSTRAINT [Relationship46] FOREIGN KEY([IdRegimen])
REFERENCES [dbo].[Con_Regimen] ([IdRegimen])
GO
ALTER TABLE [dbo].[Gen_Proveedor] CHECK CONSTRAINT [Relationship46]
GO
ALTER TABLE [dbo].[Geo_Imagen]  WITH CHECK ADD  CONSTRAINT [Relationship20] FOREIGN KEY([IdUbicacion])
REFERENCES [dbo].[Geo_Ubicacion] ([IdUbicacion])
GO
ALTER TABLE [dbo].[Geo_Imagen] CHECK CONSTRAINT [Relationship20]
GO
ALTER TABLE [dbo].[Geo_Ubicacion]  WITH CHECK ADD  CONSTRAINT [Relationship14] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[User_User] ([IdUsuario])
GO
ALTER TABLE [dbo].[Geo_Ubicacion] CHECK CONSTRAINT [Relationship14]
GO
ALTER TABLE [dbo].[Geo_Ubicacion]  WITH CHECK ADD  CONSTRAINT [Relationship19] FOREIGN KEY([IdTarea])
REFERENCES [dbo].[Geo_Tarea] ([IdTarea])
GO
ALTER TABLE [dbo].[Geo_Ubicacion] CHECK CONSTRAINT [Relationship19]
GO
ALTER TABLE [dbo].[Gth_Area]  WITH CHECK ADD  CONSTRAINT [FK_Gth_Area_Gen_Empresa] FOREIGN KEY([IdEmpresa])
REFERENCES [dbo].[Gen_Empresa] ([IdEmpresa])
GO
ALTER TABLE [dbo].[Gth_Area] CHECK CONSTRAINT [FK_Gth_Area_Gen_Empresa]
GO
ALTER TABLE [dbo].[Gth_Colaborador]  WITH CHECK ADD  CONSTRAINT [FK_GthColaborador_UserModulos] FOREIGN KEY([IdModulos])
REFERENCES [dbo].[User_Modulos] ([IdModulos])
GO
ALTER TABLE [dbo].[Gth_Colaborador] CHECK CONSTRAINT [FK_GthColaborador_UserModulos]
GO
ALTER TABLE [dbo].[Gth_Colaborador]  WITH CHECK ADD  CONSTRAINT [Relationship33] FOREIGN KEY([IdEmpresa])
REFERENCES [dbo].[Gen_Empresa] ([IdEmpresa])
GO
ALTER TABLE [dbo].[Gth_Colaborador] CHECK CONSTRAINT [Relationship33]
GO
ALTER TABLE [dbo].[MarcajeGuardiania]  WITH CHECK ADD  CONSTRAINT [FK_MarcajeGuardiania_User_user] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[User_User] ([IdUsuario])
GO
ALTER TABLE [dbo].[MarcajeGuardiania] CHECK CONSTRAINT [FK_MarcajeGuardiania_User_user]
GO
ALTER TABLE [dbo].[Opg_Articulos]  WITH CHECK ADD  CONSTRAINT [FK_Opg_Articulos_Gen_Empresa] FOREIGN KEY([IdEmpresa])
REFERENCES [dbo].[Gen_Empresa] ([IdEmpresa])
GO
ALTER TABLE [dbo].[Opg_Articulos] CHECK CONSTRAINT [FK_Opg_Articulos_Gen_Empresa]
GO
ALTER TABLE [dbo].[Opg_OrdenPago]  WITH CHECK ADD  CONSTRAINT [FK_Opg_OrdenPago_IdLiquidacion] FOREIGN KEY([IdLiquidacion])
REFERENCES [dbo].[Opg_OrdenPago] ([IdOrdenPago])
GO
ALTER TABLE [dbo].[Opg_OrdenPago] CHECK CONSTRAINT [FK_Opg_OrdenPago_IdLiquidacion]
GO
ALTER TABLE [dbo].[Opg_OrdenPago]  WITH CHECK ADD  CONSTRAINT [FK_Opg_OrdenPago_IdModulos] FOREIGN KEY([IdModulos])
REFERENCES [dbo].[User_Modulos] ([IdModulos])
GO
ALTER TABLE [dbo].[Opg_OrdenPago] CHECK CONSTRAINT [FK_Opg_OrdenPago_IdModulos]
GO
ALTER TABLE [dbo].[Opg_OrdenPago]  WITH CHECK ADD  CONSTRAINT [FK_Opg_OrdenPago_IdRegimen] FOREIGN KEY([IdRegimen])
REFERENCES [dbo].[Con_Regimen] ([IdRegimen])
GO
ALTER TABLE [dbo].[Opg_OrdenPago] CHECK CONSTRAINT [FK_Opg_OrdenPago_IdRegimen]
GO
ALTER TABLE [dbo].[Opg_OrdenPago]  WITH CHECK ADD  CONSTRAINT [Relationship21] FOREIGN KEY([IdEstado])
REFERENCES [dbo].[Opg_Estado] ([IdEstado])
GO
ALTER TABLE [dbo].[Opg_OrdenPago] CHECK CONSTRAINT [Relationship21]
GO
ALTER TABLE [dbo].[Opg_OrdenPago]  WITH CHECK ADD  CONSTRAINT [Relationship22] FOREIGN KEY([IdTipoOrden])
REFERENCES [dbo].[Opg_TipoOrden] ([IdTipoOrden])
GO
ALTER TABLE [dbo].[Opg_OrdenPago] CHECK CONSTRAINT [Relationship22]
GO
ALTER TABLE [dbo].[Opg_OrdenPago]  WITH CHECK ADD  CONSTRAINT [Relationship27] FOREIGN KEY([IdUsuarioIngreso])
REFERENCES [dbo].[User_User] ([IdUsuario])
GO
ALTER TABLE [dbo].[Opg_OrdenPago] CHECK CONSTRAINT [Relationship27]
GO
ALTER TABLE [dbo].[Opg_OrdenPago]  WITH CHECK ADD  CONSTRAINT [Relationship28] FOREIGN KEY([IdUsuarioAutorizo])
REFERENCES [dbo].[User_User] ([IdUsuario])
GO
ALTER TABLE [dbo].[Opg_OrdenPago] CHECK CONSTRAINT [Relationship28]
GO
ALTER TABLE [dbo].[Opg_OrdenPago]  WITH CHECK ADD  CONSTRAINT [Relationship29] FOREIGN KEY([IdUsuarioPago])
REFERENCES [dbo].[User_User] ([IdUsuario])
GO
ALTER TABLE [dbo].[Opg_OrdenPago] CHECK CONSTRAINT [Relationship29]
GO
ALTER TABLE [dbo].[Opg_OrdenPago]  WITH CHECK ADD  CONSTRAINT [Relationship30] FOREIGN KEY([IdPrioridad])
REFERENCES [dbo].[Opg_Prioridad] ([IdPrioridad])
GO
ALTER TABLE [dbo].[Opg_OrdenPago] CHECK CONSTRAINT [Relationship30]
GO
ALTER TABLE [dbo].[Opg_OrdenPago]  WITH CHECK ADD  CONSTRAINT [Relationship47] FOREIGN KEY([IdProveedor])
REFERENCES [dbo].[Gen_Proveedor] ([IdProveedor])
GO
ALTER TABLE [dbo].[Opg_OrdenPago] CHECK CONSTRAINT [Relationship47]
GO
ALTER TABLE [dbo].[Opg_OrdenPago]  WITH CHECK ADD  CONSTRAINT [Relationship48] FOREIGN KEY([IdEmpresa])
REFERENCES [dbo].[Gen_Empresa] ([IdEmpresa])
GO
ALTER TABLE [dbo].[Opg_OrdenPago] CHECK CONSTRAINT [Relationship48]
GO
ALTER TABLE [dbo].[Opg_OrdenPagoFactura]  WITH CHECK ADD  CONSTRAINT [FK_Opg_OrdenPagoFactura_Con_Regimen] FOREIGN KEY([IdRegimen])
REFERENCES [dbo].[Con_Regimen] ([IdRegimen])
GO
ALTER TABLE [dbo].[Opg_OrdenPagoFactura] CHECK CONSTRAINT [FK_Opg_OrdenPagoFactura_Con_Regimen]
GO
ALTER TABLE [dbo].[Opg_OrdenPagoFactura]  WITH CHECK ADD  CONSTRAINT [Relationship36] FOREIGN KEY([IdProveedor])
REFERENCES [dbo].[Gen_Proveedor] ([IdProveedor])
GO
ALTER TABLE [dbo].[Opg_OrdenPagoFactura] CHECK CONSTRAINT [Relationship36]
GO
ALTER TABLE [dbo].[Opg_OrdenPagoFactura]  WITH CHECK ADD  CONSTRAINT [Relationship37] FOREIGN KEY([IdTipoDocumento])
REFERENCES [dbo].[Gen_TipoDocumento] ([IdTipoDocumento])
GO
ALTER TABLE [dbo].[Opg_OrdenPagoFactura] CHECK CONSTRAINT [Relationship37]
GO
ALTER TABLE [dbo].[Opg_OrdenPagoFactura]  WITH CHECK ADD  CONSTRAINT [Relationship43] FOREIGN KEY([IdOrdenPago])
REFERENCES [dbo].[Opg_OrdenPago] ([IdOrdenPago])
GO
ALTER TABLE [dbo].[Opg_OrdenPagoFactura] CHECK CONSTRAINT [Relationship43]
GO
ALTER TABLE [dbo].[Opg_OrdenPagoFacturaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_Opg_OrdenPagoFacturaDetalle_Gen_Proyecto] FOREIGN KEY([IdProyecto])
REFERENCES [dbo].[Gen_Proyecto] ([IdProyecto])
GO
ALTER TABLE [dbo].[Opg_OrdenPagoFacturaDetalle] CHECK CONSTRAINT [FK_Opg_OrdenPagoFacturaDetalle_Gen_Proyecto]
GO
ALTER TABLE [dbo].[Opg_OrdenPagoFacturaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_Opg_OrdenPagoFacturaDetalle_IdArticulos] FOREIGN KEY([IdArticulos])
REFERENCES [dbo].[Opg_Articulos] ([IdArticulos])
GO
ALTER TABLE [dbo].[Opg_OrdenPagoFacturaDetalle] CHECK CONSTRAINT [FK_Opg_OrdenPagoFacturaDetalle_IdArticulos]
GO
ALTER TABLE [dbo].[Opg_OrdenPagoFacturaDetalle]  WITH CHECK ADD  CONSTRAINT [Relationship39] FOREIGN KEY([IdTipoArticulo])
REFERENCES [dbo].[Opg_TipoArticulo] ([IdTipoArticulo])
GO
ALTER TABLE [dbo].[Opg_OrdenPagoFacturaDetalle] CHECK CONSTRAINT [Relationship39]
GO
ALTER TABLE [dbo].[Opg_OrdenPagoFacturaDetalle]  WITH CHECK ADD  CONSTRAINT [Relationship41] FOREIGN KEY([IdArea])
REFERENCES [dbo].[Gth_Area] ([IdArea])
GO
ALTER TABLE [dbo].[Opg_OrdenPagoFacturaDetalle] CHECK CONSTRAINT [Relationship41]
GO
ALTER TABLE [dbo].[Opg_OrdenPagoFacturaDetalle]  WITH CHECK ADD  CONSTRAINT [Relationship42] FOREIGN KEY([IdCuenta])
REFERENCES [dbo].[Con_Cuenta] ([IdCuenta])
GO
ALTER TABLE [dbo].[Opg_OrdenPagoFacturaDetalle] CHECK CONSTRAINT [Relationship42]
GO
ALTER TABLE [dbo].[Opg_OrdenPagoFacturaDetalle]  WITH CHECK ADD  CONSTRAINT [Relationship44] FOREIGN KEY([IdOrdenPagoFactura])
REFERENCES [dbo].[Opg_OrdenPagoFactura] ([IdOrdenPagoFactura])
GO
ALTER TABLE [dbo].[Opg_OrdenPagoFacturaDetalle] CHECK CONSTRAINT [Relationship44]
GO
ALTER TABLE [dbo].[Rrhh_MarcajeDetalle]  WITH CHECK ADD FOREIGN KEY([IdMarcaje])
REFERENCES [dbo].[Rrhh_MarcajeEncabezado] ([IdMarcaje])
GO
ALTER TABLE [dbo].[Rrhh_MarcajeDetalle]  WITH CHECK ADD FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[User_User] ([IdUsuario])
GO
ALTER TABLE [dbo].[Rrhh_MarcajeEncabezado]  WITH CHECK ADD FOREIGN KEY([IdColaborador])
REFERENCES [dbo].[Gth_Colaborador] ([IdColaborador])
GO
ALTER TABLE [dbo].[User_BitacoraUsuario]  WITH CHECK ADD  CONSTRAINT [Relationship3] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[User_User] ([IdUsuario])
GO
ALTER TABLE [dbo].[User_BitacoraUsuario] CHECK CONSTRAINT [Relationship3]
GO
ALTER TABLE [dbo].[User_DepartamentoUsuarios]  WITH CHECK ADD  CONSTRAINT [Relationship49] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[User_User] ([IdUsuario])
GO
ALTER TABLE [dbo].[User_DepartamentoUsuarios] CHECK CONSTRAINT [Relationship49]
GO
ALTER TABLE [dbo].[User_DepartamentoUsuarios]  WITH CHECK ADD  CONSTRAINT [Relationship50] FOREIGN KEY([IdModulos])
REFERENCES [dbo].[User_Modulos] ([IdModulos])
GO
ALTER TABLE [dbo].[User_DepartamentoUsuarios] CHECK CONSTRAINT [Relationship50]
GO
ALTER TABLE [dbo].[User_ModulosPermisos]  WITH CHECK ADD  CONSTRAINT [Relationship15] FOREIGN KEY([IdPermiso])
REFERENCES [dbo].[User_Permisos] ([IdPermiso])
GO
ALTER TABLE [dbo].[User_ModulosPermisos] CHECK CONSTRAINT [Relationship15]
GO
ALTER TABLE [dbo].[User_ModulosPermisos]  WITH CHECK ADD  CONSTRAINT [Relationship16] FOREIGN KEY([IdModulos])
REFERENCES [dbo].[User_Modulos] ([IdModulos])
GO
ALTER TABLE [dbo].[User_ModulosPermisos] CHECK CONSTRAINT [Relationship16]
GO
ALTER TABLE [dbo].[User_ModulosRoles]  WITH CHECK ADD  CONSTRAINT [Relationship17] FOREIGN KEY([IdRole])
REFERENCES [dbo].[User_Roles] ([IdRole])
GO
ALTER TABLE [dbo].[User_ModulosRoles] CHECK CONSTRAINT [Relationship17]
GO
ALTER TABLE [dbo].[User_ModulosRoles]  WITH CHECK ADD  CONSTRAINT [Relationship18] FOREIGN KEY([IdModulos])
REFERENCES [dbo].[User_Modulos] ([IdModulos])
GO
ALTER TABLE [dbo].[User_ModulosRoles] CHECK CONSTRAINT [Relationship18]
GO
ALTER TABLE [dbo].[User_ResetPassword]  WITH CHECK ADD  CONSTRAINT [Relationship2] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[User_User] ([IdUsuario])
GO
ALTER TABLE [dbo].[User_ResetPassword] CHECK CONSTRAINT [Relationship2]
GO
ALTER TABLE [dbo].[User_RolesPermisos]  WITH CHECK ADD  CONSTRAINT [Relationship4] FOREIGN KEY([IdRole])
REFERENCES [dbo].[User_Roles] ([IdRole])
GO
ALTER TABLE [dbo].[User_RolesPermisos] CHECK CONSTRAINT [Relationship4]
GO
ALTER TABLE [dbo].[User_RolesPermisos]  WITH CHECK ADD  CONSTRAINT [Relationship5] FOREIGN KEY([IdPermiso])
REFERENCES [dbo].[User_Permisos] ([IdPermiso])
GO
ALTER TABLE [dbo].[User_RolesPermisos] CHECK CONSTRAINT [Relationship5]
GO
ALTER TABLE [dbo].[User_User]  WITH CHECK ADD  CONSTRAINT [FK_User_User_Gth_Colaborador] FOREIGN KEY([IdColaborador])
REFERENCES [dbo].[Gth_Colaborador] ([IdColaborador])
GO
ALTER TABLE [dbo].[User_User] CHECK CONSTRAINT [FK_User_User_Gth_Colaborador]
GO
ALTER TABLE [dbo].[User_User]  WITH CHECK ADD  CONSTRAINT [Relationship1] FOREIGN KEY([IdEstado])
REFERENCES [dbo].[User_Estado] ([IdEstado])
GO
ALTER TABLE [dbo].[User_User] CHECK CONSTRAINT [Relationship1]
GO
ALTER TABLE [dbo].[User_UserRoles]  WITH CHECK ADD  CONSTRAINT [Relationship7] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[User_User] ([IdUsuario])
GO
ALTER TABLE [dbo].[User_UserRoles] CHECK CONSTRAINT [Relationship7]
GO
ALTER TABLE [dbo].[User_UserRoles]  WITH CHECK ADD  CONSTRAINT [Relationship8] FOREIGN KEY([IdRole])
REFERENCES [dbo].[User_Roles] ([IdRole])
GO
ALTER TABLE [dbo].[User_UserRoles] CHECK CONSTRAINT [Relationship8]
GO
ALTER TABLE [dbo].[Vts_UnidadNegocioEntidad]  WITH CHECK ADD  CONSTRAINT [FK_Entidad] FOREIGN KEY([IdEntidad])
REFERENCES [dbo].[Gen_Entidad] ([IdEntidad])
GO
ALTER TABLE [dbo].[Vts_UnidadNegocioEntidad] CHECK CONSTRAINT [FK_Entidad]
GO
ALTER TABLE [dbo].[Vts_UnidadNegocioEntidad]  WITH CHECK ADD  CONSTRAINT [FK_UnidadNegocio] FOREIGN KEY([IdUnidadNegocio])
REFERENCES [dbo].[Vts_UnidadNegocio] ([IdUnidadNegocio])
GO
ALTER TABLE [dbo].[Vts_UnidadNegocioEntidad] CHECK CONSTRAINT [FK_UnidadNegocio]
GO
USE [master]
GO
ALTER DATABASE [Mix4] SET  READ_WRITE 
GO
