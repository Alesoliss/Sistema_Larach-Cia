USE [DB_Sistema_LarachyCia]
GO
/****** Object:  Schema [Acce]    Script Date: 29/4/2024 12:48:16 ******/
CREATE SCHEMA [Acce]
GO
/****** Object:  Schema [Cmrl]    Script Date: 29/4/2024 12:48:16 ******/
CREATE SCHEMA [Cmrl]
GO
/****** Object:  Schema [Comp]    Script Date: 29/4/2024 12:48:16 ******/
CREATE SCHEMA [Comp]
GO
/****** Object:  Schema [Gral]    Script Date: 29/4/2024 12:48:16 ******/
CREATE SCHEMA [Gral]
GO
/****** Object:  Schema [Grph]    Script Date: 29/4/2024 12:48:16 ******/
CREATE SCHEMA [Grph]
GO
/****** Object:  Schema [Venta]    Script Date: 29/4/2024 12:48:16 ******/
CREATE SCHEMA [Venta]
GO
/****** Object:  Table [Acce].[tbPantallas]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Acce].[tbPantallas](
	[Panta_Id] [int] IDENTITY(1,1) NOT NULL,
	[Panta_Descripcion] [nvarchar](30) NOT NULL,
	[Panta_UsuarioCreacion] [int] NOT NULL,
	[Panta_FechaCreacion] [datetime] NOT NULL,
	[Panta_UsuarioModificacion] [int] NULL,
	[Panta_FechaModificacion] [datetime] NULL,
	[Panta_Estado] [bit] NULL,
 CONSTRAINT [PK_tbPantallas_Panta_Id] PRIMARY KEY CLUSTERED 
(
	[Panta_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Acce].[tbPantallasPorRoles]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Acce].[tbPantallasPorRoles](
	[Papro_Id] [int] IDENTITY(1,1) NOT NULL,
	[Panta_Id] [int] NOT NULL,
	[Roles_Id] [int] NOT NULL,
	[Papro_UsuarioCreacion] [int] NOT NULL,
	[Papro_FechaCreacion] [datetime] NOT NULL,
	[Papro_UsuarioModificacion] [int] NULL,
	[Papro_FechaModificacion] [datetime] NULL,
	[Papro_Estado] [bit] NULL,
 CONSTRAINT [PK_tbPantallasPorRoles_Papro_Id] PRIMARY KEY CLUSTERED 
(
	[Papro_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Acce].[tbRoles]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Acce].[tbRoles](
	[Roles_Id] [int] IDENTITY(1,1) NOT NULL,
	[Roles_Descripcion] [nvarchar](30) NOT NULL,
	[Roles_UsuarioCreacion] [int] NOT NULL,
	[Roles_FechaCreacion] [datetime] NOT NULL,
	[Roles_UsuarioModificacion] [int] NULL,
	[Roles_FechaModificacion] [datetime] NULL,
	[Roles_Estado] [bit] NULL,
 CONSTRAINT [PK_tbRoles_Roles_Id] PRIMARY KEY CLUSTERED 
(
	[Roles_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Acce].[tbUsuarios]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Acce].[tbUsuarios](
	[Usuar_Id] [int] IDENTITY(1,1) NOT NULL,
	[Usuar_Usuario] [nvarchar](50) NOT NULL,
	[Usuar_Contrasena] [nvarchar](max) NOT NULL,
	[Perso_Id] [int] NOT NULL,
	[Roles_Id] [int] NOT NULL,
	[Usuar_Admin] [bit] NOT NULL,
	[Usuar_UltimaSesion] [datetime] NULL,
	[Usuar_Tipo] [bit] NULL,
	[Usuar_UsuarioCreacion] [int] NOT NULL,
	[Usuar_FechaCreacion] [datetime] NOT NULL,
	[Usuar_UsuarioModificacion] [int] NULL,
	[Usuar_FechaModificacion] [datetime] NULL,
	[Usuar_Estado] [bit] NULL,
 CONSTRAINT [PK_tbUsuarios_Usuar_Id] PRIMARY KEY CLUSTERED 
(
	[Usuar_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Cmrl].[tbEmpleados]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Cmrl].[tbEmpleados](
	[Emple_Id] [int] IDENTITY(1,1) NOT NULL,
	[Emple_DNI] [nvarchar](13) NOT NULL,
	[Emple_PrimerNombre] [nvarchar](50) NOT NULL,
	[Emple_SegundoNombre] [nvarchar](50) NULL,
	[Emple_PrimerApellido] [nvarchar](50) NOT NULL,
	[Emple_SegundoApellido] [nvarchar](50) NULL,
	[Emple_Sexo] [char](1) NOT NULL,
	[Estad_Id] [int] NOT NULL,
	[Emple_Telefono] [nvarchar](20) NOT NULL,
	[Emple_Correo] [nvarchar](max) NOT NULL,
	[Emple_Direccion] [nvarchar](max) NOT NULL,
	[Munic_Id] [char](4) NOT NULL,
	[Cargo_Id] [int] NOT NULL,
	[Emple_UsuarioCreacion] [int] NOT NULL,
	[Emple_FechaCreacion] [datetime] NOT NULL,
	[Emple_UsuarioModificacion] [int] NULL,
	[Emple_FechaModificacion] [datetime] NULL,
	[Emple_Estado] [bit] NULL,
	[Sucur_Id] [int] NOT NULL,
 CONSTRAINT [PK_tbEmpleados_Emple_Id] PRIMARY KEY CLUSTERED 
(
	[Emple_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Cmrl].[tbProductos]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Cmrl].[tbProductos](
	[Produ_Id] [int] IDENTITY(1,1) NOT NULL,
	[Produ_Descripcion] [nvarchar](50) NOT NULL,
	[Produ_Existencia] [int] NOT NULL,
	[Unida_Id] [int] NOT NULL,
	[Produ_PrecioCompra] [numeric](8, 2) NOT NULL,
	[Produ_PrecioVenta] [numeric](8, 2) NOT NULL,
	[Impue_Id] [int] NOT NULL,
	[Categ_Id] [int] NOT NULL,
	[Prove_Id] [int] NOT NULL,
	[Sucur_Id] [int] NOT NULL,
	[Produ_UsuarioCreacion] [int] NOT NULL,
	[Produ_FechaCreacion] [datetime] NOT NULL,
	[Produ_UsuarioModificacion] [int] NULL,
	[Produ_FechaModificacion] [datetime] NULL,
	[Produ_Estado] [bit] NULL,
	[Produ_ImagenUrl] [varchar](max) NULL,
 CONSTRAINT [PK_tbProductos_Produ_Id] PRIMARY KEY CLUSTERED 
(
	[Produ_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Cmrl].[tbProveedores]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Cmrl].[tbProveedores](
	[Prove_Id] [int] IDENTITY(1,1) NOT NULL,
	[Prove_Marca] [nvarchar](50) NOT NULL,
	[Prove_ContactoPrimerNombre] [nvarchar](50) NOT NULL,
	[Prove_ContactoSegundoNombre] [nvarchar](50) NULL,
	[Prove_ContactoPrimerApellido] [nvarchar](50) NOT NULL,
	[Prove_ContactoSegundoApellido] [nvarchar](50) NULL,
	[Munic_Id] [char](4) NOT NULL,
	[Prove_Direccion] [nvarchar](max) NOT NULL,
	[Prove_Telefono] [nvarchar](20) NOT NULL,
	[Prove_Correo] [nvarchar](max) NULL,
	[Prove_Notas] [nvarchar](max) NULL,
	[Prove_UsuarioCreacion] [int] NOT NULL,
	[Prove_FechaCreacion] [datetime] NOT NULL,
	[Prove_UsuarioModificacion] [int] NULL,
	[Prove_FechaModificacion] [datetime] NULL,
	[Prove_Estado] [bit] NULL,
 CONSTRAINT [PK_tbProveedores_Prove_Id] PRIMARY KEY CLUSTERED 
(
	[Prove_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Cmrl].[tbSucursales]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Cmrl].[tbSucursales](
	[Sucur_Id] [int] IDENTITY(1,1) NOT NULL,
	[Sucur_Descripcion] [nvarchar](50) NOT NULL,
	[Munic_Id] [char](4) NOT NULL,
	[Sucur_Direccion] [nvarchar](max) NOT NULL,
	[Sucur_Telefono] [nvarchar](20) NOT NULL,
	[Sucur_UsuarioCreacion] [int] NOT NULL,
	[Sucur_FechaCreacion] [datetime] NOT NULL,
	[Sucur_UsuarioModificacion] [int] NULL,
	[Sucur_FechaModificacion] [datetime] NULL,
	[Sucur_Estado] [bit] NULL,
 CONSTRAINT [PK_tbSucursales_Sucur_Id] PRIMARY KEY CLUSTERED 
(
	[Sucur_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Comp].[tbComprasDetalle]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Comp].[tbComprasDetalle](
	[Comde_Id] [int] IDENTITY(1,1) NOT NULL,
	[Comen_Id] [int] NOT NULL,
	[Produ_Id] [int] NOT NULL,
	[Comde_Cantidad] [int] NOT NULL,
	[Comde_UsuarioCreacion] [int] NOT NULL,
	[Comde_FechaCreacion] [datetime] NOT NULL,
	[Comde_UsuarioModificacion] [int] NULL,
	[Comde_FechaModificacion] [datetime] NULL,
	[Comde_Estado] [bit] NULL,
 CONSTRAINT [PK_tbComprasDetalle_Comde_Id] PRIMARY KEY CLUSTERED 
(
	[Comde_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Comp].[tbComprasEncabezado]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Comp].[tbComprasEncabezado](
	[Comen_Id] [int] IDENTITY(1,1) NOT NULL,
	[Prove_Id] [int] NOT NULL,
	[Sucur_Id] [int] NOT NULL,
	[Emple_Id] [int] NOT NULL,
	[Comen_FechaFactura] [date] NOT NULL,
	[Comen_UsuarioCreacion] [int] NOT NULL,
	[Comen_FechaCreacion] [datetime] NOT NULL,
	[Comen_UsuarioModificacion] [int] NULL,
	[Comen_FechaModificacion] [datetime] NULL,
	[Comen_Estado] [bit] NULL,
 CONSTRAINT [PK_tbComprasEncabezado_Comen_Id] PRIMARY KEY CLUSTERED 
(
	[Comen_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Gral].[tbCargos]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Gral].[tbCargos](
	[Cargo_Id] [int] IDENTITY(1,1) NOT NULL,
	[Cargo_Descripcion] [nvarchar](50) NOT NULL,
	[Cargo_UsuarioCreacion] [int] NOT NULL,
	[Cargo_FechaCreacion] [datetime] NOT NULL,
	[Cargo_UsuarioModificacion] [int] NULL,
	[Cargo_FechaModificacion] [datetime] NULL,
	[Cargo_Estado] [bit] NULL,
 CONSTRAINT [PK_tbCargos_Cargo_Id] PRIMARY KEY CLUSTERED 
(
	[Cargo_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Gral].[tbCategorias]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Gral].[tbCategorias](
	[Categ_Id] [int] IDENTITY(1,1) NOT NULL,
	[Categ_Descripcion] [nvarchar](50) NOT NULL,
	[Categ_UsuarioCreacion] [int] NOT NULL,
	[Categ_FechaCreacion] [datetime] NOT NULL,
	[Categ_UsuarioModificacion] [int] NULL,
	[Categ_FechaModificacion] [datetime] NULL,
	[Categ_Estado] [bit] NULL,
	[Cate_ImagenUrl] [varchar](max) NULL,
 CONSTRAINT [PK_tbCategorias_Categ_Id] PRIMARY KEY CLUSTERED 
(
	[Categ_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Gral].[tbDepartamentos]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Gral].[tbDepartamentos](
	[Depar_Id] [char](2) NOT NULL,
	[Depar_Descripcion] [nvarchar](50) NOT NULL,
	[Depar_UsuarioCreacion] [int] NOT NULL,
	[Depar_FechaCreacion] [datetime] NOT NULL,
	[Depar_UsuarioModificacion] [int] NULL,
	[Depar_FechaModificacion] [datetime] NULL,
	[Depar_Estado] [bit] NULL,
 CONSTRAINT [PK_tbDepartamentos_Depar_Id] PRIMARY KEY CLUSTERED 
(
	[Depar_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Gral].[tbEstadosCiviles]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Gral].[tbEstadosCiviles](
	[Estad_Id] [int] IDENTITY(1,1) NOT NULL,
	[Estad_Descripcion] [nvarchar](30) NOT NULL,
	[Estad_UsuarioCreacion] [int] NOT NULL,
	[Estad_FechaCreacion] [datetime] NOT NULL,
	[Estad_UsuarioModificacion] [int] NULL,
	[Estad_FechaModificacion] [datetime] NULL,
	[Estad_Estado] [bit] NULL,
 CONSTRAINT [PK_tbEstadosCiviles_Estad_Id] PRIMARY KEY CLUSTERED 
(
	[Estad_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Gral].[tbImpuestos]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Gral].[tbImpuestos](
	[Impue_Id] [int] IDENTITY(1,1) NOT NULL,
	[Impue_Descripcion] [numeric](4, 2) NOT NULL,
	[Impue_UsuarioCreacion] [int] NOT NULL,
	[Impue_FechaCreacion] [datetime] NOT NULL,
	[Impue_UsuarioModificacion] [int] NULL,
	[Impue_FechaModificacion] [datetime] NULL,
	[Impue_Estado] [bit] NULL,
 CONSTRAINT [PK_tbImpuestos_Impue_Id] PRIMARY KEY CLUSTERED 
(
	[Impue_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Gral].[tbMetodospago]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Gral].[tbMetodospago](
	[MtPag_Id] [int] IDENTITY(1,1) NOT NULL,
	[MtPag_Descripcion] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MtPag_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Gral].[tbMunicipios]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Gral].[tbMunicipios](
	[Munic_Id] [char](4) NOT NULL,
	[Munic_Descripcion] [nvarchar](50) NOT NULL,
	[Depar_Id] [char](2) NOT NULL,
	[Munic_UsuarioCreacion] [int] NOT NULL,
	[Munic_FechaCreacion] [datetime] NOT NULL,
	[Munic_UsuarioModificacion] [int] NULL,
	[Munic_FechaModificacion] [datetime] NULL,
	[Munic_Estado] [bit] NULL,
 CONSTRAINT [PK_tbMunicipios_Munic_Id] PRIMARY KEY CLUSTERED 
(
	[Munic_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Gral].[tbUnidades]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Gral].[tbUnidades](
	[Unida_Id] [int] IDENTITY(1,1) NOT NULL,
	[Unida_Descripcion] [nvarchar](30) NOT NULL,
	[Unida_UsuarioCreacion] [int] NOT NULL,
	[Unida_FechaCreacion] [datetime] NOT NULL,
	[Unida_UsuarioModificacion] [int] NULL,
	[Unida_FechaModificacion] [datetime] NULL,
	[Unida_Estado] [bit] NULL,
 CONSTRAINT [PK_tbUnidades_Unida_Id] PRIMARY KEY CLUSTERED 
(
	[Unida_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Venta].[tbClientes]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Venta].[tbClientes](
	[Clien_Id] [int] IDENTITY(1,1) NOT NULL,
	[Clien_PrimerNombre] [nvarchar](50) NOT NULL,
	[Clien_SegundoNombre] [nvarchar](50) NULL,
	[Clien_PrimerApellido] [nvarchar](50) NOT NULL,
	[Clien_SegundoApellido] [nvarchar](50) NULL,
	[Clien_Sexo] [char](1) NULL,
	[Estad_Id] [int] NULL,
	[Clien_Telefono] [nvarchar](20) NOT NULL,
	[Clien_Correo] [nvarchar](max) NOT NULL,
	[Munic_Id] [char](4) NULL,
	[Clien_Direccion] [nvarchar](max) NOT NULL,
	[Clien_UsuarioCreacion] [int] NOT NULL,
	[Clien_FechaCreacion] [datetime] NOT NULL,
	[Clien_UsuarioModificacion] [int] NULL,
	[Clien_FechaModificacion] [datetime] NULL,
	[Clien_Estado] [bit] NULL,
 CONSTRAINT [PK_tbClientes_Clien_Id] PRIMARY KEY CLUSTERED 
(
	[Clien_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Venta].[tbVentasDetalle]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Venta].[tbVentasDetalle](
	[Vende_Id] [int] IDENTITY(1,1) NOT NULL,
	[Venen_Id] [int] NOT NULL,
	[Produ_Id] [int] NOT NULL,
	[Vende_Cantidad] [int] NOT NULL,
	[Vende_UsuarioCreacion] [int] NOT NULL,
	[Vende_FechaCreacion] [datetime] NOT NULL,
	[Vende_UsuarioModificacion] [int] NULL,
	[Vende_FechaModificacion] [datetime] NULL,
	[Vende_Estado] [bit] NULL,
 CONSTRAINT [PK_tbVentasDetalle_Vende_Id] PRIMARY KEY CLUSTERED 
(
	[Vende_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Venta].[tbVentasEncabezado]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Venta].[tbVentasEncabezado](
	[Venen_Id] [int] IDENTITY(1,1) NOT NULL,
	[Sucur_Id] [int] NOT NULL,
	[Clien_Id] [int] NOT NULL,
	[Venen_FechaPedido] [date] NOT NULL,
	[Venen_UsuarioCreacion] [int] NOT NULL,
	[Venen_FechaCreacion] [datetime] NOT NULL,
	[Venen_UsuarioModificacion] [int] NULL,
	[Venen_FechaModificacion] [datetime] NULL,
	[Venen_Estado] [bit] NULL,
	[MtPag_Id] [int] NULL,
	[Venen_NroTarjeta] [varchar](50) NULL,
 CONSTRAINT [PK_tbVentasEncabezado_Venen_Id] PRIMARY KEY CLUSTERED 
(
	[Venen_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Acce].[tbPantallas] ON 

INSERT [Acce].[tbPantallas] ([Panta_Id], [Panta_Descripcion], [Panta_UsuarioCreacion], [Panta_FechaCreacion], [Panta_UsuarioModificacion], [Panta_FechaModificacion], [Panta_Estado]) VALUES (1, N'Pantallas', 1, CAST(N'2023-09-09T00:00:00.000' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [Acce].[tbPantallas] OFF
GO
SET IDENTITY_INSERT [Acce].[tbRoles] ON 

INSERT [Acce].[tbRoles] ([Roles_Id], [Roles_Descripcion], [Roles_UsuarioCreacion], [Roles_FechaCreacion], [Roles_UsuarioModificacion], [Roles_FechaModificacion], [Roles_Estado]) VALUES (1, N'N/a', 1, CAST(N'2024-04-15T00:00:00.000' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [Acce].[tbRoles] OFF
GO
SET IDENTITY_INSERT [Acce].[tbUsuarios] ON 

INSERT [Acce].[tbUsuarios] ([Usuar_Id], [Usuar_Usuario], [Usuar_Contrasena], [Perso_Id], [Roles_Id], [Usuar_Admin], [Usuar_UltimaSesion], [Usuar_Tipo], [Usuar_UsuarioCreacion], [Usuar_FechaCreacion], [Usuar_UsuarioModificacion], [Usuar_FechaModificacion], [Usuar_Estado]) VALUES (1, N'pponce', N'CD8C29B8DEED323FE1538CFBDB46FC2A2EA61CFD67807F0629708EA2A6E13A2919DEF3C837C4E7F2C8E0067568E3236827DEFB05C9346E476B6E954440A908A7', 1, 1, 1, NULL, 1, 1, CAST(N'2024-04-15T00:00:00.000' AS DateTime), 1, CAST(N'2024-04-21T08:44:21.023' AS DateTime), 1)
INSERT [Acce].[tbUsuarios] ([Usuar_Id], [Usuar_Usuario], [Usuar_Contrasena], [Perso_Id], [Roles_Id], [Usuar_Admin], [Usuar_UltimaSesion], [Usuar_Tipo], [Usuar_UsuarioCreacion], [Usuar_FechaCreacion], [Usuar_UsuarioModificacion], [Usuar_FechaModificacion], [Usuar_Estado]) VALUES (2, N'jason', N'CD8C29B8DEED323FE1538CFBDB46FC2A2EA61CFD67807F0629708EA2A6E13A2919DEF3C837C4E7F2C8E0067568E3236827DEFB05C9346E476B6E954440A908A7', 1, 1, 0, CAST(N'2024-04-16T10:51:16.493' AS DateTime), 1, 1, CAST(N'2024-04-16T00:00:00.000' AS DateTime), 1, CAST(N'2024-04-21T13:13:43.597' AS DateTime), 1)
INSERT [Acce].[tbUsuarios] ([Usuar_Id], [Usuar_Usuario], [Usuar_Contrasena], [Perso_Id], [Roles_Id], [Usuar_Admin], [Usuar_UltimaSesion], [Usuar_Tipo], [Usuar_UsuarioCreacion], [Usuar_FechaCreacion], [Usuar_UsuarioModificacion], [Usuar_FechaModificacion], [Usuar_Estado]) VALUES (4, N'madian', N'CD8C29B8DEED323FE1538CFBDB46FC2A2EA61CFD67807F0629708EA2A6E13A2919DEF3C837C4E7F2C8E0067568E3236827DEFB05C9346E476B6E954440A908A7', 1, 1, 0, CAST(N'2024-04-16T11:00:22.727' AS DateTime), 1, 1, CAST(N'2024-04-16T00:00:00.000' AS DateTime), 1, CAST(N'2024-04-21T08:54:41.580' AS DateTime), 1)
INSERT [Acce].[tbUsuarios] ([Usuar_Id], [Usuar_Usuario], [Usuar_Contrasena], [Perso_Id], [Roles_Id], [Usuar_Admin], [Usuar_UltimaSesion], [Usuar_Tipo], [Usuar_UsuarioCreacion], [Usuar_FechaCreacion], [Usuar_UsuarioModificacion], [Usuar_FechaModificacion], [Usuar_Estado]) VALUES (7, N'nombre_usuario', N'847D816EE654FE9D3C094FFC86D00A2F29566C57DC8360715BF3BDE0BA1D8A1FE210E0702BEBD41538716AF7B13A5BB1A59ECC2637DFEAC4975B6035880F14A1', 1, 1, 0, NULL, 1, 1, CAST(N'2024-09-09T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbUsuarios] ([Usuar_Id], [Usuar_Usuario], [Usuar_Contrasena], [Perso_Id], [Roles_Id], [Usuar_Admin], [Usuar_UltimaSesion], [Usuar_Tipo], [Usuar_UsuarioCreacion], [Usuar_FechaCreacion], [Usuar_UsuarioModificacion], [Usuar_FechaModificacion], [Usuar_Estado]) VALUES (11, N'esdra', N'CD8C29B8DEED323FE1538CFBDB46FC2A2EA61CFD67807F0629708EA2A6E13A2919DEF3C837C4E7F2C8E0067568E3236827DEFB05C9346E476B6E954440A908A7', 1, 1, 1, NULL, 0, 1, CAST(N'2024-04-19T01:11:15.823' AS DateTime), 1, CAST(N'2024-04-23T15:33:56.207' AS DateTime), 1)
INSERT [Acce].[tbUsuarios] ([Usuar_Id], [Usuar_Usuario], [Usuar_Contrasena], [Perso_Id], [Roles_Id], [Usuar_Admin], [Usuar_UltimaSesion], [Usuar_Tipo], [Usuar_UsuarioCreacion], [Usuar_FechaCreacion], [Usuar_UsuarioModificacion], [Usuar_FechaModificacion], [Usuar_Estado]) VALUES (14, N'danyyy', N'CD8C29B8DEED323FE1538CFBDB46FC2A2EA61CFD67807F0629708EA2A6E13A2919DEF3C837C4E7F2C8E0067568E3236827DEFB05C9346E476B6E954440A908A7', 1, 1, 0, NULL, 1, 1, CAST(N'2024-04-19T02:23:03.607' AS DateTime), 1, CAST(N'2024-04-21T09:06:23.437' AS DateTime), 1)
INSERT [Acce].[tbUsuarios] ([Usuar_Id], [Usuar_Usuario], [Usuar_Contrasena], [Perso_Id], [Roles_Id], [Usuar_Admin], [Usuar_UltimaSesion], [Usuar_Tipo], [Usuar_UsuarioCreacion], [Usuar_FechaCreacion], [Usuar_UsuarioModificacion], [Usuar_FechaModificacion], [Usuar_Estado]) VALUES (15, N'mindy', N'CD8C29B8DEED323FE1538CFBDB46FC2A2EA61CFD67807F0629708EA2A6E13A2919DEF3C837C4E7F2C8E0067568E3236827DEFB05C9346E476B6E954440A908A7', 1, 1, 1, NULL, 1, 1, CAST(N'2024-04-19T02:24:05.060' AS DateTime), NULL, NULL, 0)
INSERT [Acce].[tbUsuarios] ([Usuar_Id], [Usuar_Usuario], [Usuar_Contrasena], [Perso_Id], [Roles_Id], [Usuar_Admin], [Usuar_UltimaSesion], [Usuar_Tipo], [Usuar_UsuarioCreacion], [Usuar_FechaCreacion], [Usuar_UsuarioModificacion], [Usuar_FechaModificacion], [Usuar_Estado]) VALUES (16, N'Juan', N'CD8C29B8DEED323FE1538CFBDB46FC2A2EA61CFD67807F0629708EA2A6E13A2919DEF3C837C4E7F2C8E0067568E3236827DEFB05C9346E476B6E954440A908A7', 1, 1, 1, NULL, 1, 1, CAST(N'2024-04-19T02:29:05.857' AS DateTime), NULL, NULL, 0)
INSERT [Acce].[tbUsuarios] ([Usuar_Id], [Usuar_Usuario], [Usuar_Contrasena], [Perso_Id], [Roles_Id], [Usuar_Admin], [Usuar_UltimaSesion], [Usuar_Tipo], [Usuar_UsuarioCreacion], [Usuar_FechaCreacion], [Usuar_UsuarioModificacion], [Usuar_FechaModificacion], [Usuar_Estado]) VALUES (17, N'ale', N'CD8C29B8DEED323FE1538CFBDB46FC2A2EA61CFD67807F0629708EA2A6E13A2919DEF3C837C4E7F2C8E0067568E3236827DEFB05C9346E476B6E954440A908A7', 1, 1, 0, NULL, 1, 1, CAST(N'2024-04-19T03:07:39.267' AS DateTime), 1, CAST(N'2024-04-21T08:56:08.930' AS DateTime), 1)
INSERT [Acce].[tbUsuarios] ([Usuar_Id], [Usuar_Usuario], [Usuar_Contrasena], [Perso_Id], [Roles_Id], [Usuar_Admin], [Usuar_UltimaSesion], [Usuar_Tipo], [Usuar_UsuarioCreacion], [Usuar_FechaCreacion], [Usuar_UsuarioModificacion], [Usuar_FechaModificacion], [Usuar_Estado]) VALUES (18, N'samuel', N'CD8C29B8DEED323FE1538CFBDB46FC2A2EA61CFD67807F0629708EA2A6E13A2919DEF3C837C4E7F2C8E0067568E3236827DEFB05C9346E476B6E954440A908A7', 4, 1, 1, NULL, 0, 1, CAST(N'2024-04-19T05:30:59.827' AS DateTime), NULL, NULL, 0)
INSERT [Acce].[tbUsuarios] ([Usuar_Id], [Usuar_Usuario], [Usuar_Contrasena], [Perso_Id], [Roles_Id], [Usuar_Admin], [Usuar_UltimaSesion], [Usuar_Tipo], [Usuar_UsuarioCreacion], [Usuar_FechaCreacion], [Usuar_UsuarioModificacion], [Usuar_FechaModificacion], [Usuar_Estado]) VALUES (20, N'julieth', N'CD8C29B8DEED323FE1538CFBDB46FC2A2EA61CFD67807F0629708EA2A6E13A2919DEF3C837C4E7F2C8E0067568E3236827DEFB05C9346E476B6E954440A908A7', 1, 1, 1, NULL, 1, 1, CAST(N'2024-04-20T15:55:25.817' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbUsuarios] ([Usuar_Id], [Usuar_Usuario], [Usuar_Contrasena], [Perso_Id], [Roles_Id], [Usuar_Admin], [Usuar_UltimaSesion], [Usuar_Tipo], [Usuar_UsuarioCreacion], [Usuar_FechaCreacion], [Usuar_UsuarioModificacion], [Usuar_FechaModificacion], [Usuar_Estado]) VALUES (22, N'g', N'CD8C29B8DEED323FE1538CFBDB46FC2A2EA61CFD67807F0629708EA2A6E13A2919DEF3C837C4E7F2C8E0067568E3236827DEFB05C9346E476B6E954440A908A7', 1, 1, 1, NULL, 1, 1, CAST(N'2024-04-20T16:22:10.010' AS DateTime), NULL, NULL, 0)
INSERT [Acce].[tbUsuarios] ([Usuar_Id], [Usuar_Usuario], [Usuar_Contrasena], [Perso_Id], [Roles_Id], [Usuar_Admin], [Usuar_UltimaSesion], [Usuar_Tipo], [Usuar_UsuarioCreacion], [Usuar_FechaCreacion], [Usuar_UsuarioModificacion], [Usuar_FechaModificacion], [Usuar_Estado]) VALUES (23, N'hello', N'CD8C29B8DEED323FE1538CFBDB46FC2A2EA61CFD67807F0629708EA2A6E13A2919DEF3C837C4E7F2C8E0067568E3236827DEFB05C9346E476B6E954440A908A7', 1, 1, 1, NULL, 1, 1, CAST(N'2024-04-20T16:30:22.760' AS DateTime), NULL, NULL, 0)
INSERT [Acce].[tbUsuarios] ([Usuar_Id], [Usuar_Usuario], [Usuar_Contrasena], [Perso_Id], [Roles_Id], [Usuar_Admin], [Usuar_UltimaSesion], [Usuar_Tipo], [Usuar_UsuarioCreacion], [Usuar_FechaCreacion], [Usuar_UsuarioModificacion], [Usuar_FechaModificacion], [Usuar_Estado]) VALUES (24, N'hola', N'CD8C29B8DEED323FE1538CFBDB46FC2A2EA61CFD67807F0629708EA2A6E13A2919DEF3C837C4E7F2C8E0067568E3236827DEFB05C9346E476B6E954440A908A7', 1, 1, 1, NULL, 1, 1, CAST(N'2024-04-20T16:49:22.033' AS DateTime), NULL, NULL, 0)
INSERT [Acce].[tbUsuarios] ([Usuar_Id], [Usuar_Usuario], [Usuar_Contrasena], [Perso_Id], [Roles_Id], [Usuar_Admin], [Usuar_UltimaSesion], [Usuar_Tipo], [Usuar_UsuarioCreacion], [Usuar_FechaCreacion], [Usuar_UsuarioModificacion], [Usuar_FechaModificacion], [Usuar_Estado]) VALUES (26, N'admin', N'D61D004C03457BAC7B90C1E8D4F51113BE162346B27AF5307CAFFE21EF88597FF15AB1569E07155302FF7B0AF29F7F0431531004568DA3849A5708176815A70F', 1, 1, 1, NULL, 1, 1, CAST(N'2024-04-21T03:08:47.583' AS DateTime), NULL, NULL, 0)
INSERT [Acce].[tbUsuarios] ([Usuar_Id], [Usuar_Usuario], [Usuar_Contrasena], [Perso_Id], [Roles_Id], [Usuar_Admin], [Usuar_UltimaSesion], [Usuar_Tipo], [Usuar_UsuarioCreacion], [Usuar_FechaCreacion], [Usuar_UsuarioModificacion], [Usuar_FechaModificacion], [Usuar_Estado]) VALUES (34, N'H', N'4F9BE77BEAFC2D7D8DCF04B1852E60DE3DE26CB44ACAFBBB07C9B28C4855789A6E3E23754175A8A4CE58D2066E9DFA894A5EEFB6EC24265FCA0C67F5F5627C4D', 1, 1, 0, NULL, 1, 1, CAST(N'2023-09-09T00:00:00.000' AS DateTime), NULL, NULL, 0)
INSERT [Acce].[tbUsuarios] ([Usuar_Id], [Usuar_Usuario], [Usuar_Contrasena], [Perso_Id], [Roles_Id], [Usuar_Admin], [Usuar_UltimaSesion], [Usuar_Tipo], [Usuar_UsuarioCreacion], [Usuar_FechaCreacion], [Usuar_UsuarioModificacion], [Usuar_FechaModificacion], [Usuar_Estado]) VALUES (36, N'holaaaaa', N'CD8C29B8DEED323FE1538CFBDB46FC2A2EA61CFD67807F0629708EA2A6E13A2919DEF3C837C4E7F2C8E0067568E3236827DEFB05C9346E476B6E954440A908A7', 1, 1, 1, NULL, 1, 1, CAST(N'2024-04-21T04:07:13.903' AS DateTime), NULL, NULL, 0)
INSERT [Acce].[tbUsuarios] ([Usuar_Id], [Usuar_Usuario], [Usuar_Contrasena], [Perso_Id], [Roles_Id], [Usuar_Admin], [Usuar_UltimaSesion], [Usuar_Tipo], [Usuar_UsuarioCreacion], [Usuar_FechaCreacion], [Usuar_UsuarioModificacion], [Usuar_FechaModificacion], [Usuar_Estado]) VALUES (40, N'esdrinha', N'D61D004C03457BAC7B90C1E8D4F51113BE162346B27AF5307CAFFE21EF88597FF15AB1569E07155302FF7B0AF29F7F0431531004568DA3849A5708176815A70F', 1, 1, 1, NULL, 1, 1, CAST(N'2024-04-21T04:10:58.200' AS DateTime), NULL, NULL, 0)
INSERT [Acce].[tbUsuarios] ([Usuar_Id], [Usuar_Usuario], [Usuar_Contrasena], [Perso_Id], [Roles_Id], [Usuar_Admin], [Usuar_UltimaSesion], [Usuar_Tipo], [Usuar_UsuarioCreacion], [Usuar_FechaCreacion], [Usuar_UsuarioModificacion], [Usuar_FechaModificacion], [Usuar_Estado]) VALUES (41, N'esdrinha1', N'D61D004C03457BAC7B90C1E8D4F51113BE162346B27AF5307CAFFE21EF88597FF15AB1569E07155302FF7B0AF29F7F0431531004568DA3849A5708176815A70F', 1, 1, 1, NULL, 1, 1, CAST(N'2024-04-21T04:11:15.093' AS DateTime), NULL, NULL, 0)
INSERT [Acce].[tbUsuarios] ([Usuar_Id], [Usuar_Usuario], [Usuar_Contrasena], [Perso_Id], [Roles_Id], [Usuar_Admin], [Usuar_UltimaSesion], [Usuar_Tipo], [Usuar_UsuarioCreacion], [Usuar_FechaCreacion], [Usuar_UsuarioModificacion], [Usuar_FechaModificacion], [Usuar_Estado]) VALUES (42, N'esdrinhaaqui', N'D61D004C03457BAC7B90C1E8D4F51113BE162346B27AF5307CAFFE21EF88597FF15AB1569E07155302FF7B0AF29F7F0431531004568DA3849A5708176815A70F', 1, 1, 0, NULL, 1, 1, CAST(N'2024-04-21T04:11:41.537' AS DateTime), NULL, NULL, 0)
INSERT [Acce].[tbUsuarios] ([Usuar_Id], [Usuar_Usuario], [Usuar_Contrasena], [Perso_Id], [Roles_Id], [Usuar_Admin], [Usuar_UltimaSesion], [Usuar_Tipo], [Usuar_UsuarioCreacion], [Usuar_FechaCreacion], [Usuar_UsuarioModificacion], [Usuar_FechaModificacion], [Usuar_Estado]) VALUES (44, N'sergioo', N'CD8C29B8DEED323FE1538CFBDB46FC2A2EA61CFD67807F0629708EA2A6E13A2919DEF3C837C4E7F2C8E0067568E3236827DEFB05C9346E476B6E954440A908A7', 1, 1, 1, NULL, 1, 1, CAST(N'2024-04-21T07:16:26.897' AS DateTime), NULL, NULL, 0)
INSERT [Acce].[tbUsuarios] ([Usuar_Id], [Usuar_Usuario], [Usuar_Contrasena], [Perso_Id], [Roles_Id], [Usuar_Admin], [Usuar_UltimaSesion], [Usuar_Tipo], [Usuar_UsuarioCreacion], [Usuar_FechaCreacion], [Usuar_UsuarioModificacion], [Usuar_FechaModificacion], [Usuar_Estado]) VALUES (45, N'post', N'E1223D9BBCD82236F9F09AE1F5578E3CBBD4E8F48954CEAD3003BE60AC85629726DC04B1F875353459F97BA4A4283A1A6ADB89D3524BB4816C7125964097106C', 1, 1, 1, NULL, 1, 1, CAST(N'2024-04-21T09:07:14.120' AS DateTime), NULL, NULL, 0)
INSERT [Acce].[tbUsuarios] ([Usuar_Id], [Usuar_Usuario], [Usuar_Contrasena], [Perso_Id], [Roles_Id], [Usuar_Admin], [Usuar_UltimaSesion], [Usuar_Tipo], [Usuar_UsuarioCreacion], [Usuar_FechaCreacion], [Usuar_UsuarioModificacion], [Usuar_FechaModificacion], [Usuar_Estado]) VALUES (46, N'holamundo', N'E1223D9BBCD82236F9F09AE1F5578E3CBBD4E8F48954CEAD3003BE60AC85629726DC04B1F875353459F97BA4A4283A1A6ADB89D3524BB4816C7125964097106C', 1, 1, 0, NULL, 1, 1, CAST(N'2024-04-21T13:12:24.023' AS DateTime), 1, CAST(N'2024-04-21T21:00:06.367' AS DateTime), 0)
INSERT [Acce].[tbUsuarios] ([Usuar_Id], [Usuar_Usuario], [Usuar_Contrasena], [Perso_Id], [Roles_Id], [Usuar_Admin], [Usuar_UltimaSesion], [Usuar_Tipo], [Usuar_UsuarioCreacion], [Usuar_FechaCreacion], [Usuar_UsuarioModificacion], [Usuar_FechaModificacion], [Usuar_Estado]) VALUES (47, N'Prueba', N'5131BA88DCF6E0A4AFE57E2A1E9FB7183805DC669D7CA26A1E03B0D996DAF801C5D531B88BDE0C86E86764D32E7CD810CC7AADD5F1FF4ECEC5401105180E5553', 1, 1, 1, NULL, 1, 1, CAST(N'2024-04-21T20:58:40.183' AS DateTime), NULL, NULL, 0)
SET IDENTITY_INSERT [Acce].[tbUsuarios] OFF
GO
SET IDENTITY_INSERT [Cmrl].[tbEmpleados] ON 

INSERT [Cmrl].[tbEmpleados] ([Emple_Id], [Emple_DNI], [Emple_PrimerNombre], [Emple_SegundoNombre], [Emple_PrimerApellido], [Emple_SegundoApellido], [Emple_Sexo], [Estad_Id], [Emple_Telefono], [Emple_Correo], [Emple_Direccion], [Munic_Id], [Cargo_Id], [Emple_UsuarioCreacion], [Emple_FechaCreacion], [Emple_UsuarioModificacion], [Emple_FechaModificacion], [Emple_Estado], [Sucur_Id]) VALUES (1, N'0502200502594', N'Pavel', N'Wilfredo', N'Ponce', N'Laínez', N'M', 1, N'50499556832', N'pavelponce03@gmail.com', N'Bloque 5, Casa 3, Col Del Valle, San Pedro Sula', N'0501', 1, 1, CAST(N'2024-04-15T00:00:00.000' AS DateTime), NULL, NULL, 1, 1)
SET IDENTITY_INSERT [Cmrl].[tbEmpleados] OFF
GO
SET IDENTITY_INSERT [Cmrl].[tbProductos] ON 

INSERT [Cmrl].[tbProductos] ([Produ_Id], [Produ_Descripcion], [Produ_Existencia], [Unida_Id], [Produ_PrecioCompra], [Produ_PrecioVenta], [Impue_Id], [Categ_Id], [Prove_Id], [Sucur_Id], [Produ_UsuarioCreacion], [Produ_FechaCreacion], [Produ_UsuarioModificacion], [Produ_FechaModificacion], [Produ_Estado], [Produ_ImagenUrl]) VALUES (1, N'leche', 23, 1, CAST(25.00 AS Numeric(8, 2)), CAST(27.00 AS Numeric(8, 2)), 1, 1, 1, 1, 1, CAST(N'2023-09-09T00:00:00.000' AS DateTime), NULL, NULL, 1, N'https://lacolonia.vtexassets.com/arquivos/ids/242728-800-auto?v=638193490485970000&width=800&height=auto&aspect=true')
INSERT [Cmrl].[tbProductos] ([Produ_Id], [Produ_Descripcion], [Produ_Existencia], [Unida_Id], [Produ_PrecioCompra], [Produ_PrecioVenta], [Impue_Id], [Categ_Id], [Prove_Id], [Sucur_Id], [Produ_UsuarioCreacion], [Produ_FechaCreacion], [Produ_UsuarioModificacion], [Produ_FechaModificacion], [Produ_Estado], [Produ_ImagenUrl]) VALUES (4, N'naranjas', 100, 1, CAST(10.50 AS Numeric(8, 2)), CAST(15.99 AS Numeric(8, 2)), 1, 1, 1, 1, 1, CAST(N'2023-09-09T00:00:00.000' AS DateTime), NULL, NULL, 0, N'data:image/jpeg;base64,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')
INSERT [Cmrl].[tbProductos] ([Produ_Id], [Produ_Descripcion], [Produ_Existencia], [Unida_Id], [Produ_PrecioCompra], [Produ_PrecioVenta], [Impue_Id], [Categ_Id], [Prove_Id], [Sucur_Id], [Produ_UsuarioCreacion], [Produ_FechaCreacion], [Produ_UsuarioModificacion], [Produ_FechaModificacion], [Produ_Estado], [Produ_ImagenUrl]) VALUES (6, N'Carne de Rez', 78, 1, CAST(29.00 AS Numeric(8, 2)), CAST(89.00 AS Numeric(8, 2)), 1, 1, 1, 1, 1, CAST(N'2023-09-09T00:00:00.000' AS DateTime), 1, CAST(N'2024-04-21T18:04:09.353' AS DateTime), 1, N'https://s2.ppllstatics.com/diariovasco/www/multimedia/201906/03/media/cortadas/carne-roja-kS1C-R5uqUSGFlSqj84mn1I9bQuN-624x385@Diario%20Vasco.jpg')
INSERT [Cmrl].[tbProductos] ([Produ_Id], [Produ_Descripcion], [Produ_Existencia], [Unida_Id], [Produ_PrecioCompra], [Produ_PrecioVenta], [Impue_Id], [Categ_Id], [Prove_Id], [Sucur_Id], [Produ_UsuarioCreacion], [Produ_FechaCreacion], [Produ_UsuarioModificacion], [Produ_FechaModificacion], [Produ_Estado], [Produ_ImagenUrl]) VALUES (7, N'Cheetos', 100, 1, CAST(10.50 AS Numeric(8, 2)), CAST(15.99 AS Numeric(8, 2)), 1, 1, 1, 1, 1, CAST(N'2023-09-09T00:00:00.000' AS DateTime), NULL, NULL, 1, N'https://walmarthn.vtexassets.com/arquivos/ids/277996/Snack-Cheetos-Poff-142-Gr-1-3899.jpg?v=638095990893500000')
INSERT [Cmrl].[tbProductos] ([Produ_Id], [Produ_Descripcion], [Produ_Existencia], [Unida_Id], [Produ_PrecioCompra], [Produ_PrecioVenta], [Impue_Id], [Categ_Id], [Prove_Id], [Sucur_Id], [Produ_UsuarioCreacion], [Produ_FechaCreacion], [Produ_UsuarioModificacion], [Produ_FechaModificacion], [Produ_Estado], [Produ_ImagenUrl]) VALUES (8, N'Sopa Instantanea', 78, 1, CAST(29.00 AS Numeric(8, 2)), CAST(89.00 AS Numeric(8, 2)), 1, 1, 1, 1, 1, CAST(N'2024-04-21T18:02:24.437' AS DateTime), NULL, NULL, 1, N'https://media.larachycia.com/800x800/media/items/83080000.webp')
INSERT [Cmrl].[tbProductos] ([Produ_Id], [Produ_Descripcion], [Produ_Existencia], [Unida_Id], [Produ_PrecioCompra], [Produ_PrecioVenta], [Impue_Id], [Categ_Id], [Prove_Id], [Sucur_Id], [Produ_UsuarioCreacion], [Produ_FechaCreacion], [Produ_UsuarioModificacion], [Produ_FechaModificacion], [Produ_Estado], [Produ_ImagenUrl]) VALUES (9, N'Mantequilla', 345, 1, CAST(13.00 AS Numeric(8, 2)), CAST(17.00 AS Numeric(8, 2)), 1, 1, 1, 1, 1, CAST(N'2024-04-25T18:41:08.287' AS DateTime), NULL, NULL, 1, N'https://s.cornershopapp.com/product-images/3695071.jpg?versionId=R2teZvMAwsGj5T_qoPOaP2nrrEM3HGFk')
SET IDENTITY_INSERT [Cmrl].[tbProductos] OFF
GO
SET IDENTITY_INSERT [Cmrl].[tbProveedores] ON 

INSERT [Cmrl].[tbProveedores] ([Prove_Id], [Prove_Marca], [Prove_ContactoPrimerNombre], [Prove_ContactoSegundoNombre], [Prove_ContactoPrimerApellido], [Prove_ContactoSegundoApellido], [Munic_Id], [Prove_Direccion], [Prove_Telefono], [Prove_Correo], [Prove_Notas], [Prove_UsuarioCreacion], [Prove_FechaCreacion], [Prove_UsuarioModificacion], [Prove_FechaModificacion], [Prove_Estado]) VALUES (1, N'Sula', N'Esdra', N'Maria', N'Cerna', NULL, N'0501', N'33 calle', N'9787-9089', N'edrinha@gmail.com', N'123', 1, CAST(N'2023-09-09T00:00:00.000' AS DateTime), 1, NULL, 1)
SET IDENTITY_INSERT [Cmrl].[tbProveedores] OFF
GO
SET IDENTITY_INSERT [Cmrl].[tbSucursales] ON 

INSERT [Cmrl].[tbSucursales] ([Sucur_Id], [Sucur_Descripcion], [Munic_Id], [Sucur_Direccion], [Sucur_Telefono], [Sucur_UsuarioCreacion], [Sucur_FechaCreacion], [Sucur_UsuarioModificacion], [Sucur_FechaModificacion], [Sucur_Estado]) VALUES (1, N'Sucursal1', N'0501', N'Avenida JR', N'9809-0989', 1, CAST(N'2023-09-09T00:00:00.000' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [Cmrl].[tbSucursales] OFF
GO
SET IDENTITY_INSERT [Comp].[tbComprasDetalle] ON 

INSERT [Comp].[tbComprasDetalle] ([Comde_Id], [Comen_Id], [Produ_Id], [Comde_Cantidad], [Comde_UsuarioCreacion], [Comde_FechaCreacion], [Comde_UsuarioModificacion], [Comde_FechaModificacion], [Comde_Estado]) VALUES (1, 1, 1, 55, 1, CAST(N'2023-09-09T00:00:00.000' AS DateTime), 1, CAST(N'2024-04-16T06:30:57.933' AS DateTime), 1)
SET IDENTITY_INSERT [Comp].[tbComprasDetalle] OFF
GO
SET IDENTITY_INSERT [Comp].[tbComprasEncabezado] ON 

INSERT [Comp].[tbComprasEncabezado] ([Comen_Id], [Prove_Id], [Sucur_Id], [Emple_Id], [Comen_FechaFactura], [Comen_UsuarioCreacion], [Comen_FechaCreacion], [Comen_UsuarioModificacion], [Comen_FechaModificacion], [Comen_Estado]) VALUES (1, 1, 1, 1, CAST(N'2023-09-09' AS Date), 1, CAST(N'2023-09-09T00:00:00.000' AS DateTime), 1, CAST(N'2023-09-09T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [Comp].[tbComprasEncabezado] OFF
GO
SET IDENTITY_INSERT [Gral].[tbCargos] ON 

INSERT [Gral].[tbCargos] ([Cargo_Id], [Cargo_Descripcion], [Cargo_UsuarioCreacion], [Cargo_FechaCreacion], [Cargo_UsuarioModificacion], [Cargo_FechaModificacion], [Cargo_Estado]) VALUES (1, N'Jefe de Sucursal', 1, CAST(N'2024-04-15T00:00:00.000' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [Gral].[tbCargos] OFF
GO
SET IDENTITY_INSERT [Gral].[tbCategorias] ON 

INSERT [Gral].[tbCategorias] ([Categ_Id], [Categ_Descripcion], [Categ_UsuarioCreacion], [Categ_FechaCreacion], [Categ_UsuarioModificacion], [Categ_FechaModificacion], [Categ_Estado], [Cate_ImagenUrl]) VALUES (1, N'Lacteos', 1, CAST(N'2023-09-09T00:00:00.000' AS DateTime), NULL, NULL, 1, N'https://www.americandairy.com/wp-content/uploads/2023/01/ADA-IMAGEN-FEBRERO-600x314_4.jpg')
INSERT [Gral].[tbCategorias] ([Categ_Id], [Categ_Descripcion], [Categ_UsuarioCreacion], [Categ_FechaCreacion], [Categ_UsuarioModificacion], [Categ_FechaModificacion], [Categ_Estado], [Cate_ImagenUrl]) VALUES (2, N'Plasticos', 1, CAST(N'2023-09-09T00:00:00.000' AS DateTime), NULL, NULL, 1, N'https://images-na.ssl-images-amazon.com/images/I/712tWxqg1IL._AC_SX679_.jpg')
INSERT [Gral].[tbCategorias] ([Categ_Id], [Categ_Descripcion], [Categ_UsuarioCreacion], [Categ_FechaCreacion], [Categ_UsuarioModificacion], [Categ_FechaModificacion], [Categ_Estado], [Cate_ImagenUrl]) VALUES (3, N'Carnes', 1, CAST(N'2023-09-09T00:00:00.000' AS DateTime), NULL, NULL, 1, N'https://th.bing.com/th/id/OIP.rgsxROBhmnLoqR-Iixe4wQHaEo?rs=1&pid=ImgDetMain')
INSERT [Gral].[tbCategorias] ([Categ_Id], [Categ_Descripcion], [Categ_UsuarioCreacion], [Categ_FechaCreacion], [Categ_UsuarioModificacion], [Categ_FechaModificacion], [Categ_Estado], [Cate_ImagenUrl]) VALUES (4, N'Granos', 1, CAST(N'2023-09-09T00:00:00.000' AS DateTime), NULL, NULL, 1, N'https://th.bing.com/th/id/OIP.sBc2rae5syvjM5eXLNSJwgHaET?w=940&h=547&rs=1&pid=ImgDetMain')
INSERT [Gral].[tbCategorias] ([Categ_Id], [Categ_Descripcion], [Categ_UsuarioCreacion], [Categ_FechaCreacion], [Categ_UsuarioModificacion], [Categ_FechaModificacion], [Categ_Estado], [Cate_ImagenUrl]) VALUES (5, N'Snacks', 1, CAST(N'2023-09-09T00:00:00.000' AS DateTime), NULL, NULL, 1, N'https://thumbs.dreamstime.com/b/virutas-de-ma%C3%ADz-fr%C3%ADas-aisladas-11531053.jpg')
SET IDENTITY_INSERT [Gral].[tbCategorias] OFF
GO
INSERT [Gral].[tbDepartamentos] ([Depar_Id], [Depar_Descripcion], [Depar_UsuarioCreacion], [Depar_FechaCreacion], [Depar_UsuarioModificacion], [Depar_FechaModificacion], [Depar_Estado]) VALUES (N'01', N'Atlántida', 1, CAST(N'2024-04-15T12:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbDepartamentos] ([Depar_Id], [Depar_Descripcion], [Depar_UsuarioCreacion], [Depar_FechaCreacion], [Depar_UsuarioModificacion], [Depar_FechaModificacion], [Depar_Estado]) VALUES (N'02', N'Colón', 1, CAST(N'2024-04-15T12:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbDepartamentos] ([Depar_Id], [Depar_Descripcion], [Depar_UsuarioCreacion], [Depar_FechaCreacion], [Depar_UsuarioModificacion], [Depar_FechaModificacion], [Depar_Estado]) VALUES (N'03', N'Comayagua', 1, CAST(N'2024-04-15T12:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbDepartamentos] ([Depar_Id], [Depar_Descripcion], [Depar_UsuarioCreacion], [Depar_FechaCreacion], [Depar_UsuarioModificacion], [Depar_FechaModificacion], [Depar_Estado]) VALUES (N'04', N'Copán', 1, CAST(N'2024-04-15T12:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbDepartamentos] ([Depar_Id], [Depar_Descripcion], [Depar_UsuarioCreacion], [Depar_FechaCreacion], [Depar_UsuarioModificacion], [Depar_FechaModificacion], [Depar_Estado]) VALUES (N'05', N'Cortés', 1, CAST(N'2024-04-15T12:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbDepartamentos] ([Depar_Id], [Depar_Descripcion], [Depar_UsuarioCreacion], [Depar_FechaCreacion], [Depar_UsuarioModificacion], [Depar_FechaModificacion], [Depar_Estado]) VALUES (N'06', N'Choluteca', 1, CAST(N'2024-04-15T12:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbDepartamentos] ([Depar_Id], [Depar_Descripcion], [Depar_UsuarioCreacion], [Depar_FechaCreacion], [Depar_UsuarioModificacion], [Depar_FechaModificacion], [Depar_Estado]) VALUES (N'07', N'El Paraíso', 1, CAST(N'2024-04-15T12:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbDepartamentos] ([Depar_Id], [Depar_Descripcion], [Depar_UsuarioCreacion], [Depar_FechaCreacion], [Depar_UsuarioModificacion], [Depar_FechaModificacion], [Depar_Estado]) VALUES (N'08', N'Francisco Morazán', 1, CAST(N'2024-04-15T12:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbDepartamentos] ([Depar_Id], [Depar_Descripcion], [Depar_UsuarioCreacion], [Depar_FechaCreacion], [Depar_UsuarioModificacion], [Depar_FechaModificacion], [Depar_Estado]) VALUES (N'09', N'Gracias a Dios', 1, CAST(N'2024-04-15T12:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbDepartamentos] ([Depar_Id], [Depar_Descripcion], [Depar_UsuarioCreacion], [Depar_FechaCreacion], [Depar_UsuarioModificacion], [Depar_FechaModificacion], [Depar_Estado]) VALUES (N'10', N'Intibucá', 1, CAST(N'2024-04-15T12:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbDepartamentos] ([Depar_Id], [Depar_Descripcion], [Depar_UsuarioCreacion], [Depar_FechaCreacion], [Depar_UsuarioModificacion], [Depar_FechaModificacion], [Depar_Estado]) VALUES (N'11', N'Islas de la Bahía', 1, CAST(N'2024-04-15T12:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbDepartamentos] ([Depar_Id], [Depar_Descripcion], [Depar_UsuarioCreacion], [Depar_FechaCreacion], [Depar_UsuarioModificacion], [Depar_FechaModificacion], [Depar_Estado]) VALUES (N'12', N'La Paz', 1, CAST(N'2024-04-15T12:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbDepartamentos] ([Depar_Id], [Depar_Descripcion], [Depar_UsuarioCreacion], [Depar_FechaCreacion], [Depar_UsuarioModificacion], [Depar_FechaModificacion], [Depar_Estado]) VALUES (N'13', N'Lempira', 1, CAST(N'2024-04-15T12:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbDepartamentos] ([Depar_Id], [Depar_Descripcion], [Depar_UsuarioCreacion], [Depar_FechaCreacion], [Depar_UsuarioModificacion], [Depar_FechaModificacion], [Depar_Estado]) VALUES (N'14', N'Ocotepeque', 1, CAST(N'2024-04-15T12:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbDepartamentos] ([Depar_Id], [Depar_Descripcion], [Depar_UsuarioCreacion], [Depar_FechaCreacion], [Depar_UsuarioModificacion], [Depar_FechaModificacion], [Depar_Estado]) VALUES (N'15', N'Olancho', 1, CAST(N'2024-04-15T12:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbDepartamentos] ([Depar_Id], [Depar_Descripcion], [Depar_UsuarioCreacion], [Depar_FechaCreacion], [Depar_UsuarioModificacion], [Depar_FechaModificacion], [Depar_Estado]) VALUES (N'16', N'Santa Bárbara', 1, CAST(N'2024-04-15T12:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbDepartamentos] ([Depar_Id], [Depar_Descripcion], [Depar_UsuarioCreacion], [Depar_FechaCreacion], [Depar_UsuarioModificacion], [Depar_FechaModificacion], [Depar_Estado]) VALUES (N'17', N'Valle', 1, CAST(N'2024-02-19T06:35:00.810' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbDepartamentos] ([Depar_Id], [Depar_Descripcion], [Depar_UsuarioCreacion], [Depar_FechaCreacion], [Depar_UsuarioModificacion], [Depar_FechaModificacion], [Depar_Estado]) VALUES (N'18', N'Yoro', 1, CAST(N'2024-04-15T12:00:00.000' AS DateTime), NULL, NULL, 1)
GO
SET IDENTITY_INSERT [Gral].[tbEstadosCiviles] ON 

INSERT [Gral].[tbEstadosCiviles] ([Estad_Id], [Estad_Descripcion], [Estad_UsuarioCreacion], [Estad_FechaCreacion], [Estad_UsuarioModificacion], [Estad_FechaModificacion], [Estad_Estado]) VALUES (1, N'Soltero', 1, CAST(N'2024-04-15T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbEstadosCiviles] ([Estad_Id], [Estad_Descripcion], [Estad_UsuarioCreacion], [Estad_FechaCreacion], [Estad_UsuarioModificacion], [Estad_FechaModificacion], [Estad_Estado]) VALUES (2, N'Casado', 1, CAST(N'2024-04-15T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbEstadosCiviles] ([Estad_Id], [Estad_Descripcion], [Estad_UsuarioCreacion], [Estad_FechaCreacion], [Estad_UsuarioModificacion], [Estad_FechaModificacion], [Estad_Estado]) VALUES (3, N'Viudo', 1, CAST(N'2024-04-15T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbEstadosCiviles] ([Estad_Id], [Estad_Descripcion], [Estad_UsuarioCreacion], [Estad_FechaCreacion], [Estad_UsuarioModificacion], [Estad_FechaModificacion], [Estad_Estado]) VALUES (4, N'Union Libre ', 1, CAST(N'2024-04-15T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbEstadosCiviles] ([Estad_Id], [Estad_Descripcion], [Estad_UsuarioCreacion], [Estad_FechaCreacion], [Estad_UsuarioModificacion], [Estad_FechaModificacion], [Estad_Estado]) VALUES (5, N'Divorciado', 1, CAST(N'2024-04-15T00:00:00.000' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [Gral].[tbEstadosCiviles] OFF
GO
SET IDENTITY_INSERT [Gral].[tbImpuestos] ON 

INSERT [Gral].[tbImpuestos] ([Impue_Id], [Impue_Descripcion], [Impue_UsuarioCreacion], [Impue_FechaCreacion], [Impue_UsuarioModificacion], [Impue_FechaModificacion], [Impue_Estado]) VALUES (1, CAST(0.10 AS Numeric(4, 2)), 1, CAST(N'2023-09-09T00:00:00.000' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [Gral].[tbImpuestos] OFF
GO
SET IDENTITY_INSERT [Gral].[tbMetodospago] ON 

INSERT [Gral].[tbMetodospago] ([MtPag_Id], [MtPag_Descripcion]) VALUES (1, N'MasterCard')
INSERT [Gral].[tbMetodospago] ([MtPag_Id], [MtPag_Descripcion]) VALUES (2, N'PayPal')
INSERT [Gral].[tbMetodospago] ([MtPag_Id], [MtPag_Descripcion]) VALUES (3, N'Visa')
INSERT [Gral].[tbMetodospago] ([MtPag_Id], [MtPag_Descripcion]) VALUES (4, N'American Express')
SET IDENTITY_INSERT [Gral].[tbMetodospago] OFF
GO
INSERT [Gral].[tbMunicipios] ([Munic_Id], [Munic_Descripcion], [Depar_Id], [Munic_UsuarioCreacion], [Munic_FechaCreacion], [Munic_UsuarioModificacion], [Munic_FechaModificacion], [Munic_Estado]) VALUES (N'0501', N'San Pedro Sula', N'05', 1, CAST(N'2024-04-15T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
SET IDENTITY_INSERT [Gral].[tbUnidades] ON 

INSERT [Gral].[tbUnidades] ([Unida_Id], [Unida_Descripcion], [Unida_UsuarioCreacion], [Unida_FechaCreacion], [Unida_UsuarioModificacion], [Unida_FechaModificacion], [Unida_Estado]) VALUES (1, N'123', 1, CAST(N'2023-09-09T00:00:00.000' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [Gral].[tbUnidades] OFF
GO
SET IDENTITY_INSERT [Venta].[tbClientes] ON 

INSERT [Venta].[tbClientes] ([Clien_Id], [Clien_PrimerNombre], [Clien_SegundoNombre], [Clien_PrimerApellido], [Clien_SegundoApellido], [Clien_Sexo], [Estad_Id], [Clien_Telefono], [Clien_Correo], [Munic_Id], [Clien_Direccion], [Clien_UsuarioCreacion], [Clien_FechaCreacion], [Clien_UsuarioModificacion], [Clien_FechaModificacion], [Clien_Estado]) VALUES (4, N'Juan', N'Carlos', N'Perez', N'Gomez', N'M', 1, N'1234567890', N'juan@example.com', N'0501', N'Calle Principal #123', 1, CAST(N'2023-09-09T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbClientes] ([Clien_Id], [Clien_PrimerNombre], [Clien_SegundoNombre], [Clien_PrimerApellido], [Clien_SegundoApellido], [Clien_Sexo], [Estad_Id], [Clien_Telefono], [Clien_Correo], [Munic_Id], [Clien_Direccion], [Clien_UsuarioCreacion], [Clien_FechaCreacion], [Clien_UsuarioModificacion], [Clien_FechaModificacion], [Clien_Estado]) VALUES (5, N'Cerna', N'Maria', N'Cerna', N'Romero', N'F', 1, N'90893788', N'alesol.absa@gmail.com', N'0501', N'33 calle', 1, CAST(N'2024-04-19T14:45:32.637' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [Venta].[tbClientes] OFF
GO
SET IDENTITY_INSERT [Venta].[tbVentasDetalle] ON 

INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (2, 2, 1, 2, 1, CAST(N'2023-09-09T00:00:00.000' AS DateTime), 1, CAST(N'2024-04-25T04:54:19.027' AS DateTime), 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (3, 2, 1, 4, 1, CAST(N'2023-09-09T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (5, 2, 1, 4, 1, CAST(N'2023-09-09T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (9, 2, 1, 13, 1, CAST(N'2024-04-23T08:12:39.230' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (10, 2, 1, 13, 1, CAST(N'2024-04-23T08:28:40.267' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (13, 2, 1, 13, 1, CAST(N'2024-04-24T05:24:41.033' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (14, 2, 1, 56, 1, CAST(N'2024-04-24T05:26:31.070' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (16, 2, 1, 1, 1, CAST(N'2024-04-24T05:53:07.760' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (18, 2, 1, 1, 1, CAST(N'2024-04-24T15:00:16.777' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (21, 2, 1, 233, 1, CAST(N'2024-04-24T23:18:20.187' AS DateTime), 1, CAST(N'2024-04-25T00:09:26.107' AS DateTime), 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (22, 2, 1, 1, 1, CAST(N'2024-04-25T00:17:04.340' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (23, 2, 1, 2, 1, CAST(N'2024-04-25T00:17:20.007' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (24, 2, 1, 1, 1, CAST(N'2024-04-25T00:21:25.310' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (25, 2, 1, 1, 1, CAST(N'2024-04-25T00:31:33.413' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (26, 2, 1, 1, 1, CAST(N'2024-04-25T00:41:01.120' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (27, 2, 1, 1, 1, CAST(N'2024-04-25T00:53:34.553' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (28, 2, 1, 1, 1, CAST(N'2024-04-25T01:02:42.130' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (29, 2, 1, 1, 1, CAST(N'2024-04-25T01:06:16.917' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (30, 2, 1, 1, 1, CAST(N'2024-04-25T01:13:18.023' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (31, 2, 1, 1, 1, CAST(N'2024-04-25T01:17:21.300' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (32, 2, 1, 1, 1, CAST(N'2024-04-25T01:32:38.500' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (33, 2, 1, 1, 1, CAST(N'2024-04-25T02:02:01.257' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (34, 2, 1, 1, 1, CAST(N'2024-04-25T02:12:05.007' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (35, 2, 1, 1, 1, CAST(N'2024-04-25T02:15:12.397' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (36, 2, 1, 1, 1, CAST(N'2024-04-25T02:19:54.630' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (37, 2, 1, 1, 1, CAST(N'2024-04-25T02:24:47.077' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (38, 2, 1, 1, 1, CAST(N'2024-04-25T02:31:56.557' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (39, 2, 1, 1, 1, CAST(N'2024-04-25T02:44:19.677' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (40, 2, 1, 1, 1, CAST(N'2024-04-25T02:49:24.690' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (41, 2, 1, 1, 1, CAST(N'2024-04-25T03:03:54.533' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (42, 2, 1, 1, 1, CAST(N'2024-04-25T03:11:52.817' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (43, 2, 1, 1, 1, CAST(N'2024-04-25T03:17:47.870' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (44, 2, 1, 1, 1, CAST(N'2024-04-25T03:24:31.720' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (45, 2, 1, 76272, 1, CAST(N'2024-04-25T03:39:54.180' AS DateTime), 1, CAST(N'2024-04-25T03:47:17.283' AS DateTime), 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (46, 2, 1, 1, 1, CAST(N'2024-04-25T03:43:59.333' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (47, 2, 1, 1, 1, CAST(N'2024-04-25T03:45:07.767' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (48, 2, 1, 1, 1, CAST(N'2024-04-25T03:50:49.050' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (51, 2, 1, 5, 1, CAST(N'2023-09-09T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (52, 2, 1, 1, 1, CAST(N'2024-04-25T04:45:40.980' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (53, 2, 1, 1, 1, CAST(N'2024-04-25T04:46:13.630' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (54, 2, 1, 1, 1, CAST(N'2024-04-25T04:47:06.063' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (55, 2, 1, 1, 1, CAST(N'2024-04-25T04:48:50.790' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (56, 2, 1, 1, 1, CAST(N'2024-04-25T04:54:17.643' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (57, 2, 1, 1, 1, CAST(N'2024-04-25T04:56:28.073' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (58, 2, 1, 1, 1, CAST(N'2024-04-25T05:01:07.597' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (60, 2, 1, 5, 1, CAST(N'2023-09-09T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (61, 2, 1, 1, 1, CAST(N'2024-04-25T05:36:51.503' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (62, 2, 1, 1, 1, CAST(N'2024-04-25T05:38:19.320' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (63, 2, 1, 1, 1, CAST(N'2024-04-25T05:39:45.700' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (64, 2, 1, 1, 1, CAST(N'2024-04-25T06:05:33.020' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (70, 82, 1, 28, 1, CAST(N'2024-04-26T03:01:41.780' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (71, 82, 1, 1, 1, CAST(N'2024-04-26T03:41:18.490' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (72, 82, 4, 1, 1, CAST(N'2024-04-26T03:42:08.010' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (73, 82, 9, 1, 1, CAST(N'2024-04-26T03:42:30.583' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (74, 82, 1, 1, 1, CAST(N'2024-04-26T04:01:19.273' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (75, 9, 1, 1, 1, CAST(N'2024-09-09T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (78, 82, 1, 1, 1, CAST(N'2024-04-26T09:43:46.910' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (79, 82, 1, 1, 1, CAST(N'2024-04-26T10:19:02.107' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (80, 82, 1, 1, 1, CAST(N'2024-04-26T12:56:29.850' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (81, 82, 1, 1, 1, CAST(N'2024-04-26T13:02:30.193' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (82, 82, 1, 1, 1, CAST(N'2024-04-26T13:14:22.603' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (83, 82, 4, 1, 1, CAST(N'2024-04-26T13:15:05.487' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (84, 82, 6, 1, 1, CAST(N'2024-04-26T13:17:57.170' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (85, 83, 7, 1, 1, CAST(N'2024-04-26T13:21:30.173' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (86, 83, 4, 1, 1, CAST(N'2024-04-26T13:22:31.460' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (87, 83, 1, 1, 1, CAST(N'2024-04-26T13:44:49.237' AS DateTime), NULL, NULL, 1)
INSERT [Venta].[tbVentasDetalle] ([Vende_Id], [Venen_Id], [Produ_Id], [Vende_Cantidad], [Vende_UsuarioCreacion], [Vende_FechaCreacion], [Vende_UsuarioModificacion], [Vende_FechaModificacion], [Vende_Estado]) VALUES (88, 83, 1, 1, 1, CAST(N'2024-04-26T14:47:30.333' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [Venta].[tbVentasDetalle] OFF
GO
SET IDENTITY_INSERT [Venta].[tbVentasEncabezado] ON 

INSERT [Venta].[tbVentasEncabezado] ([Venen_Id], [Sucur_Id], [Clien_Id], [Venen_FechaPedido], [Venen_UsuarioCreacion], [Venen_FechaCreacion], [Venen_UsuarioModificacion], [Venen_FechaModificacion], [Venen_Estado], [MtPag_Id], [Venen_NroTarjeta]) VALUES (2, 1, 5, CAST(N'2023-09-09' AS Date), 1, CAST(N'2023-09-09T00:00:00.000' AS DateTime), 1, CAST(N'2024-04-23T03:42:51.830' AS DateTime), 0, 4, N'7896')
INSERT [Venta].[tbVentasEncabezado] ([Venen_Id], [Sucur_Id], [Clien_Id], [Venen_FechaPedido], [Venen_UsuarioCreacion], [Venen_FechaCreacion], [Venen_UsuarioModificacion], [Venen_FechaModificacion], [Venen_Estado], [MtPag_Id], [Venen_NroTarjeta]) VALUES (3, 1, 5, CAST(N'2023-09-09' AS Date), 1, CAST(N'2023-09-09T00:00:00.000' AS DateTime), 1, NULL, 1, NULL, NULL)
INSERT [Venta].[tbVentasEncabezado] ([Venen_Id], [Sucur_Id], [Clien_Id], [Venen_FechaPedido], [Venen_UsuarioCreacion], [Venen_FechaCreacion], [Venen_UsuarioModificacion], [Venen_FechaModificacion], [Venen_Estado], [MtPag_Id], [Venen_NroTarjeta]) VALUES (9, 1, 4, CAST(N'2024-04-23' AS Date), 1, CAST(N'2024-04-23T00:00:00.000' AS DateTime), NULL, NULL, 1, 3, N'867689')
INSERT [Venta].[tbVentasEncabezado] ([Venen_Id], [Sucur_Id], [Clien_Id], [Venen_FechaPedido], [Venen_UsuarioCreacion], [Venen_FechaCreacion], [Venen_UsuarioModificacion], [Venen_FechaModificacion], [Venen_Estado], [MtPag_Id], [Venen_NroTarjeta]) VALUES (10, 1, 5, CAST(N'2024-04-23' AS Date), 1, CAST(N'2024-04-23T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [Venta].[tbVentasEncabezado] ([Venen_Id], [Sucur_Id], [Clien_Id], [Venen_FechaPedido], [Venen_UsuarioCreacion], [Venen_FechaCreacion], [Venen_UsuarioModificacion], [Venen_FechaModificacion], [Venen_Estado], [MtPag_Id], [Venen_NroTarjeta]) VALUES (14, 1, 5, CAST(N'2024-04-23' AS Date), 1, CAST(N'2024-04-23T04:53:02.823' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [Venta].[tbVentasEncabezado] ([Venen_Id], [Sucur_Id], [Clien_Id], [Venen_FechaPedido], [Venen_UsuarioCreacion], [Venen_FechaCreacion], [Venen_UsuarioModificacion], [Venen_FechaModificacion], [Venen_Estado], [MtPag_Id], [Venen_NroTarjeta]) VALUES (60, 1, 5, CAST(N'2024-04-25' AS Date), 1, CAST(N'2024-04-25T08:53:21.227' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [Venta].[tbVentasEncabezado] ([Venen_Id], [Sucur_Id], [Clien_Id], [Venen_FechaPedido], [Venen_UsuarioCreacion], [Venen_FechaCreacion], [Venen_UsuarioModificacion], [Venen_FechaModificacion], [Venen_Estado], [MtPag_Id], [Venen_NroTarjeta]) VALUES (61, 1, 5, CAST(N'2024-04-25' AS Date), 1, CAST(N'2024-04-25T09:36:32.263' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [Venta].[tbVentasEncabezado] ([Venen_Id], [Sucur_Id], [Clien_Id], [Venen_FechaPedido], [Venen_UsuarioCreacion], [Venen_FechaCreacion], [Venen_UsuarioModificacion], [Venen_FechaModificacion], [Venen_Estado], [MtPag_Id], [Venen_NroTarjeta]) VALUES (62, 1, 5, CAST(N'2024-04-25' AS Date), 1, CAST(N'2024-04-25T09:39:52.463' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [Venta].[tbVentasEncabezado] ([Venen_Id], [Sucur_Id], [Clien_Id], [Venen_FechaPedido], [Venen_UsuarioCreacion], [Venen_FechaCreacion], [Venen_UsuarioModificacion], [Venen_FechaModificacion], [Venen_Estado], [MtPag_Id], [Venen_NroTarjeta]) VALUES (63, 1, 5, CAST(N'2024-04-25' AS Date), 1, CAST(N'2024-04-25T09:47:21.903' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [Venta].[tbVentasEncabezado] ([Venen_Id], [Sucur_Id], [Clien_Id], [Venen_FechaPedido], [Venen_UsuarioCreacion], [Venen_FechaCreacion], [Venen_UsuarioModificacion], [Venen_FechaModificacion], [Venen_Estado], [MtPag_Id], [Venen_NroTarjeta]) VALUES (64, 1, 5, CAST(N'2023-09-09' AS Date), 1, CAST(N'2023-09-09T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [Venta].[tbVentasEncabezado] ([Venen_Id], [Sucur_Id], [Clien_Id], [Venen_FechaPedido], [Venen_UsuarioCreacion], [Venen_FechaCreacion], [Venen_UsuarioModificacion], [Venen_FechaModificacion], [Venen_Estado], [MtPag_Id], [Venen_NroTarjeta]) VALUES (65, 1, 5, CAST(N'2024-04-25' AS Date), 1, CAST(N'2024-04-25T14:39:16.480' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [Venta].[tbVentasEncabezado] ([Venen_Id], [Sucur_Id], [Clien_Id], [Venen_FechaPedido], [Venen_UsuarioCreacion], [Venen_FechaCreacion], [Venen_UsuarioModificacion], [Venen_FechaModificacion], [Venen_Estado], [MtPag_Id], [Venen_NroTarjeta]) VALUES (66, 1, 5, CAST(N'2024-04-25' AS Date), 1, CAST(N'2024-04-25T15:27:52.733' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [Venta].[tbVentasEncabezado] ([Venen_Id], [Sucur_Id], [Clien_Id], [Venen_FechaPedido], [Venen_UsuarioCreacion], [Venen_FechaCreacion], [Venen_UsuarioModificacion], [Venen_FechaModificacion], [Venen_Estado], [MtPag_Id], [Venen_NroTarjeta]) VALUES (67, 1, 5, CAST(N'2024-04-25' AS Date), 1, CAST(N'2024-04-25T20:10:33.530' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [Venta].[tbVentasEncabezado] ([Venen_Id], [Sucur_Id], [Clien_Id], [Venen_FechaPedido], [Venen_UsuarioCreacion], [Venen_FechaCreacion], [Venen_UsuarioModificacion], [Venen_FechaModificacion], [Venen_Estado], [MtPag_Id], [Venen_NroTarjeta]) VALUES (68, 1, 5, CAST(N'2024-04-25' AS Date), 1, CAST(N'2024-04-25T20:15:07.340' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [Venta].[tbVentasEncabezado] ([Venen_Id], [Sucur_Id], [Clien_Id], [Venen_FechaPedido], [Venen_UsuarioCreacion], [Venen_FechaCreacion], [Venen_UsuarioModificacion], [Venen_FechaModificacion], [Venen_Estado], [MtPag_Id], [Venen_NroTarjeta]) VALUES (69, 1, 5, CAST(N'2024-04-25' AS Date), 1, CAST(N'2024-04-25T20:19:10.557' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [Venta].[tbVentasEncabezado] ([Venen_Id], [Sucur_Id], [Clien_Id], [Venen_FechaPedido], [Venen_UsuarioCreacion], [Venen_FechaCreacion], [Venen_UsuarioModificacion], [Venen_FechaModificacion], [Venen_Estado], [MtPag_Id], [Venen_NroTarjeta]) VALUES (70, 1, 5, CAST(N'2024-04-25' AS Date), 1, CAST(N'2024-04-25T20:19:22.623' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [Venta].[tbVentasEncabezado] ([Venen_Id], [Sucur_Id], [Clien_Id], [Venen_FechaPedido], [Venen_UsuarioCreacion], [Venen_FechaCreacion], [Venen_UsuarioModificacion], [Venen_FechaModificacion], [Venen_Estado], [MtPag_Id], [Venen_NroTarjeta]) VALUES (71, 1, 5, CAST(N'2024-04-25' AS Date), 1, CAST(N'2024-04-25T20:25:48.310' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [Venta].[tbVentasEncabezado] ([Venen_Id], [Sucur_Id], [Clien_Id], [Venen_FechaPedido], [Venen_UsuarioCreacion], [Venen_FechaCreacion], [Venen_UsuarioModificacion], [Venen_FechaModificacion], [Venen_Estado], [MtPag_Id], [Venen_NroTarjeta]) VALUES (72, 1, 5, CAST(N'2024-04-26' AS Date), 1, CAST(N'2024-04-26T01:38:14.873' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [Venta].[tbVentasEncabezado] ([Venen_Id], [Sucur_Id], [Clien_Id], [Venen_FechaPedido], [Venen_UsuarioCreacion], [Venen_FechaCreacion], [Venen_UsuarioModificacion], [Venen_FechaModificacion], [Venen_Estado], [MtPag_Id], [Venen_NroTarjeta]) VALUES (73, 1, 5, CAST(N'2024-04-26' AS Date), 1, CAST(N'2024-04-26T01:45:26.573' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [Venta].[tbVentasEncabezado] ([Venen_Id], [Sucur_Id], [Clien_Id], [Venen_FechaPedido], [Venen_UsuarioCreacion], [Venen_FechaCreacion], [Venen_UsuarioModificacion], [Venen_FechaModificacion], [Venen_Estado], [MtPag_Id], [Venen_NroTarjeta]) VALUES (74, 1, 5, CAST(N'2024-04-26' AS Date), 1, CAST(N'2024-04-26T01:56:08.903' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [Venta].[tbVentasEncabezado] ([Venen_Id], [Sucur_Id], [Clien_Id], [Venen_FechaPedido], [Venen_UsuarioCreacion], [Venen_FechaCreacion], [Venen_UsuarioModificacion], [Venen_FechaModificacion], [Venen_Estado], [MtPag_Id], [Venen_NroTarjeta]) VALUES (75, 1, 5, CAST(N'2024-04-26' AS Date), 1, CAST(N'2024-04-26T02:08:55.190' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [Venta].[tbVentasEncabezado] ([Venen_Id], [Sucur_Id], [Clien_Id], [Venen_FechaPedido], [Venen_UsuarioCreacion], [Venen_FechaCreacion], [Venen_UsuarioModificacion], [Venen_FechaModificacion], [Venen_Estado], [MtPag_Id], [Venen_NroTarjeta]) VALUES (76, 1, 5, CAST(N'2024-04-26' AS Date), 1, CAST(N'2024-04-26T02:10:04.097' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [Venta].[tbVentasEncabezado] ([Venen_Id], [Sucur_Id], [Clien_Id], [Venen_FechaPedido], [Venen_UsuarioCreacion], [Venen_FechaCreacion], [Venen_UsuarioModificacion], [Venen_FechaModificacion], [Venen_Estado], [MtPag_Id], [Venen_NroTarjeta]) VALUES (77, 1, 5, CAST(N'2024-04-26' AS Date), 1, CAST(N'2024-04-26T02:12:30.353' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [Venta].[tbVentasEncabezado] ([Venen_Id], [Sucur_Id], [Clien_Id], [Venen_FechaPedido], [Venen_UsuarioCreacion], [Venen_FechaCreacion], [Venen_UsuarioModificacion], [Venen_FechaModificacion], [Venen_Estado], [MtPag_Id], [Venen_NroTarjeta]) VALUES (78, 1, 5, CAST(N'2024-04-26' AS Date), 1, CAST(N'2024-04-26T02:16:17.487' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [Venta].[tbVentasEncabezado] ([Venen_Id], [Sucur_Id], [Clien_Id], [Venen_FechaPedido], [Venen_UsuarioCreacion], [Venen_FechaCreacion], [Venen_UsuarioModificacion], [Venen_FechaModificacion], [Venen_Estado], [MtPag_Id], [Venen_NroTarjeta]) VALUES (79, 1, 5, CAST(N'2024-04-26' AS Date), 1, CAST(N'2024-04-26T02:21:40.980' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [Venta].[tbVentasEncabezado] ([Venen_Id], [Sucur_Id], [Clien_Id], [Venen_FechaPedido], [Venen_UsuarioCreacion], [Venen_FechaCreacion], [Venen_UsuarioModificacion], [Venen_FechaModificacion], [Venen_Estado], [MtPag_Id], [Venen_NroTarjeta]) VALUES (80, 1, 5, CAST(N'2024-04-26' AS Date), 1, CAST(N'2024-04-26T02:39:46.443' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [Venta].[tbVentasEncabezado] ([Venen_Id], [Sucur_Id], [Clien_Id], [Venen_FechaPedido], [Venen_UsuarioCreacion], [Venen_FechaCreacion], [Venen_UsuarioModificacion], [Venen_FechaModificacion], [Venen_Estado], [MtPag_Id], [Venen_NroTarjeta]) VALUES (81, 1, 5, CAST(N'2024-04-26' AS Date), 1, CAST(N'2024-04-26T02:40:53.013' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [Venta].[tbVentasEncabezado] ([Venen_Id], [Sucur_Id], [Clien_Id], [Venen_FechaPedido], [Venen_UsuarioCreacion], [Venen_FechaCreacion], [Venen_UsuarioModificacion], [Venen_FechaModificacion], [Venen_Estado], [MtPag_Id], [Venen_NroTarjeta]) VALUES (82, 1, 5, CAST(N'2024-04-26' AS Date), 1, CAST(N'2024-04-26T03:01:41.677' AS DateTime), NULL, NULL, 0, NULL, NULL)
INSERT [Venta].[tbVentasEncabezado] ([Venen_Id], [Sucur_Id], [Clien_Id], [Venen_FechaPedido], [Venen_UsuarioCreacion], [Venen_FechaCreacion], [Venen_UsuarioModificacion], [Venen_FechaModificacion], [Venen_Estado], [MtPag_Id], [Venen_NroTarjeta]) VALUES (83, 1, 5, CAST(N'2024-04-26' AS Date), 1, CAST(N'2024-04-26T13:21:27.103' AS DateTime), NULL, NULL, 1, NULL, NULL)
SET IDENTITY_INSERT [Venta].[tbVentasEncabezado] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_tbPantallas_Panta_Descripcion]    Script Date: 29/4/2024 12:48:16 ******/
ALTER TABLE [Acce].[tbPantallas] ADD  CONSTRAINT [UQ_tbPantallas_Panta_Descripcion] UNIQUE NONCLUSTERED 
(
	[Panta_Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_tbPantallasPorRoles_Panta_Id_Roles_Id]    Script Date: 29/4/2024 12:48:16 ******/
ALTER TABLE [Acce].[tbPantallasPorRoles] ADD  CONSTRAINT [UQ_tbPantallasPorRoles_Panta_Id_Roles_Id] UNIQUE NONCLUSTERED 
(
	[Panta_Id] ASC,
	[Roles_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_tbRoles_Roles_Descripcion]    Script Date: 29/4/2024 12:48:16 ******/
ALTER TABLE [Acce].[tbRoles] ADD  CONSTRAINT [UQ_tbRoles_Roles_Descripcion] UNIQUE NONCLUSTERED 
(
	[Roles_Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_tbUsuarios_Usuar_Usuario]    Script Date: 29/4/2024 12:48:16 ******/
ALTER TABLE [Acce].[tbUsuarios] ADD  CONSTRAINT [UQ_tbUsuarios_Usuar_Usuario] UNIQUE NONCLUSTERED 
(
	[Usuar_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_tbProductos_Produ_Descripcion]    Script Date: 29/4/2024 12:48:16 ******/
ALTER TABLE [Cmrl].[tbProductos] ADD  CONSTRAINT [UQ_tbProductos_Produ_Descripcion] UNIQUE NONCLUSTERED 
(
	[Produ_Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_tbProveedores_Marca_Id]    Script Date: 29/4/2024 12:48:16 ******/
ALTER TABLE [Cmrl].[tbProveedores] ADD  CONSTRAINT [UQ_tbProveedores_Marca_Id] UNIQUE NONCLUSTERED 
(
	[Prove_Marca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_tbSucurales_Sucur_Descripcion]    Script Date: 29/4/2024 12:48:16 ******/
ALTER TABLE [Cmrl].[tbSucursales] ADD  CONSTRAINT [UQ_tbSucurales_Sucur_Descripcion] UNIQUE NONCLUSTERED 
(
	[Sucur_Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_tbCargos_Cargo_Descripcion]    Script Date: 29/4/2024 12:48:16 ******/
ALTER TABLE [Gral].[tbCargos] ADD  CONSTRAINT [UQ_tbCargos_Cargo_Descripcion] UNIQUE NONCLUSTERED 
(
	[Cargo_Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_tbCategorias_Categ_Descripcion]    Script Date: 29/4/2024 12:48:16 ******/
ALTER TABLE [Gral].[tbCategorias] ADD  CONSTRAINT [UQ_tbCategorias_Categ_Descripcion] UNIQUE NONCLUSTERED 
(
	[Categ_Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_tbDepartamentos_Depar_Descripcion]    Script Date: 29/4/2024 12:48:16 ******/
ALTER TABLE [Gral].[tbDepartamentos] ADD  CONSTRAINT [UQ_tbDepartamentos_Depar_Descripcion] UNIQUE NONCLUSTERED 
(
	[Depar_Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_tbEstadosCiviles_Estad_Descripcion]    Script Date: 29/4/2024 12:48:16 ******/
ALTER TABLE [Gral].[tbEstadosCiviles] ADD  CONSTRAINT [UQ_tbEstadosCiviles_Estad_Descripcion] UNIQUE NONCLUSTERED 
(
	[Estad_Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_tbImpuestos_Impue_Descripcion]    Script Date: 29/4/2024 12:48:16 ******/
ALTER TABLE [Gral].[tbImpuestos] ADD  CONSTRAINT [UQ_tbImpuestos_Impue_Descripcion] UNIQUE NONCLUSTERED 
(
	[Impue_Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_tbUnidades_Unida_Descripcion]    Script Date: 29/4/2024 12:48:16 ******/
ALTER TABLE [Gral].[tbUnidades] ADD  CONSTRAINT [UQ_tbUnidades_Unida_Descripcion] UNIQUE NONCLUSTERED 
(
	[Unida_Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [Acce].[tbPantallas] ADD  CONSTRAINT [DF_tbPantallas_Panta_Estado]  DEFAULT ((1)) FOR [Panta_Estado]
GO
ALTER TABLE [Acce].[tbPantallasPorRoles] ADD  CONSTRAINT [DF_tbPantallasPorRoles_Papro_Estado]  DEFAULT ((1)) FOR [Papro_Estado]
GO
ALTER TABLE [Acce].[tbRoles] ADD  CONSTRAINT [DF_tbRoles_Roles_Estado]  DEFAULT ((1)) FOR [Roles_Estado]
GO
ALTER TABLE [Acce].[tbUsuarios] ADD  CONSTRAINT [DF_tbUsuarios_Usuar_Estado]  DEFAULT ((1)) FOR [Usuar_Estado]
GO
ALTER TABLE [Cmrl].[tbEmpleados] ADD  CONSTRAINT [DF_tbEmpleados_Emple_Estado]  DEFAULT ((1)) FOR [Emple_Estado]
GO
ALTER TABLE [Cmrl].[tbProductos] ADD  CONSTRAINT [DF_tbProductos_Produ_Estado]  DEFAULT ((1)) FOR [Produ_Estado]
GO
ALTER TABLE [Cmrl].[tbProveedores] ADD  CONSTRAINT [DF_tbProveedores_Prove_Estado]  DEFAULT ((1)) FOR [Prove_Estado]
GO
ALTER TABLE [Cmrl].[tbSucursales] ADD  CONSTRAINT [DF_tbSucursales_Sucur_Estado]  DEFAULT ((1)) FOR [Sucur_Estado]
GO
ALTER TABLE [Comp].[tbComprasDetalle] ADD  CONSTRAINT [DF_tbComprasDetalle_Comde_Estado]  DEFAULT ((1)) FOR [Comde_Estado]
GO
ALTER TABLE [Comp].[tbComprasEncabezado] ADD  CONSTRAINT [DF_tbComprasEncabezado_Comen_Estado]  DEFAULT ((1)) FOR [Comen_Estado]
GO
ALTER TABLE [Gral].[tbCargos] ADD  CONSTRAINT [DF_tbCargos_Cargo_Estado]  DEFAULT ((1)) FOR [Cargo_Estado]
GO
ALTER TABLE [Gral].[tbCategorias] ADD  CONSTRAINT [DF_tbCategorias_Categ_Estado]  DEFAULT ((1)) FOR [Categ_Estado]
GO
ALTER TABLE [Gral].[tbDepartamentos] ADD  CONSTRAINT [DF_tbDepartamentos_Depar_Estado]  DEFAULT ((1)) FOR [Depar_Estado]
GO
ALTER TABLE [Gral].[tbEstadosCiviles] ADD  CONSTRAINT [DF_tbEstadosCiviles_Estad_Estado]  DEFAULT ((1)) FOR [Estad_Estado]
GO
ALTER TABLE [Gral].[tbImpuestos] ADD  CONSTRAINT [DF_tbImpuestos_Impue_Estado]  DEFAULT ((1)) FOR [Impue_Estado]
GO
ALTER TABLE [Gral].[tbMunicipios] ADD  CONSTRAINT [DF_tbMunicipios_Munic_Estado]  DEFAULT ((1)) FOR [Munic_Estado]
GO
ALTER TABLE [Gral].[tbUnidades] ADD  CONSTRAINT [DF_tbUnidades_Unida_Estado]  DEFAULT ((1)) FOR [Unida_Estado]
GO
ALTER TABLE [Venta].[tbClientes] ADD  CONSTRAINT [DF_tbClientes_Clien_Estado]  DEFAULT ((1)) FOR [Clien_Estado]
GO
ALTER TABLE [Venta].[tbVentasDetalle] ADD  CONSTRAINT [DF_tbVentasDetalle_Vende_Estado]  DEFAULT ((1)) FOR [Vende_Estado]
GO
ALTER TABLE [Venta].[tbVentasEncabezado] ADD  CONSTRAINT [DF_tbVentasEncabezado_Venen_Estado]  DEFAULT ((1)) FOR [Venen_Estado]
GO
ALTER TABLE [Acce].[tbPantallas]  WITH CHECK ADD  CONSTRAINT [FK_tbPantallas_tbUsuarios_Panta_UsuarioCreacion] FOREIGN KEY([Panta_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usuar_Id])
GO
ALTER TABLE [Acce].[tbPantallas] CHECK CONSTRAINT [FK_tbPantallas_tbUsuarios_Panta_UsuarioCreacion]
GO
ALTER TABLE [Acce].[tbPantallas]  WITH CHECK ADD  CONSTRAINT [FK_tbPantallas_tbUsuarios_Panta_UsuarioModificacion] FOREIGN KEY([Panta_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usuar_Id])
GO
ALTER TABLE [Acce].[tbPantallas] CHECK CONSTRAINT [FK_tbPantallas_tbUsuarios_Panta_UsuarioModificacion]
GO
ALTER TABLE [Acce].[tbPantallasPorRoles]  WITH CHECK ADD  CONSTRAINT [FK_tbPantallasPorRoles_tbPantallas_Panta_Id] FOREIGN KEY([Panta_Id])
REFERENCES [Acce].[tbPantallas] ([Panta_Id])
GO
ALTER TABLE [Acce].[tbPantallasPorRoles] CHECK CONSTRAINT [FK_tbPantallasPorRoles_tbPantallas_Panta_Id]
GO
ALTER TABLE [Acce].[tbPantallasPorRoles]  WITH CHECK ADD  CONSTRAINT [FK_tbPantallasPorRoles_tbRoles_Roles_Id] FOREIGN KEY([Roles_Id])
REFERENCES [Acce].[tbRoles] ([Roles_Id])
GO
ALTER TABLE [Acce].[tbPantallasPorRoles] CHECK CONSTRAINT [FK_tbPantallasPorRoles_tbRoles_Roles_Id]
GO
ALTER TABLE [Acce].[tbPantallasPorRoles]  WITH CHECK ADD  CONSTRAINT [FK_tbPantallasPorRoles_tbUsuarios_Papro_UsuarioCreacion] FOREIGN KEY([Papro_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usuar_Id])
GO
ALTER TABLE [Acce].[tbPantallasPorRoles] CHECK CONSTRAINT [FK_tbPantallasPorRoles_tbUsuarios_Papro_UsuarioCreacion]
GO
ALTER TABLE [Acce].[tbPantallasPorRoles]  WITH CHECK ADD  CONSTRAINT [FK_tbPantallasPorRoles_tbUsuarios_Papro_UsuarioModificacion] FOREIGN KEY([Papro_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usuar_Id])
GO
ALTER TABLE [Acce].[tbPantallasPorRoles] CHECK CONSTRAINT [FK_tbPantallasPorRoles_tbUsuarios_Papro_UsuarioModificacion]
GO
ALTER TABLE [Acce].[tbRoles]  WITH CHECK ADD  CONSTRAINT [FK_tbRoles_tbUsuarios_Roles_UsuarioCreacion] FOREIGN KEY([Roles_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usuar_Id])
GO
ALTER TABLE [Acce].[tbRoles] CHECK CONSTRAINT [FK_tbRoles_tbUsuarios_Roles_UsuarioCreacion]
GO
ALTER TABLE [Acce].[tbRoles]  WITH CHECK ADD  CONSTRAINT [FK_tbRoles_tbUsuarios_Roles_UsuarioModificacion] FOREIGN KEY([Roles_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usuar_Id])
GO
ALTER TABLE [Acce].[tbRoles] CHECK CONSTRAINT [FK_tbRoles_tbUsuarios_Roles_UsuarioModificacion]
GO
ALTER TABLE [Acce].[tbUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_tbUsuarios_tbRoles_Roles_Id] FOREIGN KEY([Roles_Id])
REFERENCES [Acce].[tbRoles] ([Roles_Id])
GO
ALTER TABLE [Acce].[tbUsuarios] CHECK CONSTRAINT [FK_tbUsuarios_tbRoles_Roles_Id]
GO
ALTER TABLE [Acce].[tbUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_tbUsuarios_tbUsuarios_Usuar_UsuarioCreacion] FOREIGN KEY([Usuar_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usuar_Id])
GO
ALTER TABLE [Acce].[tbUsuarios] CHECK CONSTRAINT [FK_tbUsuarios_tbUsuarios_Usuar_UsuarioCreacion]
GO
ALTER TABLE [Acce].[tbUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_tbUsuarios_tbUsuarios_Usuar_UsuarioModificacion] FOREIGN KEY([Usuar_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usuar_Id])
GO
ALTER TABLE [Acce].[tbUsuarios] CHECK CONSTRAINT [FK_tbUsuarios_tbUsuarios_Usuar_UsuarioModificacion]
GO
ALTER TABLE [Cmrl].[tbEmpleados]  WITH CHECK ADD  CONSTRAINT [FK_tbEmpleados_tbCargos_Cargo_Id] FOREIGN KEY([Cargo_Id])
REFERENCES [Gral].[tbCargos] ([Cargo_Id])
GO
ALTER TABLE [Cmrl].[tbEmpleados] CHECK CONSTRAINT [FK_tbEmpleados_tbCargos_Cargo_Id]
GO
ALTER TABLE [Cmrl].[tbEmpleados]  WITH CHECK ADD  CONSTRAINT [FK_tbEmpleados_tbEstadosCiviles_Estad_Id] FOREIGN KEY([Estad_Id])
REFERENCES [Gral].[tbEstadosCiviles] ([Estad_Id])
GO
ALTER TABLE [Cmrl].[tbEmpleados] CHECK CONSTRAINT [FK_tbEmpleados_tbEstadosCiviles_Estad_Id]
GO
ALTER TABLE [Cmrl].[tbEmpleados]  WITH CHECK ADD  CONSTRAINT [FK_tbEmpleados_tbMunicipios_Munic_Id] FOREIGN KEY([Munic_Id])
REFERENCES [Gral].[tbMunicipios] ([Munic_Id])
GO
ALTER TABLE [Cmrl].[tbEmpleados] CHECK CONSTRAINT [FK_tbEmpleados_tbMunicipios_Munic_Id]
GO
ALTER TABLE [Cmrl].[tbEmpleados]  WITH CHECK ADD  CONSTRAINT [FK_tbEmpleados_tbSucursales_Sucur_Id] FOREIGN KEY([Sucur_Id])
REFERENCES [Cmrl].[tbSucursales] ([Sucur_Id])
GO
ALTER TABLE [Cmrl].[tbEmpleados] CHECK CONSTRAINT [FK_tbEmpleados_tbSucursales_Sucur_Id]
GO
ALTER TABLE [Cmrl].[tbEmpleados]  WITH CHECK ADD  CONSTRAINT [FK_tbEmpleados_tbUsuarios_Emple_UsuarioCreacion] FOREIGN KEY([Emple_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usuar_Id])
GO
ALTER TABLE [Cmrl].[tbEmpleados] CHECK CONSTRAINT [FK_tbEmpleados_tbUsuarios_Emple_UsuarioCreacion]
GO
ALTER TABLE [Cmrl].[tbEmpleados]  WITH CHECK ADD  CONSTRAINT [FK_tbEmpleados_tbUsuarios_Emple_UsuarioModificacion] FOREIGN KEY([Emple_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usuar_Id])
GO
ALTER TABLE [Cmrl].[tbEmpleados] CHECK CONSTRAINT [FK_tbEmpleados_tbUsuarios_Emple_UsuarioModificacion]
GO
ALTER TABLE [Cmrl].[tbProductos]  WITH CHECK ADD  CONSTRAINT [FK_tbProdcutos_tbProveedores_Prove_Id] FOREIGN KEY([Prove_Id])
REFERENCES [Cmrl].[tbProveedores] ([Prove_Id])
GO
ALTER TABLE [Cmrl].[tbProductos] CHECK CONSTRAINT [FK_tbProdcutos_tbProveedores_Prove_Id]
GO
ALTER TABLE [Cmrl].[tbProductos]  WITH CHECK ADD  CONSTRAINT [FK_tbProductos_tbCategorias_Categ_Id] FOREIGN KEY([Categ_Id])
REFERENCES [Gral].[tbCategorias] ([Categ_Id])
GO
ALTER TABLE [Cmrl].[tbProductos] CHECK CONSTRAINT [FK_tbProductos_tbCategorias_Categ_Id]
GO
ALTER TABLE [Cmrl].[tbProductos]  WITH CHECK ADD  CONSTRAINT [FK_tbProductos_tbImpuestos_Impue_Id] FOREIGN KEY([Impue_Id])
REFERENCES [Gral].[tbImpuestos] ([Impue_Id])
GO
ALTER TABLE [Cmrl].[tbProductos] CHECK CONSTRAINT [FK_tbProductos_tbImpuestos_Impue_Id]
GO
ALTER TABLE [Cmrl].[tbProductos]  WITH CHECK ADD  CONSTRAINT [FK_tbProductos_tbSucursales_Sucur_Id] FOREIGN KEY([Sucur_Id])
REFERENCES [Cmrl].[tbSucursales] ([Sucur_Id])
GO
ALTER TABLE [Cmrl].[tbProductos] CHECK CONSTRAINT [FK_tbProductos_tbSucursales_Sucur_Id]
GO
ALTER TABLE [Cmrl].[tbProductos]  WITH CHECK ADD  CONSTRAINT [FK_tbProductos_tbUnidades_Unida_Id] FOREIGN KEY([Unida_Id])
REFERENCES [Gral].[tbUnidades] ([Unida_Id])
GO
ALTER TABLE [Cmrl].[tbProductos] CHECK CONSTRAINT [FK_tbProductos_tbUnidades_Unida_Id]
GO
ALTER TABLE [Cmrl].[tbProductos]  WITH CHECK ADD  CONSTRAINT [FK_tbProductos_tbUsuarios_Produ_UsuarioCreacion] FOREIGN KEY([Produ_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usuar_Id])
GO
ALTER TABLE [Cmrl].[tbProductos] CHECK CONSTRAINT [FK_tbProductos_tbUsuarios_Produ_UsuarioCreacion]
GO
ALTER TABLE [Cmrl].[tbProductos]  WITH CHECK ADD  CONSTRAINT [FK_tbProductos_tbUsuarios_Produ_UsuarioModificacion] FOREIGN KEY([Produ_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usuar_Id])
GO
ALTER TABLE [Cmrl].[tbProductos] CHECK CONSTRAINT [FK_tbProductos_tbUsuarios_Produ_UsuarioModificacion]
GO
ALTER TABLE [Cmrl].[tbProveedores]  WITH CHECK ADD  CONSTRAINT [FK_tbProveedores_tbMunicipios_Munic_Id] FOREIGN KEY([Munic_Id])
REFERENCES [Gral].[tbMunicipios] ([Munic_Id])
GO
ALTER TABLE [Cmrl].[tbProveedores] CHECK CONSTRAINT [FK_tbProveedores_tbMunicipios_Munic_Id]
GO
ALTER TABLE [Cmrl].[tbProveedores]  WITH CHECK ADD  CONSTRAINT [FK_tbProveedores_tbUsuarios_Prove_UsuarioCreacion] FOREIGN KEY([Prove_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usuar_Id])
GO
ALTER TABLE [Cmrl].[tbProveedores] CHECK CONSTRAINT [FK_tbProveedores_tbUsuarios_Prove_UsuarioCreacion]
GO
ALTER TABLE [Cmrl].[tbProveedores]  WITH CHECK ADD  CONSTRAINT [FK_tbProveedores_tbUsuarios_Prove_UsuarioModificacion] FOREIGN KEY([Prove_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usuar_Id])
GO
ALTER TABLE [Cmrl].[tbProveedores] CHECK CONSTRAINT [FK_tbProveedores_tbUsuarios_Prove_UsuarioModificacion]
GO
ALTER TABLE [Cmrl].[tbSucursales]  WITH CHECK ADD  CONSTRAINT [FK_tbSucursales_tbMunicipios_Munic_Id] FOREIGN KEY([Munic_Id])
REFERENCES [Gral].[tbMunicipios] ([Munic_Id])
GO
ALTER TABLE [Cmrl].[tbSucursales] CHECK CONSTRAINT [FK_tbSucursales_tbMunicipios_Munic_Id]
GO
ALTER TABLE [Cmrl].[tbSucursales]  WITH CHECK ADD  CONSTRAINT [FK_tbSucursales_tbUsuarios_Sucur_UsuarioCreacion] FOREIGN KEY([Sucur_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usuar_Id])
GO
ALTER TABLE [Cmrl].[tbSucursales] CHECK CONSTRAINT [FK_tbSucursales_tbUsuarios_Sucur_UsuarioCreacion]
GO
ALTER TABLE [Cmrl].[tbSucursales]  WITH CHECK ADD  CONSTRAINT [FK_tbSucursales_tbUsuarios_Sucur_UsuarioModificacion] FOREIGN KEY([Sucur_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usuar_Id])
GO
ALTER TABLE [Cmrl].[tbSucursales] CHECK CONSTRAINT [FK_tbSucursales_tbUsuarios_Sucur_UsuarioModificacion]
GO
ALTER TABLE [Comp].[tbComprasDetalle]  WITH CHECK ADD  CONSTRAINT [FK_tbComprasDetalle_tbComprasEncabezado_Comen_Id] FOREIGN KEY([Comen_Id])
REFERENCES [Comp].[tbComprasEncabezado] ([Comen_Id])
GO
ALTER TABLE [Comp].[tbComprasDetalle] CHECK CONSTRAINT [FK_tbComprasDetalle_tbComprasEncabezado_Comen_Id]
GO
ALTER TABLE [Comp].[tbComprasDetalle]  WITH CHECK ADD  CONSTRAINT [FK_tbComprasDetalle_tbProductos_ProdU_Id] FOREIGN KEY([Produ_Id])
REFERENCES [Cmrl].[tbProductos] ([Produ_Id])
GO
ALTER TABLE [Comp].[tbComprasDetalle] CHECK CONSTRAINT [FK_tbComprasDetalle_tbProductos_ProdU_Id]
GO
ALTER TABLE [Comp].[tbComprasDetalle]  WITH CHECK ADD  CONSTRAINT [FK_tbComprasDetalle_tbUsuarios_Comde_UsuarioCreacion] FOREIGN KEY([Comde_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usuar_Id])
GO
ALTER TABLE [Comp].[tbComprasDetalle] CHECK CONSTRAINT [FK_tbComprasDetalle_tbUsuarios_Comde_UsuarioCreacion]
GO
ALTER TABLE [Comp].[tbComprasDetalle]  WITH CHECK ADD  CONSTRAINT [FK_tbComprasDetalle_tbUsuarios_Comde_UsuarioModificacion] FOREIGN KEY([Comde_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usuar_Id])
GO
ALTER TABLE [Comp].[tbComprasDetalle] CHECK CONSTRAINT [FK_tbComprasDetalle_tbUsuarios_Comde_UsuarioModificacion]
GO
ALTER TABLE [Comp].[tbComprasEncabezado]  WITH CHECK ADD  CONSTRAINT [FK_tbComprasEncabezado_tbEmpleados_Emple_Id] FOREIGN KEY([Emple_Id])
REFERENCES [Cmrl].[tbEmpleados] ([Emple_Id])
GO
ALTER TABLE [Comp].[tbComprasEncabezado] CHECK CONSTRAINT [FK_tbComprasEncabezado_tbEmpleados_Emple_Id]
GO
ALTER TABLE [Comp].[tbComprasEncabezado]  WITH CHECK ADD  CONSTRAINT [FK_tbComprasEncabezado_tbProveedores_Prove_Id] FOREIGN KEY([Prove_Id])
REFERENCES [Cmrl].[tbProveedores] ([Prove_Id])
GO
ALTER TABLE [Comp].[tbComprasEncabezado] CHECK CONSTRAINT [FK_tbComprasEncabezado_tbProveedores_Prove_Id]
GO
ALTER TABLE [Comp].[tbComprasEncabezado]  WITH CHECK ADD  CONSTRAINT [FK_tbComprasEncabezado_tbSucursales_Sucur_Id] FOREIGN KEY([Sucur_Id])
REFERENCES [Cmrl].[tbSucursales] ([Sucur_Id])
GO
ALTER TABLE [Comp].[tbComprasEncabezado] CHECK CONSTRAINT [FK_tbComprasEncabezado_tbSucursales_Sucur_Id]
GO
ALTER TABLE [Comp].[tbComprasEncabezado]  WITH CHECK ADD  CONSTRAINT [FK_tbComprasEncabezado_tbUsuarios_Comen_UsuarioCreacion] FOREIGN KEY([Comen_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usuar_Id])
GO
ALTER TABLE [Comp].[tbComprasEncabezado] CHECK CONSTRAINT [FK_tbComprasEncabezado_tbUsuarios_Comen_UsuarioCreacion]
GO
ALTER TABLE [Comp].[tbComprasEncabezado]  WITH CHECK ADD  CONSTRAINT [FK_tbComprasEncabezado_tbUsuarios_Comen_UsuarioModificacion] FOREIGN KEY([Comen_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usuar_Id])
GO
ALTER TABLE [Comp].[tbComprasEncabezado] CHECK CONSTRAINT [FK_tbComprasEncabezado_tbUsuarios_Comen_UsuarioModificacion]
GO
ALTER TABLE [Gral].[tbCargos]  WITH CHECK ADD  CONSTRAINT [FK_tbCargos_tbUsuarios_Cargo_UsuarioCreacion] FOREIGN KEY([Cargo_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usuar_Id])
GO
ALTER TABLE [Gral].[tbCargos] CHECK CONSTRAINT [FK_tbCargos_tbUsuarios_Cargo_UsuarioCreacion]
GO
ALTER TABLE [Gral].[tbCargos]  WITH CHECK ADD  CONSTRAINT [FK_tbCargos_tbUsuarios_Cargo_UsuarioModificacion] FOREIGN KEY([Cargo_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usuar_Id])
GO
ALTER TABLE [Gral].[tbCargos] CHECK CONSTRAINT [FK_tbCargos_tbUsuarios_Cargo_UsuarioModificacion]
GO
ALTER TABLE [Gral].[tbCategorias]  WITH CHECK ADD  CONSTRAINT [FK_tbCategorias_tbUsuarios_Categ_UsuarioCreacion] FOREIGN KEY([Categ_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usuar_Id])
GO
ALTER TABLE [Gral].[tbCategorias] CHECK CONSTRAINT [FK_tbCategorias_tbUsuarios_Categ_UsuarioCreacion]
GO
ALTER TABLE [Gral].[tbCategorias]  WITH CHECK ADD  CONSTRAINT [FK_tbCategorias_tbUsuarios_Categ_UsuarioModificacion] FOREIGN KEY([Categ_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usuar_Id])
GO
ALTER TABLE [Gral].[tbCategorias] CHECK CONSTRAINT [FK_tbCategorias_tbUsuarios_Categ_UsuarioModificacion]
GO
ALTER TABLE [Gral].[tbDepartamentos]  WITH CHECK ADD  CONSTRAINT [FK_tbDepartamentos_tbUsuarios_Depar_UsuarioCreacion] FOREIGN KEY([Depar_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usuar_Id])
GO
ALTER TABLE [Gral].[tbDepartamentos] CHECK CONSTRAINT [FK_tbDepartamentos_tbUsuarios_Depar_UsuarioCreacion]
GO
ALTER TABLE [Gral].[tbDepartamentos]  WITH CHECK ADD  CONSTRAINT [FK_tbDepartamentos_tbUsuarios_Depar_UsuarioModificacion] FOREIGN KEY([Depar_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usuar_Id])
GO
ALTER TABLE [Gral].[tbDepartamentos] CHECK CONSTRAINT [FK_tbDepartamentos_tbUsuarios_Depar_UsuarioModificacion]
GO
ALTER TABLE [Gral].[tbEstadosCiviles]  WITH CHECK ADD  CONSTRAINT [FK_tbEstadosCiviles_tbUsuarios_Estad_UsuarioCreacion] FOREIGN KEY([Estad_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usuar_Id])
GO
ALTER TABLE [Gral].[tbEstadosCiviles] CHECK CONSTRAINT [FK_tbEstadosCiviles_tbUsuarios_Estad_UsuarioCreacion]
GO
ALTER TABLE [Gral].[tbEstadosCiviles]  WITH CHECK ADD  CONSTRAINT [FK_tbEstadosCiviles_tbUsuarios_Estad_UsuarioModificacion] FOREIGN KEY([Estad_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usuar_Id])
GO
ALTER TABLE [Gral].[tbEstadosCiviles] CHECK CONSTRAINT [FK_tbEstadosCiviles_tbUsuarios_Estad_UsuarioModificacion]
GO
ALTER TABLE [Gral].[tbImpuestos]  WITH CHECK ADD  CONSTRAINT [FK_tbImpuestos_tbUsuarios_Impue_UsuarioCreacion] FOREIGN KEY([Impue_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usuar_Id])
GO
ALTER TABLE [Gral].[tbImpuestos] CHECK CONSTRAINT [FK_tbImpuestos_tbUsuarios_Impue_UsuarioCreacion]
GO
ALTER TABLE [Gral].[tbImpuestos]  WITH CHECK ADD  CONSTRAINT [FK_tbImpuestos_tbUsuarios_Impue_UsuarioModificacion] FOREIGN KEY([Impue_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usuar_Id])
GO
ALTER TABLE [Gral].[tbImpuestos] CHECK CONSTRAINT [FK_tbImpuestos_tbUsuarios_Impue_UsuarioModificacion]
GO
ALTER TABLE [Gral].[tbMunicipios]  WITH CHECK ADD  CONSTRAINT [FK_tbMunicipios_tbDepartamentos_Depar_Id] FOREIGN KEY([Depar_Id])
REFERENCES [Gral].[tbDepartamentos] ([Depar_Id])
GO
ALTER TABLE [Gral].[tbMunicipios] CHECK CONSTRAINT [FK_tbMunicipios_tbDepartamentos_Depar_Id]
GO
ALTER TABLE [Gral].[tbMunicipios]  WITH CHECK ADD  CONSTRAINT [FK_tbMunicipios_tbUsuarios_Munic_UsuarioCreacion] FOREIGN KEY([Munic_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usuar_Id])
GO
ALTER TABLE [Gral].[tbMunicipios] CHECK CONSTRAINT [FK_tbMunicipios_tbUsuarios_Munic_UsuarioCreacion]
GO
ALTER TABLE [Gral].[tbMunicipios]  WITH CHECK ADD  CONSTRAINT [FK_tbMunicipios_tbUsuarios_Munic_UsuarioModificacion] FOREIGN KEY([Munic_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usuar_Id])
GO
ALTER TABLE [Gral].[tbMunicipios] CHECK CONSTRAINT [FK_tbMunicipios_tbUsuarios_Munic_UsuarioModificacion]
GO
ALTER TABLE [Gral].[tbUnidades]  WITH CHECK ADD  CONSTRAINT [FK_tbUnidades_tbUsuarios_Unida_UsuarioCreacion] FOREIGN KEY([Unida_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usuar_Id])
GO
ALTER TABLE [Gral].[tbUnidades] CHECK CONSTRAINT [FK_tbUnidades_tbUsuarios_Unida_UsuarioCreacion]
GO
ALTER TABLE [Gral].[tbUnidades]  WITH CHECK ADD  CONSTRAINT [FK_tbUnidades_tbUsuarios_Unida_UsuarioModificacion] FOREIGN KEY([Unida_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usuar_Id])
GO
ALTER TABLE [Gral].[tbUnidades] CHECK CONSTRAINT [FK_tbUnidades_tbUsuarios_Unida_UsuarioModificacion]
GO
ALTER TABLE [Venta].[tbClientes]  WITH CHECK ADD  CONSTRAINT [FK_tbClientes_tbEstadosCiviles_Estad_Id] FOREIGN KEY([Estad_Id])
REFERENCES [Gral].[tbEstadosCiviles] ([Estad_Id])
GO
ALTER TABLE [Venta].[tbClientes] CHECK CONSTRAINT [FK_tbClientes_tbEstadosCiviles_Estad_Id]
GO
ALTER TABLE [Venta].[tbClientes]  WITH CHECK ADD  CONSTRAINT [FK_tbClientes_tbMunicipios_Munic_Id] FOREIGN KEY([Munic_Id])
REFERENCES [Gral].[tbMunicipios] ([Munic_Id])
GO
ALTER TABLE [Venta].[tbClientes] CHECK CONSTRAINT [FK_tbClientes_tbMunicipios_Munic_Id]
GO
ALTER TABLE [Venta].[tbClientes]  WITH CHECK ADD  CONSTRAINT [FK_tbClientes_tbUsuarios_Clien_UsuarioCreacion] FOREIGN KEY([Clien_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usuar_Id])
GO
ALTER TABLE [Venta].[tbClientes] CHECK CONSTRAINT [FK_tbClientes_tbUsuarios_Clien_UsuarioCreacion]
GO
ALTER TABLE [Venta].[tbClientes]  WITH CHECK ADD  CONSTRAINT [FK_tbClientes_tbUsuarios_Clien_UsuarioModificacion] FOREIGN KEY([Clien_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usuar_Id])
GO
ALTER TABLE [Venta].[tbClientes] CHECK CONSTRAINT [FK_tbClientes_tbUsuarios_Clien_UsuarioModificacion]
GO
ALTER TABLE [Venta].[tbVentasDetalle]  WITH CHECK ADD  CONSTRAINT [FK_tbVentasDetalle_tbProductos_ProdU_Id] FOREIGN KEY([Produ_Id])
REFERENCES [Cmrl].[tbProductos] ([Produ_Id])
GO
ALTER TABLE [Venta].[tbVentasDetalle] CHECK CONSTRAINT [FK_tbVentasDetalle_tbProductos_ProdU_Id]
GO
ALTER TABLE [Venta].[tbVentasDetalle]  WITH CHECK ADD  CONSTRAINT [FK_tbVentasDetalle_tbUsuarios_Vende_UsuarioCreacion] FOREIGN KEY([Vende_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usuar_Id])
GO
ALTER TABLE [Venta].[tbVentasDetalle] CHECK CONSTRAINT [FK_tbVentasDetalle_tbUsuarios_Vende_UsuarioCreacion]
GO
ALTER TABLE [Venta].[tbVentasDetalle]  WITH CHECK ADD  CONSTRAINT [FK_tbVentasDetalle_tbUsuarios_Vende_UsuarioModificacion] FOREIGN KEY([Vende_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usuar_Id])
GO
ALTER TABLE [Venta].[tbVentasDetalle] CHECK CONSTRAINT [FK_tbVentasDetalle_tbUsuarios_Vende_UsuarioModificacion]
GO
ALTER TABLE [Venta].[tbVentasDetalle]  WITH CHECK ADD  CONSTRAINT [FK_tbVentasDetalle_tbVentasEncabezado_Venen_Id] FOREIGN KEY([Venen_Id])
REFERENCES [Venta].[tbVentasEncabezado] ([Venen_Id])
GO
ALTER TABLE [Venta].[tbVentasDetalle] CHECK CONSTRAINT [FK_tbVentasDetalle_tbVentasEncabezado_Venen_Id]
GO
ALTER TABLE [Venta].[tbVentasEncabezado]  WITH CHECK ADD  CONSTRAINT [FK_tbVentasEncabezado_tbClientes_Clien_Id] FOREIGN KEY([Clien_Id])
REFERENCES [Venta].[tbClientes] ([Clien_Id])
GO
ALTER TABLE [Venta].[tbVentasEncabezado] CHECK CONSTRAINT [FK_tbVentasEncabezado_tbClientes_Clien_Id]
GO
ALTER TABLE [Venta].[tbVentasEncabezado]  WITH CHECK ADD  CONSTRAINT [FK_tbVentasEncabezado_tbMetodospago_MtPag_Id] FOREIGN KEY([MtPag_Id])
REFERENCES [Gral].[tbMetodospago] ([MtPag_Id])
GO
ALTER TABLE [Venta].[tbVentasEncabezado] CHECK CONSTRAINT [FK_tbVentasEncabezado_tbMetodospago_MtPag_Id]
GO
ALTER TABLE [Venta].[tbVentasEncabezado]  WITH CHECK ADD  CONSTRAINT [FK_tbVentasEncabezado_tbSucursales_Sucur_Id] FOREIGN KEY([Sucur_Id])
REFERENCES [Cmrl].[tbSucursales] ([Sucur_Id])
GO
ALTER TABLE [Venta].[tbVentasEncabezado] CHECK CONSTRAINT [FK_tbVentasEncabezado_tbSucursales_Sucur_Id]
GO
ALTER TABLE [Venta].[tbVentasEncabezado]  WITH CHECK ADD  CONSTRAINT [FK_tbVentasEncabezado_tbUsuarios_Venen_UsuarioCreacion] FOREIGN KEY([Venen_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usuar_Id])
GO
ALTER TABLE [Venta].[tbVentasEncabezado] CHECK CONSTRAINT [FK_tbVentasEncabezado_tbUsuarios_Venen_UsuarioCreacion]
GO
ALTER TABLE [Venta].[tbVentasEncabezado]  WITH CHECK ADD  CONSTRAINT [FK_tbVentasEncabezado_tbUsuarios_Venen_UsuarioModificacion] FOREIGN KEY([Venen_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usuar_Id])
GO
ALTER TABLE [Venta].[tbVentasEncabezado] CHECK CONSTRAINT [FK_tbVentasEncabezado_tbUsuarios_Venen_UsuarioModificacion]
GO
ALTER TABLE [Cmrl].[tbEmpleados]  WITH CHECK ADD  CONSTRAINT [CK_tbEmpleados_Emple_Sexo] CHECK  (([Emple_Sexo]='F' OR [Emple_Sexo]='M'))
GO
ALTER TABLE [Cmrl].[tbEmpleados] CHECK CONSTRAINT [CK_tbEmpleados_Emple_Sexo]
GO
ALTER TABLE [Venta].[tbClientes]  WITH CHECK ADD  CONSTRAINT [CK_tbClientes_Clien_Sexo] CHECK  (([Clien_Sexo]='F' OR [Clien_Sexo]='M'))
GO
ALTER TABLE [Venta].[tbClientes] CHECK CONSTRAINT [CK_tbClientes_Clien_Sexo]
GO
/****** Object:  StoredProcedure [Acce].[SP_Roles_DropDownList]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create proc [Acce].[SP_Roles_DropDownList]
  as
  begin
  select 
  Roles_Id,
  Roles_Descripcion
  from acce.tbRoles
  end
GO
/****** Object:  StoredProcedure [Acce].[SP_Usuarios_Buscar]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Acce].[SP_Usuarios_Buscar]
	@Usuar_Id INT
AS
BEGIN
	SELECT	us.*,
			rol.Roles_Descripcion,
			us1.Usuar_Usuario AS UsuarioCreacion,
			us2.Usuar_Usuario AS UsuarioModificacion,
			CONCAT(em.Emple_PrimerNombre, ' ' , em.Emple_PrimerApellido) empleado
FROM
[Acce].[tbUsuarios] us left JOIN [Cmrl].[tbEmpleados] em
on em.Emple_Id = us.Perso_Id left JOIN [Acce].[tbRoles] rol
on rol.Roles_Id = us.Roles_Id left JOIN[Acce].[tbUsuarios] us1
on us1.Usuar_UsuarioCreacion = us.Usuar_Id LEFT JOIN [Acce].[tbUsuarios] us2
on us2.Usuar_UsuarioModificacion = us.Usuar_Id
	WHERE us.Usuar_Id = @Usuar_Id
END
GO
/****** Object:  StoredProcedure [Acce].[SP_Usuarios_Eliminar]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [Acce].[SP_Usuarios_Eliminar]
@Usuar_Id INT
As
BEGIN 
	BEGIN TRY

		UPDATE [Acce].[tbUsuarios] 
		SET Usuar_Estado = 0
		
		WHERE Usuar_Id = @Usuar_Id 
		SELECT 1 AS Result;
	END TRY
	BEGIN CATCH
		SELECT 0 AS Result;
	END CATCH

END 

GO
/****** Object:  StoredProcedure [Acce].[SP_Usuarios_Insertar]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Acce].[SP_Usuarios_Insertar]
(
    @Usuar_Usuario NVARCHAR(50),
    @Usuar_Contrasena NVARCHAR(MAX),
    @Perso_Id INT,
    @Roles_Id INT,
    @Usuar_Admin BIT,
    @Usuar_Tipo BIT,
    @Usuar_UsuarioCreacion INT,
    @Usuar_FechaCreacion DATETIME
)
AS
BEGIN
    BEGIN TRY
        DECLARE @HASHBYTES NVARCHAR(MAX) = CONVERT(NVARCHAR(MAX), HASHBYTES('SHA2_512', @Usuar_Contrasena), 2)
        
        INSERT INTO [Acce].[tbUsuarios]([Usuar_Usuario], [Usuar_Contrasena], Perso_Id, [Roles_Id], [Usuar_Admin], Usuar_Tipo, [Usuar_UsuarioCreacion], [Usuar_FechaCreacion])
        VALUES (@Usuar_Usuario, @HASHBYTES, @Perso_Id, @Roles_Id, @Usuar_Admin, @Usuar_Tipo, @Usuar_UsuarioCreacion, @Usuar_FechaCreacion);

        SELECT 1 AS 'Result';
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(MAX) = ERROR_MESSAGE();
        SELECT 0 AS 'Result', @ErrorMessage AS 'ErrorMessage';
    END CATCH;
END
GO
/****** Object:  StoredProcedure [Acce].[SP_Usuarios_Lista]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Acce].[SP_Usuarios_Lista]
AS
BEGIN
	SELECT	us.*,
			CASE CAST(us.Usuar_Tipo AS BIT) 
                WHEN 1 THEN CONCAT(emp.Emple_PrimerNombre,' ',
					    CASE WHEN emp.Emple_SegundoNombre IS NULL THEN '' ELSE emp.Emple_SegundoNombre + ' ' END,
					    emp.Emple_PrimerApellido, 
					    CASE WHEN emp.Emple_SegundoApellido IS NULL THEN '' ELSE ' ' + emp.Emple_SegundoApellido END
				    ) 
                WHEN 0 THEN CONCAT(cli.Clien_PrimerNombre,' ',
					    CASE WHEN cli.Clien_SegundoNombre IS NULL THEN '' ELSE cli.Clien_SegundoNombre + ' ' END,
					    cli.Clien_PrimerApellido, 
					    CASE WHEN cli.Clien_SegundoApellido IS NULL THEN '' ELSE ' ' + cli.Clien_SegundoApellido END
				    ) 
            END AS Perso_NombreCompleto,
			rol.Roles_Descripcion
	FROM
	[Acce].[tbUsuarios] us 
	INNER JOIN [Cmrl].[tbEmpleados] emp on emp.Emple_Id = us.Perso_Id 
	LEFT JOIN Venta.tbClientes AS cli ON cli.Clien_Id = us.Perso_Id 
	INNER JOIN [Acce].[tbRoles] rol on rol.Roles_Id = us.Roles_Id 
	INNER JOIN Acce.tbUsuarios AS usu ON us.Usuar_UsuarioCreacion = usu.Usuar_Id 
	LEFT JOIN Acce.tbUsuarios AS usr ON us.Usuar_UsuarioModificacion	= usr.Usuar_Id
	where us.Usuar_Estado = 1
END
GO
/****** Object:  StoredProcedure [Acce].[SP_Usuarios_Login]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Acce].[SP_Usuarios_Login]
	@Usuario NVARCHAR(50),
	@Contrasena NVARCHAR(MAX)
AS
BEGIN
		DECLARE @HASHBYTES NVARCHAR(MAX) = CONVERT(NVARCHAR (MAX), HASHBYTES ('SHA2_512', @Contrasena), 2);		
		SELECT	usu.*,
				rol.Roles_Descripcion AS Roles_Descripcion,
				CASE CAST(usu.Usuar_Tipo AS BIT) 
                WHEN 1 THEN CONCAT(emp.Emple_PrimerNombre,' ',
					    CASE WHEN emp.Emple_SegundoNombre IS NULL THEN '' ELSE emp.Emple_SegundoNombre + ' ' END,
					    emp.Emple_PrimerApellido, 
					    CASE WHEN emp.Emple_SegundoApellido IS NULL THEN '' ELSE ' ' + emp.Emple_SegundoApellido END
				    ) 
                WHEN 0 THEN CONCAT(cli.Clien_PrimerNombre,' ',
					    CASE WHEN cli.Clien_SegundoNombre IS NULL THEN '' ELSE cli.Clien_SegundoNombre + ' ' END,
					    cli.Clien_PrimerApellido, 
					    CASE WHEN cli.Clien_SegundoApellido IS NULL THEN '' ELSE ' ' + cli.Clien_SegundoApellido END
				    ) 
            END AS Perso_NombreCompleto
		FROM Acce.tbUsuarios AS usu INNER JOIN Acce.tbRoles AS rol
		ON rol.Roles_Id = usu.Roles_Id INNER JOIN [Cmrl].tbEmpleados AS emp
		ON emp.Emple_Id = usu.Perso_Id LEFT JOIN Venta.tbClientes AS cli
		ON cli.Clien_Id = usu.Perso_Id 
		WHERE usu.Usuar_Usuario = @Usuario AND usu.Usuar_Contrasena = @HASHBYTES;
END
GO
/****** Object:  StoredProcedure [Acce].[SP_Usuarios_Modificar]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [Acce].[SP_Usuarios_Modificar]
@Usuar_Id INT,
@Usuar_Usuario VARCHAR(50),
@Perso_Id INT, 
@Roles_Id INT, 
@Usuar_Admin BIT, 
@Usuar_Tipo BIT,
@Usuar_UsuarioModificacion INT, 
@Usuar_FechaModificacion DATETIME
As
BEGIN 
	BEGIN TRY

		UPDATE [Acce].[tbUsuarios] 
		SET Usuar_Usuario = @Usuar_Usuario ,
		Perso_Id = @Perso_Id,
		Roles_Id = @Roles_Id,
		Usuar_Admin = @Usuar_Admin,
		Usuar_Tipo = @Usuar_Tipo,
		Usuar_UsuarioModificacion = @Usuar_UsuarioModificacion,
		Usuar_FechaModificacion = @Usuar_FechaModificacion
		WHERE Usuar_Id = @Usuar_Id 
		SELECT 1 AS Result;
	END TRY
	BEGIN CATCH
		SELECT 0 AS Result;
	END CATCH
END 
GO
/****** Object:  StoredProcedure [Acce].[SP_Usuarios_ReestablecerContrasenia]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [Acce].[SP_Usuarios_ReestablecerContrasenia]
@Usuar_Id INT,
@Usuar_Contrasena NVARCHAR(MAX)
As
BEGIN 
	BEGIN TRY
	
	DECLARE @HashContraseña NVARCHAR(MAX);
    SET @HashContraseña = CONVERT(NVARCHAR(MAX), HASHBYTES('SHA2_512', @Usuar_Contrasena), 2);
		
		UPDATE [Acce].[tbUsuarios] 
		SET 
		Usuar_Contrasena = @HashContraseña
		WHERE Usuar_Id = @Usuar_Id
		SELECT 1 AS Result;
	END TRY
	BEGIN CATCH
		SELECT 0 AS Result;
	END CATCH

END 
GO
/****** Object:  StoredProcedure [Acce].[SP_Usuarios_UltimaSesion]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [Acce].[SP_Usuarios_UltimaSesion]
@Usuar_Id INT,
@Usuar_UltimaSesion DATETIME
As
BEGIN 
	BEGIN TRY

		UPDATE [Acce].[tbUsuarios] 
		SET 
		Usuar_UltimaSesion = @Usuar_UltimaSesion
		WHERE Usuar_Id = @Usuar_Id 
		SELECT 1 AS Result;
	END TRY
	BEGIN CATCH
		SELECT 0 AS Result;
	END CATCH
END 
GO
/****** Object:  StoredProcedure [Cmrl].[SO_Sucursales_DDL]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROC [Cmrl].[SO_Sucursales_DDL]
  as begin
  select 
  Sucur_Id,
  Sucur_Descripcion
  from [Cmrl].tbSucursales
  end
GO
/****** Object:  StoredProcedure [Cmrl].[SP_Empleados_DropDownList]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [Cmrl].[SP_Empleados_DropDownList]
as
begin
select Emple_Id,
CONCAT(Emple_PrimerNombre, ' ', Emple_PrimerApellido) empleado

from [Cmrl].[tbEmpleados]
end
GO
/****** Object:  StoredProcedure [Cmrl].[SP_Productos_Buscar]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Cmrl].[SP_Productos_Buscar]
	@Produ_Id INT
AS
BEGIN
	SELECT	pro.*,
			uni.Unida_Descripcion,
			prv.Prove_Marca,
			usu.Usuar_Usuario AS UsuarioCreacion,
			usr.Usuar_Usuario AS UsuarioModificacion
	FROM [Cmrl].tbProductos AS pro INNER JOIN Gral.tbUnidades AS uni
	ON pro.Unida_Id = uni.Unida_Id INNER JOIN [Cmrl].tbProveedores AS prv
	ON pro.Prove_Id = prv.Prove_Id INNER JOIN Acce.tbUsuarios AS usu
	ON pro.Produ_UsuarioCreacion = usu.Usuar_Id LEFT JOIN Acce.tbUsuarios AS usr
	ON pro.Produ_UsuarioModificacion = usr.Usuar_Id
	WHERE pro.Produ_Id = @Produ_Id
END
GO
/****** Object:  StoredProcedure [Cmrl].[SP_Productos_Eliminar]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Cmrl].[SP_Productos_Eliminar]
(
    @Produ_Id INT
)
AS
BEGIN
    BEGIN TRY
        UPDATE [Cmrl].tbProductos
        SET Produ_Estado = 0
        WHERE Produ_Id = @Produ_Id;
        
        SELECT 1;
    END TRY
    BEGIN CATCH
        SELECT 0;
    END CATCH;
END
GO
/****** Object:  StoredProcedure [Cmrl].[SP_Productos_Insertar]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Cmrl].[SP_Productos_Insertar]
(
    @Produ_Descripcion NVARCHAR(50),
    @Produ_Existencia INT,
    @Unida_Id INT,
    @Produ_PrecioCompra NUMERIC(8,2),
    @Produ_PrecioVenta NUMERIC(8,2),
    @Impue_Id INT,
    @Categ_Id INT,
    @Prove_Id INT,
    @Sucur_Id INT,
    @Produ_UsuarioCreacion INT,
    @Produ_FechaCreacion DATETIME,
	@Produ_ImagenUrl VARCHAR(MAX)
)
AS
BEGIN
    BEGIN TRY
        INSERT INTO [Cmrl].tbProductos (Produ_Descripcion, Produ_Existencia, Unida_Id, Produ_PrecioCompra, Produ_PrecioVenta, Impue_Id, Categ_Id, Prove_Id, Sucur_Id, Produ_UsuarioCreacion, Produ_FechaCreacion, Produ_ImagenUrl)
        VALUES (@Produ_Descripcion, @Produ_Existencia, @Unida_Id, @Produ_PrecioCompra, @Produ_PrecioVenta, @Impue_Id, @Categ_Id, @Prove_Id, @Sucur_Id, @Produ_UsuarioCreacion, @Produ_FechaCreacion, @Produ_ImagenUrl);
        
        SELECT 1;
    END TRY
    BEGIN CATCH
        SELECT 0;
    END CATCH;
END
GO
/****** Object:  StoredProcedure [Cmrl].[SP_Productos_Lista]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Cmrl].[SP_Productos_Lista]
	@Categ_Id INT
AS
BEGIN
	SELECT	pro.*,
			uni.Unida_Descripcion,
			prv.Prove_Marca,
			imp.Impue_Descripcion
	FROM [Cmrl].tbProductos AS pro INNER JOIN Gral.tbUnidades AS uni
	ON pro.Unida_Id = uni.Unida_Id INNER JOIN [Cmrl].tbProveedores AS prv
	ON pro.Prove_Id = prv.Prove_Id  INNER JOIN Gral.tbImpuestos imp
	on imp.Impue_Id = pro.Impue_Id
	WHERE pro.Categ_Id = @Categ_Id
END
GO
/****** Object:  StoredProcedure [Cmrl].[SP_Productos_ListadoGeneral]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [Cmrl].[SP_Productos_ListadoGeneral]
AS
BEGIN
	SELECT	pro.*,
			uni.Unida_Descripcion,
			prv.Prove_Marca,
			imp.Impue_Descripcion, 
			cat.Categ_Descripcion
	FROM [Cmrl].tbProductos AS pro INNER JOIN Gral.tbUnidades AS uni
	ON pro.Unida_Id = uni.Unida_Id INNER JOIN [Cmrl].tbProveedores AS prv
	ON pro.Prove_Id = prv.Prove_Id  INNER JOIN Gral.tbImpuestos imp
	on imp.Impue_Id = pro.Impue_Id INNER JOIN gral.tbCategorias cat
	on pro.Categ_Id = cat.categ_Id
END
GO
/****** Object:  StoredProcedure [Cmrl].[SP_Productos_Modificar]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Cmrl].[SP_Productos_Modificar]
(
    @Produ_Id INT,
    @Produ_Descripcion NVARCHAR(50),
    @Produ_Existencia INT,
    @Unida_Id INT,
    @Produ_PrecioCompra NUMERIC(8,2),
    @Produ_PrecioVenta NUMERIC(8,2),
    @Impue_Id INT,
    @Categ_Id INT,
    @Prove_Id INT,
    @Sucur_Id INT,
    @Produ_UsuarioModificacion INT,
    @Produ_FechaModificacion DATETIME,
	@Produ_ImagenUrl VARCHAR(MAX)
)
AS
BEGIN
    BEGIN TRY
        UPDATE [Cmrl].tbProductos
        SET Produ_Descripcion = @Produ_Descripcion,
            Produ_Existencia = @Produ_Existencia,
            Unida_Id = @Unida_Id,
            Produ_PrecioCompra = @Produ_PrecioCompra,
            Produ_PrecioVenta = @Produ_PrecioVenta,
            Impue_Id = @Impue_Id,
            Categ_Id = @Categ_Id,
            Prove_Id = @Prove_Id,
            Sucur_Id = @Sucur_Id,
            Produ_UsuarioModificacion = @Produ_UsuarioModificacion,
            Produ_FechaModificacion = @Produ_FechaModificacion,
			Produ_ImagenUrl = @Produ_ImagenUrl
        WHERE Produ_Id = @Produ_Id;
        
        SELECT 1;
    END TRY
    BEGIN CATCH
        SELECT 0;
    END CATCH;
END

GO
/****** Object:  StoredProcedure [Cmrl].[SP_Sucursales_DDL]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROC [Cmrl].[SP_Sucursales_DDL]
  as begin
  select 
  Sucur_Id,
  Sucur_Descripcion
  from [Cmrl].tbSucursales
  end
GO
/****** Object:  StoredProcedure [Comp].[SP_ComprasDetalle_Buscar]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Comp].[SP_ComprasDetalle_Buscar]
    @Comde_Id INT
AS
BEGIN
    SELECT cd.*,
           prod.Produ_Descripcion,
           prod.Produ_PrecioCompra
    FROM Comp.tbComprasDetalle AS cd
    INNER JOIN [Cmrl].tbProductos AS prod ON cd.Produ_Id = prod.Produ_Id
    WHERE cd.Comde_Id = @Comde_Id;
END
GO
/****** Object:  StoredProcedure [Comp].[SP_ComprasDetalle_Desactivar]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Comp].[SP_ComprasDetalle_Desactivar]
(
    @Comde_Id INT,
    @Comde_UsuarioModificacion INT,
    @Comde_FechaModificacion DATETIME
)
AS
BEGIN
    BEGIN TRY
        UPDATE Comp.tbComprasDetalle
        SET Comde_Estado = 0,
            Comde_UsuarioModificacion = @Comde_UsuarioModificacion,
            Comde_FechaModificacion = @Comde_FechaModificacion
        WHERE Comde_Id = @Comde_Id;
        
        SELECT 1;
    END TRY
    BEGIN CATCH
        SELECT 0;
    END CATCH;
END
GO
/****** Object:  StoredProcedure [Comp].[SP_ComprasDetalle_Eliminar]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Comp].[SP_ComprasDetalle_Eliminar]
(
    @Comde_Id INT
)
AS
BEGIN
    BEGIN TRY
        DELETE FROM Comp.tbComprasDetalle
        WHERE Comde_Id = @Comde_Id
		SELECT 1
	END TRY
	BEGIN CATCH
		SELECT 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [Comp].[SP_ComprasDetalle_Insertar]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Comp].[SP_ComprasDetalle_Insertar]
(
    @Comen_Id INT,
    @Produ_Id INT,
    @Comde_Cantidad INT,
    @Comde_UsuarioCreacion INT,
    @Comde_FechaCreacion DATETIME
)
AS
BEGIN
    BEGIN TRY
        INSERT INTO Comp.tbComprasDetalle (Comen_Id, Produ_Id, Comde_Cantidad, Comde_UsuarioCreacion, Comde_FechaCreacion)
        VALUES (@Comen_Id, @Produ_Id, @Comde_Cantidad, @Comde_UsuarioCreacion, @Comde_FechaCreacion);
        
        SELECT 1;
    END TRY
    BEGIN CATCH
        SELECT 0;
    END CATCH;
END
GO
/****** Object:  StoredProcedure [Comp].[SP_ComprasDetalle_Lista]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Comp].[SP_ComprasDetalle_Lista]
AS
BEGIN
    SELECT cd.*,
           prod.Produ_Descripcion,
           prod.Produ_PrecioCompra
    FROM Comp.tbComprasDetalle AS cd
    INNER JOIN [Cmrl].tbProductos AS prod ON cd.Produ_Id = prod.Produ_Id
	ORDER BY cd.Comen_Id ASC
END
GO
/****** Object:  StoredProcedure [Comp].[SP_ComprasDetalle_Modificar]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Comp].[SP_ComprasDetalle_Modificar]
(
    @Comde_Id INT,
    @Comen_Id INT,
    @Produ_Id INT,
    @Comde_Cantidad INT,
    @Comde_UsuarioModificacion INT,
    @Comde_FechaModificacion DATETIME
)
AS
BEGIN
    BEGIN TRY
        UPDATE Comp.tbComprasDetalle
        SET Comen_Id = @Comen_Id,
            Produ_Id = @Produ_Id,
            Comde_Cantidad = @Comde_Cantidad,
            Comde_UsuarioModificacion = @Comde_UsuarioModificacion,
            Comde_FechaModificacion = @Comde_FechaModificacion
        WHERE Comde_Id = @Comde_Id;
        
        SELECT 1;
    END TRY
    BEGIN CATCH
        SELECT 0;
    END CATCH;
END
GO
/****** Object:  StoredProcedure [Comp].[SP_ComprasEncabezado_Buscar]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Comp].[SP_ComprasEncabezado_Buscar]
    @Comen_Id INT
AS
BEGIN
    SELECT ce.*,
			prov.Prove_Marca,
           suc.Sucur_Descripcion,
		   CONCAT(emp.Emple_PrimerNombre,' ',
					CASE WHEN emp.Emple_SegundoNombre IS NULL THEN '' ELSE emp.Emple_SegundoNombre + ' ' END,
					emp.Emple_PrimerApellido, 
					CASE WHEN emp.Emple_SegundoApellido IS NULL THEN '' ELSE ' ' + emp.Emple_SegundoApellido END
				) AS Emple_NombreCompleto,
           usuCreacion.Usuar_Usuario AS UsuarioCreacion,
           usuModificacion.Usuar_Usuario AS UsuarioModificacion
    FROM Comp.tbComprasEncabezado AS ce
	INNER JOIN [Cmrl].tbProveedores AS prov ON ce.Prove_Id = prov.Prove_Id
    INNER JOIN [Cmrl].tbSucursales AS suc ON ce.Sucur_Id = suc.Sucur_Id
	INNER JOIN [Cmrl].tbEmpleados AS emp ON ce.Emple_Id = emp.Emple_Id
    INNER JOIN Acce.tbUsuarios AS usuCreacion ON ce.Comen_UsuarioCreacion = usuCreacion.Usuar_Id
    LEFT JOIN Acce.tbUsuarios AS usuModificacion ON ce.Comen_UsuarioModificacion = usuModificacion.Usuar_Id
    WHERE ce.Comen_Id = @Comen_Id;
END
GO
/****** Object:  StoredProcedure [Comp].[SP_ComprasEncabezado_Desactivar]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Comp].[SP_ComprasEncabezado_Desactivar]
(
    @Comen_Id INT,
    @Comen_UsuarioModificacion INT,
    @Comen_FechaModificacion DATETIME
)
AS
BEGIN
    BEGIN TRY
        UPDATE Comp.tbComprasEncabezado
        SET Comen_Estado = 0,
            Comen_UsuarioModificacion = @Comen_UsuarioModificacion,
            Comen_FechaModificacion = @Comen_FechaModificacion
        WHERE Comen_Id = @Comen_Id;
        
        SELECT 1;
    END TRY
    BEGIN CATCH
        SELECT 0;
    END CATCH;
END
GO
/****** Object:  StoredProcedure [Comp].[SP_ComprasEncabezado_Eliminar]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Comp].[SP_ComprasEncabezado_Eliminar]
(
    @Comen_Id INT
)
AS
BEGIN
    BEGIN TRY
        DELETE FROM Comp.tbComprasEncabezado
        WHERE Comen_Id = @Comen_Id;
        
        SELECT 1;
    END TRY
    BEGIN CATCH
        SELECT 0;
    END CATCH;
END
GO
/****** Object:  StoredProcedure [Comp].[SP_ComprasEncabezado_Lista]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Comp].[SP_ComprasEncabezado_Lista]
AS
BEGIN
    SELECT ce.*,
           prov.Prove_Marca,
           suc.Sucur_Descripcion,
		   CONCAT(emp.Emple_PrimerNombre,' ',
					CASE WHEN emp.Emple_SegundoNombre IS NULL THEN '' ELSE emp.Emple_SegundoNombre + ' ' END,
					emp.Emple_PrimerApellido, 
					CASE WHEN emp.Emple_SegundoApellido IS NULL THEN '' ELSE ' ' + emp.Emple_SegundoApellido END
				) AS Emple_NombreCompleto
    FROM Comp.tbComprasEncabezado AS ce
    INNER JOIN [Cmrl].tbProveedores AS prov ON ce.Prove_Id = prov.Prove_Id
    INNER JOIN [Cmrl].tbSucursales AS suc ON ce.Sucur_Id = suc.Sucur_Id
	INNER JOIN [Cmrl].tbEmpleados AS emp ON ce.Emple_Id = emp.Emple_Id
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarVentasEncabezado]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROCEDURE [dbo].[ActualizarVentasEncabezado]
    @MtPag_Id INT,
    @Venen_Id INT
AS
BEGIN

    UPDATE TOP (1000) v
    SET v.[MtPag_Id] = @MtPag_Id,
        v.[Venen_Estado] = 0
    FROM [DB_SupermercadoInventario].[Venta].[tbVentasEncabezado] v
	INNER JOIN [Venta].[tbVentasDetalle] D
	ON D.Venen_Id = V.Venen_Id 
    INNER JOIN [DB_SupermercadoInventario].[Cmrl].[tbProductos] p ON D.[Produ_Id] = p.[Produ_Id]
    WHERE v.Venen_Id = @Venen_Id;
END;
GO
/****** Object:  StoredProcedure [Gral].[Cliente_Insertar]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


  CREATE   PROCEDURE [Gral].[Cliente_Insertar] (
    @PrimerNombre NVARCHAR(100),
    @SegundoNombre NVARCHAR(100),
    @PrimerApellido NVARCHAR(100),
    @SegundoApellido NVARCHAR(100),
    @Sexo CHAR(1),
    @EstadId INT,
    @Telefono NVARCHAR(20),
    @Correo NVARCHAR(100),
    @MunicId varchar(4),
    @Direccion NVARCHAR(200),
    @UsuarioCreacion int,
    @FechaCreacion DATETIME
)
AS
BEGIN
    INSERT INTO [DB_SupermercadoInventario].[Venta].[tbClientes] (
        [Clien_PrimerNombre],
        [Clien_SegundoNombre],
        [Clien_PrimerApellido],
        [Clien_SegundoApellido],
        [Clien_Sexo],
        [Estad_Id],
        [Clien_Telefono],
        [Clien_Correo],
        [Munic_Id],
        [Clien_Direccion],
        [Clien_UsuarioCreacion],
        [Clien_FechaCreacion]
    )
    VALUES (
        @PrimerNombre,
        @SegundoNombre,
        @PrimerApellido,
        @SegundoApellido,
        @Sexo,
        @EstadId,
        @Telefono,
        @Correo,
        @MunicId,
        @Direccion,
        @UsuarioCreacion,
        @FechaCreacion
    )
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Categoria_GuardarImagen]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  CREATE PROCEDURE [Gral].[SP_Categoria_GuardarImagen]
    @ImagenUrl NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [DB_SupermercadoInventario].[Gral].[tbCategorias] (Cate_ImagenUrl)
    VALUES (@ImagenUrl);
END;
GO
/****** Object:  StoredProcedure [Gral].[SP_Categorias_DDL]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Gral].[SP_Categorias_DDL]
as begin
	select 
	Categ_Id,
	Categ_Descripcion
	from Gral.tbCategorias
end
GO
/****** Object:  StoredProcedure [Gral].[SP_Categorias_Lista]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [Gral].[SP_Categorias_Lista]
AS
BEGIN
select
Categ_Id,
Categ_Descripcion,
Cate_ImagenUrl
from Gral.tbCategorias

END
GO
/****** Object:  StoredProcedure [Gral].[SP_Empleados_DropDownList]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  create proc [Gral].[SP_Empleados_DropDownList]
  as
  begin
  select 
[Emple_Id],
  CONCAT([Emple_PrimerNombre], [Emple_SegundoApellido])  empleado
  from [Cmrl].tbEmpleados
  end
GO
/****** Object:  StoredProcedure [Gral].[SP_EstadosCiviles_DropDownList]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

    CREATE proc [Gral].[SP_EstadosCiviles_DropDownList]
  as
  begin
  select 
  Estad_Id,
  Estad_Descripcion
  from Gral.tbEstadosCiviles
  end
GO
/****** Object:  StoredProcedure [Gral].[SP_Impuestos]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Gral].[SP_Impuestos]
as begin
	select 
	Impue_Id,
	Impue_Descripcion
	from Gral.tbImpuestos
end
GO
/****** Object:  StoredProcedure [Gral].[SP_Impuestos_DDL]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Gral].[SP_Impuestos_DDL]
as begin
	select 
	Impue_Id,
	Impue_Descripcion
	from Gral.tbImpuestos
end
GO
/****** Object:  StoredProcedure [Gral].[SP_Metodospago_DDL]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [Gral].[SP_Metodospago_DDL]
as begin
select 
MtPag_Id, MtPag_Descripcion
from Gral.tbMetodospago
end
GO
/****** Object:  StoredProcedure [Gral].[SP_Municipios_DropDownList]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [Gral].[SP_Municipios_DropDownList]
  as
  begin
  select 
  Munic_Id,
  Munic_Descripcion
  from Gral.tbMunicipios
  end
GO
/****** Object:  StoredProcedure [Gral].[SP_Provedores_DDL]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [Gral].[SP_Provedores_DDL]
as begin
	select 
	Prove_Id,
	Prove_Marca
	from [Cmrl].tbProveedores
end
GO
/****** Object:  StoredProcedure [Gral].[SP_Sucursales_DDL]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Gral].[SP_Sucursales_DDL]
as begin
	select 
	Sucur_Id,
	Sucur_Descripcion
	from [Cmrl].tbSucursales
end
GO
/****** Object:  StoredProcedure [Gral].[SP_Unidades_DDL]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [Gral].[SP_Unidades_DDL]
as begin
select
[Unida_Id],
[Unida_Descripcion]
from [Gral].[tbUnidades]
end
GO
/****** Object:  StoredProcedure [Grph].[SP_CantidadDeRegistrosDeClientesPorGeneroPorMes]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Grph].[SP_CantidadDeRegistrosDeClientesPorGeneroPorMes]
AS
BEGIN
    SELECT 
        --YEAR(usu.Usuar_FechaCreacion) AS Ano,
        --MONTH(usu.Usuar_FechaCreacion) AS Mes,
        cli.Clien_Sexo AS Genero,
        COUNT(*) AS Cantidad
    FROM Acce.tbUsuarios AS usu
	INNER JOIN Venta.tbClientes AS cli ON cli.Clien_Id = usu.Perso_Id
    WHERE usu.Usuar_Tipo = 0
    GROUP BY /*YEAR(usu.Usuar_FechaCreacion), MONTH(usu.Usuar_FechaCreacion),*/ cli.Clien_Sexo
    ORDER BY /*Ano, Mes,*/ Genero;
END
GO
/****** Object:  StoredProcedure [Grph].[SP_CantidadDeVentasPorGeneroAlMes]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Grph].[SP_CantidadDeVentasPorGeneroAlMes]
AS
BEGIN
    SELECT 
        --YEAR(ven.Venen_FechaPedido) AS Ano,
        --MONTH(ven.Venen_FechaPedido) AS Mes,
        cli.Clien_Sexo AS Genero,
        COUNT(*) AS Cantidad
    FROM Venta.tbVentasEncabezado AS ven 
	INNER JOIN Venta.tbClientes AS cli ON cli.Clien_Id = ven.Clien_Id
    WHERE ven.Venen_Estado = 0
	GROUP BY /*YEAR(ven.Venen_FechaPedido), MONTH(ven.Venen_FechaPedido),*/ cli.Clien_Sexo
    ORDER BY /*Ano, Mes,*/ Genero
END
GO
/****** Object:  StoredProcedure [Grph].[SP_TotalDeVentasPorCategoriaPorMes]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Grph].[SP_TotalDeVentasPorCategoriaPorMes]
AS
BEGIN
    SELECT 
        --YEAR(ven.Venen_FechaPedido) AS Ano,
        --MONTH(ven.Venen_FechaPedido) AS Mes,
        cat.Categ_Descripcion AS Categoria,
        SUM(pro.Produ_PrecioVenta * vde.Vende_Cantidad) AS Total
     FROM Venta.tbVentasEncabezado AS ven
	 INNER JOIN Venta.tbVentasDetalle AS vde ON ven.Venen_Id = vde.Venen_Id
	INNER JOIN [Cmrl].tbProductos AS pro ON pro.Produ_Id = vde.Produ_Id
	LEFT JOIN Gral.tbCategorias AS cat ON cat.Categ_Id = pro.Categ_Id
	WHERE ven.Venen_Estado = 0
    GROUP BY /*YEAR(ven.Venen_FechaPedido), MONTH(ven.Venen_FechaPedido),*/ cat.Categ_Descripcion
    ORDER BY /*Ano, Mes,*/ Categoria;
END
GO
/****** Object:  StoredProcedure [Grph].[SP_TotalGananciaPorMes]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Grph].[SP_TotalGananciaPorMes]
AS
BEGIN
    SELECT 
        --YEAR(ven.Venen_FechaPedido) AS Ano,
        MONTH(ven.Venen_FechaPedido) AS Mes,
        SUM(T.TotalFactura) AS Total
    FROM (
		SELECT	ven.Venen_Id,
				SUM(pro.Produ_PrecioVenta * vde.Vende_Cantidad) AS TotalFactura
		FROM Venta.tbVentasEncabezado AS ven
		INNER JOIN Venta.tbVentasDetalle AS vde ON ven.Venen_Id = vde.Venen_Id
		INNER JOIN [Cmrl].tbProductos AS pro ON pro.Produ_Id = vde.Produ_Id
		WHERE ven.Venen_Estado = 0
		GROUP BY(ven.Venen_Id)
	) AS T
	INNER JOIN Venta.tbVentasEncabezado AS ven ON ven.Venen_Id = T.Venen_Id
    GROUP BY /*YEAR(ven.Venen_FechaPedido),*/ MONTH(ven.Venen_FechaPedido)
    ORDER BY /*Ano,*/ Mes;
END
GO
/****** Object:  StoredProcedure [Venta].[Productos_CargarDetalles]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create   PROC [Venta].[Productos_CargarDetalles] 
@Produ_Id INT,
@Vende_Id INT
as begin

select 
enc.*,
det.*,
pro.*,
cli.*,
suc.*,
uni.*,
imp.*,
met.*,
CONCAT(cli.Clien_PrimerNombre, ' ', cli.Clien_SegundoNombre, ' ', cli.Clien_PrimerApellido, ' ', cli.Clien_SegundoApellido) cliente
from [Venta].[tbVentasEncabezado] enc left JOIN [Venta].[tbVentasDetalle] det
    on enc.Venen_Id = det.Venen_Id left JOIN [Cmrl].tbProductos AS pro
	on pro.Produ_Id = det.Produ_Id  left JOIN Gral.tbImpuestos imp
	on imp.Impue_Id = pro.Impue_Id  left JOIN Gral.tbUnidades AS uni
	ON pro.Unida_Id = uni.Unida_Id left join [Venta].[tbClientes] cli
	on cli.Clien_Id = enc.Clien_Id left join [Cmrl].[tbSucursales] suc
	on suc.Sucur_Id = enc.Sucur_Id left join [Gral].[tbMetodospago] met
	on met.MtPag_Id = enc.MtPag_Id
	where enc.Venen_Estado = 1 and pro.Produ_Id = @Produ_Id and det.Vende_Estado = 1 and det.Vende_Id = @Vende_Id
end


GO
/****** Object:  StoredProcedure [Venta].[SP_Clientes_Numeration]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Venta].[SP_Clientes_Numeration]
AS
BEGIN
	SELECT TOP(1) cli.Clien_Id
	FROM Venta.tbClientes AS cli
	ORDER BY cli.Clien_Id DESC
END
GO
/****** Object:  StoredProcedure [Venta].[SP_VentasDetalle_Buscar]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Venta].[SP_VentasDetalle_Buscar]
	@Venen_Id INT
AS
BEGIN
	SELECT	ven.*,
			pro.Produ_Descripcion,
			pro.Produ_PrecioVenta
	FROM Venta.tbVentasDetalle AS ven INNER JOIN [Cmrl].tbProductos AS pro
	ON ven.Produ_Id = pro.Produ_Id
	WHERE ven.Venen_Id = @Venen_Id
END
GO
/****** Object:  StoredProcedure [Venta].[SP_VentasDetalle_Desactivar]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Venta].[SP_VentasDetalle_Desactivar]
(
    @Vende_Id INT,
    @Vende_UsuarioModificacion INT,
    @Vende_FechaModificacion DATETIME
)
AS
BEGIN
    BEGIN TRY
        UPDATE Venta.tbVentasDetalle
        SET Vende_Estado = 0,
            Vende_UsuarioModificacion = @Vende_UsuarioModificacion,
            Vende_FechaModificacion = @Vende_FechaModificacion
        WHERE Vende_Id = @Vende_Id;
        
        SELECT 1;
    END TRY
    BEGIN CATCH
        SELECT 0;
    END CATCH;
END
GO
/****** Object:  StoredProcedure [Venta].[SP_VentasDetalle_Eliminar]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Venta].[SP_VentasDetalle_Eliminar]
(
    @Vende_Id INT
)
AS
BEGIN
    BEGIN TRY
        DELETE FROM Venta.tbVentasDetalle
        WHERE Vende_Id = @Vende_Id;
        
        SELECT 1;
    END TRY
    BEGIN CATCH
        SELECT 0;
    END CATCH;
END
GO
/****** Object:  StoredProcedure [Venta].[SP_VentasDetalle_Insertar]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Venta].[SP_VentasDetalle_Insertar]
(
    @Venen_Id INT,
    @Produ_Id INT,
    @Vende_Cantidad INT,
    @Vende_UsuarioCreacion INT,
    @Vende_FechaCreacion DATETIME
)
AS
BEGIN
    BEGIN TRY
        INSERT INTO Venta.tbVentasDetalle (Venen_Id, Produ_Id, Vende_Cantidad, Vende_UsuarioCreacion, Vende_FechaCreacion)
        VALUES (@Venen_Id, @Produ_Id, @Vende_Cantidad, @Vende_UsuarioCreacion, @Vende_FechaCreacion);
        
        SELECT 1;
    END TRY
    BEGIN CATCH
        SELECT 0;
    END CATCH;
END
GO
/****** Object:  StoredProcedure [Venta].[SP_VentasDetalle_List]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Venta].[SP_VentasDetalle_List]
AS
BEGIN
	SELECT	ven.*,
			pro.Produ_Descripcion,
			pro.Produ_PrecioVenta
	FROM Venta.tbVentasDetalle AS ven INNER JOIN [Cmrl].tbProductos AS pro
	ON ven.Produ_Id = pro.Produ_Id
	ORDER BY ven.Venen_Id ASC
END
GO
/****** Object:  StoredProcedure [Venta].[SP_VentasDetalle_Modificar]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Venta].[SP_VentasDetalle_Modificar]
(
    @Vende_Id INT,
    @Venen_Id INT,
    @Produ_Id INT,
    @Vende_Cantidad INT,
    @Vende_UsuarioModificacion INT,
    @Vende_FechaModificacion DATETIME
)
AS
BEGIN
    BEGIN TRY
        UPDATE Venta.tbVentasDetalle
        SET Venen_Id = @Venen_Id,
            Produ_Id = @Produ_Id,
            Vende_Cantidad = @Vende_Cantidad,
            Vende_UsuarioModificacion = @Vende_UsuarioModificacion,
            Vende_FechaModificacion = @Vende_FechaModificacion
        WHERE Vende_Id = @Vende_Id;
        
        SELECT 1;
    END TRY
    BEGIN CATCH
        SELECT 0;
    END CATCH;
END

GO
/****** Object:  StoredProcedure [Venta].[SP_VentasEncabezado_Buscar]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Venta].[SP_VentasEncabezado_Buscar]
	@Venen_Id INT
AS
BEGIN
	SELECT	ven.*,
			usu.Usuar_Usuario AS UsuarioCreacion,
			usr.Usuar_Usuario AS UsuarioModificacion
	FROM Venta.tbVentasEncabezado AS ven INNER JOIN [Cmrl].tbSucursales AS suc
	ON ven.Sucur_Id = suc.Sucur_Id INNER JOIN Acce.tbUsuarios AS usu
	ON ven.Venen_UsuarioCreacion = usu.Usuar_Id LEFT JOIN Acce.tbUsuarios AS usr
	ON ven.Venen_UsuarioModificacion = usr.Usuar_Id
	WHERE ven.Venen_Id = @Venen_Id
END
GO
/****** Object:  StoredProcedure [Venta].[SP_VentasEncabezado_Desactivar]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Venta].[SP_VentasEncabezado_Desactivar]
(
    @Venen_Id INT,
    @Venen_UsuarioModificacion INT,
    @Venen_FechaModificacion DATETIME
)
AS
BEGIN
    BEGIN TRY
        UPDATE Venta.tbVentasEncabezado
        SET Venen_Estado = 0,
            Venen_UsuarioModificacion = @Venen_UsuarioModificacion,
            Venen_FechaModificacion = @Venen_FechaModificacion
        WHERE Venen_Id = @Venen_Id;
        
        SELECT 1;
    END TRY
    BEGIN CATCH
        SELECT 0;
    END CATCH;
END
GO
/****** Object:  StoredProcedure [Venta].[SP_VentasEncabezado_Eliminar]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Venta].[SP_VentasEncabezado_Eliminar]
(
    @Venen_Id INT
)
AS
BEGIN
    BEGIN TRY
        update Venta.tbVentasEncabezado
		set Venen_Estado = 0
        WHERE Venen_Id = @Venen_Id;   
        SELECT 1;
    END TRY
    BEGIN CATCH
        SELECT 0;
    END CATCH;
END
GO
/****** Object:  StoredProcedure [Venta].[SP_VentasEncabezado_Insertar]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Venta].[SP_VentasEncabezado_Insertar]
(
    @Sucur_Id INT,
    @Venen_FechaPedido DATE,
    @Venen_UsuarioCreacion INT,
    @Venen_FechaCreacion DATETIME,
    @Clien_Id INT,
    @Venen_Id INT OUTPUT -- Parámetro de salida para el Venen_Id
)
AS
BEGIN
    BEGIN TRY
        INSERT INTO Venta.tbVentasEncabezado (Sucur_Id, Venen_FechaPedido, Venen_UsuarioCreacion, Venen_FechaCreacion, Clien_Id)
        VALUES (@Sucur_Id, @Venen_FechaPedido, @Venen_UsuarioCreacion, @Venen_FechaCreacion, @Clien_Id);

        -- Obtener el Venen_Id generado y asignarlo al parámetro de salida
        SELECT @Venen_Id = SCOPE_IDENTITY();
        
        SELECT @Venen_Id; -- Devolver el Venen_Id
    END TRY
    BEGIN CATCH
        SELECT 0; -- Si hay un error, devolver 0
    END CATCH;
END
GO
/****** Object:  StoredProcedure [Venta].[SP_VentasEncabezado_Lista]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Venta].[SP_VentasEncabezado_Lista]
AS
BEGIN
	SELECT	ven.*,
			suc.Sucur_Descripcion
	FROM Venta.tbVentasEncabezado AS ven INNER JOIN [Cmrl].tbSucursales AS suc
	ON ven.Sucur_Id = suc.Sucur_Id
END
GO
/****** Object:  StoredProcedure [Venta].[SP_VentasEncabezado_Modificar]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Venta].[SP_VentasEncabezado_Modificar]
(
    @Venen_Id INT,
    @Sucur_Id INT,
    @Venen_FechaPedido DATE,
    @Venen_UsuarioModificacion INT,
    @Venen_FechaModificacion DATETIME,
	@Clien_Id INT
)
AS
BEGIN
    BEGIN TRY
        UPDATE Venta.tbVentasEncabezado
        SET Sucur_Id = @Sucur_Id,
            Venen_FechaPedido = @Venen_FechaPedido,
            Venen_UsuarioModificacion = @Venen_UsuarioModificacion,
            Venen_FechaModificacion = @Venen_FechaModificacion,
			Clien_Id = @Clien_Id
        WHERE Venen_Id = @Venen_Id;
        
        SELECT 1;
    END TRY
    BEGIN CATCH
        SELECT 0;
    END CATCH;
END
GO
/****** Object:  StoredProcedure [Venta].[VentasDetalle_ListadoCarrito]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [Venta].[VentasDetalle_ListadoCarrito]
as begin

select 
enc.*,
det.*,
pro.*,
cli.*,
suc.*,
uni.*,
imp.*,
CONCAT(cli.Clien_PrimerNombre, ' ', cli.Clien_SegundoNombre, ' ', cli.Clien_PrimerApellido, ' ', cli.Clien_SegundoApellido) cliente
from [Venta].[tbVentasEncabezado] enc left JOIN [Venta].[tbVentasDetalle] det
    on enc.Venen_Id = det.Venen_Id left JOIN [Cmrl].tbProductos AS pro
	on pro.Produ_Id = det.Produ_Id  left JOIN Gral.tbImpuestos imp
	on imp.Impue_Id = pro.Impue_Id  left JOIN Gral.tbUnidades AS uni
	ON pro.Unida_Id = uni.Unida_Id left join [Venta].[tbClientes] cli
	on cli.Clien_Id = enc.Clien_Id left join [Cmrl].[tbSucursales] suc
	on suc.Sucur_Id = enc.Sucur_Id
	where enc.Venen_Estado = 1 
end
GO
/****** Object:  StoredProcedure [Venta].[VentasDetalle_ListadoCarritoPrincipal]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Venta].[VentasDetalle_ListadoCarritoPrincipal]
@Clien_Id INT
as begin

select 
enc.*,
det.*,
pro.*,
cli.*,
suc.*,
uni.*,
imp.*,
met.*,
CONCAT(cli.Clien_PrimerNombre, ' ', cli.Clien_SegundoNombre, ' ', cli.Clien_PrimerApellido, ' ', cli.Clien_SegundoApellido) cliente
from [Venta].[tbVentasEncabezado] enc left JOIN [Venta].[tbVentasDetalle] det
    on enc.Venen_Id = det.Venen_Id left JOIN [Cmrl].tbProductos AS pro
	on pro.Produ_Id = det.Produ_Id  left JOIN Gral.tbImpuestos imp
	on imp.Impue_Id = pro.Impue_Id  left JOIN Gral.tbUnidades AS uni
	ON pro.Unida_Id = uni.Unida_Id left join [Venta].[tbClientes] cli
	on cli.Clien_Id = enc.Clien_Id left join [Cmrl].[tbSucursales] suc
	on suc.Sucur_Id = enc.Sucur_Id left join [Gral].[tbMetodospago] met
	on met.MtPag_Id = enc.MtPag_Id
	where enc.Venen_Estado = 1  and enc.Clien_Id = @Clien_Id  and det.Vende_Estado = 1
end
GO
/****** Object:  StoredProcedure [Venta].[VentasEncabezado_EmisionFactura]    Script Date: 29/4/2024 12:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [Venta].[VentasEncabezado_EmisionFactura]
    @MtPag_Id INT,
    @Venen_Id INT,
	@Venen_NroTarjeta VARCHAR(50)
AS
BEGIN

    UPDATE TOP (1000) v
    SET v.[MtPag_Id] = @MtPag_Id,
	v.Venen_NroTarjeta = @Venen_NroTarjeta,
        v.[Venen_Estado] = 0
    FROM [DB_SupermercadoInventario].[Venta].[tbVentasEncabezado] v
	INNER JOIN [Venta].[tbVentasDetalle] D
	ON D.Venen_Id = V.Venen_Id 
    INNER JOIN [DB_SupermercadoInventario].[Cmrl].[tbProductos] p ON D.[Produ_Id] = p.[Produ_Id]
    WHERE v.Venen_Id = @Venen_Id
	 AND D.Vende_Estado = 1
END;
GO
