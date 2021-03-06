USE [master]
GO
/****** Object:  Database [MAXI-PEZ]    Script Date: 24/05/2019 3:21:16 p. m. ******/
CREATE DATABASE [MAXI-PEZ]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MAXI-PEZ', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\MAXI-PEZ.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MAXI-PEZ_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\MAXI-PEZ_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MAXI-PEZ] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MAXI-PEZ].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MAXI-PEZ] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MAXI-PEZ] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MAXI-PEZ] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MAXI-PEZ] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MAXI-PEZ] SET ARITHABORT OFF 
GO
ALTER DATABASE [MAXI-PEZ] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MAXI-PEZ] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MAXI-PEZ] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MAXI-PEZ] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MAXI-PEZ] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MAXI-PEZ] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MAXI-PEZ] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MAXI-PEZ] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MAXI-PEZ] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MAXI-PEZ] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MAXI-PEZ] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MAXI-PEZ] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MAXI-PEZ] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MAXI-PEZ] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MAXI-PEZ] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MAXI-PEZ] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MAXI-PEZ] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MAXI-PEZ] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MAXI-PEZ] SET  MULTI_USER 
GO
ALTER DATABASE [MAXI-PEZ] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MAXI-PEZ] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MAXI-PEZ] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MAXI-PEZ] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MAXI-PEZ] SET DELAYED_DURABILITY = DISABLED 
GO
USE [MAXI-PEZ]
GO
/****** Object:  Table [dbo].[Asignaturas]    Script Date: 24/05/2019 3:21:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Asignaturas](
	[Codigo] [int] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CLIENTES]    Script Date: 24/05/2019 3:21:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENTES](
	[Id_Cliente] [int] IDENTITY(1,1) NOT NULL,
	[Primer_Nombre] [nvarchar](50) NULL,
	[Segundo_Nombre] [nvarchar](50) NULL,
	[Primer_Apellido] [nvarchar](50) NULL,
	[Segundo_Apellido] [nvarchar](50) NULL,
	[Direccion] [nvarchar](20) NULL,
	[Telefono] [nvarchar](10) NULL,
	[Correo] [nvarchar](50) NULL,
	[Fecha_Nacimiento] [date] NULL,
 CONSTRAINT [PK_CLIENTES] PRIMARY KEY CLUSTERED 
(
	[Id_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DEVOLUCIONES]    Script Date: 24/05/2019 3:21:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DEVOLUCIONES](
	[Id_Devoluciones] [int] IDENTITY(1,1) NOT NULL,
	[Cantidad] [int] NULL,
	[Fecha] [date] NULL,
	[Cambio] [nvarchar](50) NULL,
	[Id_Factura] [int] NULL,
	[Observacion] [nvarchar](50) NULL,
	[Id_Producto] [int] NULL,
 CONSTRAINT [PK_DEVOLUCIONES] PRIMARY KEY CLUSTERED 
(
	[Id_Devoluciones] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FACTURAS]    Script Date: 24/05/2019 3:21:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACTURAS](
	[Id_Factura] [int] IDENTITY(1,1) NOT NULL,
	[Venta_Id] [int] NULL,
	[Fecha] [date] NULL,
	[Direccion] [nvarchar](10) NULL,
	[RazonSocial] [nvarchar](50) NULL,
	[Id_Cliente] [int] NULL,
 CONSTRAINT [PK_FACTURAS] PRIMARY KEY CLUSTERED 
(
	[Id_Factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[INVENTARIOS]    Script Date: 24/05/2019 3:21:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INVENTARIOS](
	[Id_Inventario] [int] IDENTITY(1,1) NOT NULL,
	[Id_Producto] [int] NULL,
	[Id_Proveedor] [int] NULL,
	[Cantidad] [int] NULL,
	[Fecha] [date] NULL,
 CONSTRAINT [PK_INVENTARIOS] PRIMARY KEY CLUSTERED 
(
	[Id_Inventario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PRODUCTOS]    Script Date: 24/05/2019 3:21:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTOS](
	[Id_Producto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Producto] [nvarchar](50) NULL,
	[Descripcion] [nvarchar](50) NULL,
	[Precio] [money] NULL,
 CONSTRAINT [PK_PRODUCTOS] PRIMARY KEY CLUSTERED 
(
	[Id_Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PROMOCIONES]    Script Date: 24/05/2019 3:21:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROMOCIONES](
	[Id_Promociones] [int] IDENTITY(1,1) NOT NULL,
	[Fecha_Hasta] [date] NULL,
	[Descuento] [money] NULL,
 CONSTRAINT [PK_PROMOCIONES] PRIMARY KEY CLUSTERED 
(
	[Id_Promociones] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PROVEEDOR_PRODUCTO]    Script Date: 24/05/2019 3:21:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROVEEDOR_PRODUCTO](
	[Cantidad] [int] NULL,
	[Valor] [money] NULL,
	[Id_Proveedor] [int] NOT NULL,
	[Id_Producto] [int] NOT NULL,
 CONSTRAINT [PK_PROVEEDOR_PRODUCTO] PRIMARY KEY CLUSTERED 
(
	[Id_Proveedor] ASC,
	[Id_Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PROVEEDORES]    Script Date: 24/05/2019 3:21:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROVEEDORES](
	[Id_Proveedor] [int] IDENTITY(1,1) NOT NULL,
	[Primer_Nombre] [nvarchar](50) NULL,
	[Segundo_Nombre] [nvarchar](50) NULL,
	[Primer_Apellido] [nvarchar](50) NULL,
	[Segundo_Apellido] [nvarchar](50) NULL,
	[Empresa] [nvarchar](50) NULL,
	[Direccion] [nvarchar](10) NULL,
	[Telefono] [nvarchar](10) NULL,
	[Correo] [nvarchar](50) NULL,
	[Fecha_Nacimiento] [date] NULL,
 CONSTRAINT [PK_PROVEEDORES] PRIMARY KEY CLUSTERED 
(
	[Id_Proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TIPOPAGO]    Script Date: 24/05/2019 3:21:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPOPAGO](
	[Id_Pago] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NULL,
 CONSTRAINT [PK_TIPOPAGO] PRIMARY KEY CLUSTERED 
(
	[Id_Pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VENTAS]    Script Date: 24/05/2019 3:21:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VENTAS](
	[Id_Venta] [int] IDENTITY(1,1) NOT NULL,
	[Id_Produtco] [int] NULL,
	[Id_Proveedor] [int] NULL,
	[Id_Promociones] [int] NULL,
	[Cantidad] [int] NULL,
	[Iva] [decimal](18, 0) NULL,
	[Total] [money] NULL,
	[Facha] [date] NULL,
	[Id_TipoPago] [int] NULL,
 CONSTRAINT [PK_VENTAS] PRIMARY KEY CLUSTERED 
(
	[Id_Venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[DEVOLUCIONES]  WITH CHECK ADD  CONSTRAINT [FK_DEVOLUCIONES_FACTURAS] FOREIGN KEY([Id_Factura])
REFERENCES [dbo].[FACTURAS] ([Id_Factura])
GO
ALTER TABLE [dbo].[DEVOLUCIONES] CHECK CONSTRAINT [FK_DEVOLUCIONES_FACTURAS]
GO
ALTER TABLE [dbo].[DEVOLUCIONES]  WITH CHECK ADD  CONSTRAINT [FK_DEVOLUCIONES_PRODUCTOS] FOREIGN KEY([Id_Producto])
REFERENCES [dbo].[PRODUCTOS] ([Id_Producto])
GO
ALTER TABLE [dbo].[DEVOLUCIONES] CHECK CONSTRAINT [FK_DEVOLUCIONES_PRODUCTOS]
GO
ALTER TABLE [dbo].[FACTURAS]  WITH CHECK ADD  CONSTRAINT [FK_FACTURAS_CLIENTES] FOREIGN KEY([Id_Cliente])
REFERENCES [dbo].[CLIENTES] ([Id_Cliente])
GO
ALTER TABLE [dbo].[FACTURAS] CHECK CONSTRAINT [FK_FACTURAS_CLIENTES]
GO
ALTER TABLE [dbo].[FACTURAS]  WITH CHECK ADD  CONSTRAINT [FK_FACTURAS_VENTAS] FOREIGN KEY([Venta_Id])
REFERENCES [dbo].[VENTAS] ([Id_Venta])
GO
ALTER TABLE [dbo].[FACTURAS] CHECK CONSTRAINT [FK_FACTURAS_VENTAS]
GO
ALTER TABLE [dbo].[INVENTARIOS]  WITH CHECK ADD  CONSTRAINT [FK_INVENTARIOS_PROVEEDORES] FOREIGN KEY([Id_Proveedor])
REFERENCES [dbo].[PROVEEDORES] ([Id_Proveedor])
GO
ALTER TABLE [dbo].[INVENTARIOS] CHECK CONSTRAINT [FK_INVENTARIOS_PROVEEDORES]
GO
ALTER TABLE [dbo].[PROVEEDOR_PRODUCTO]  WITH CHECK ADD  CONSTRAINT [FK_PROVEEDOR_PRODUCTO_PRODUCTOS] FOREIGN KEY([Id_Producto])
REFERENCES [dbo].[PRODUCTOS] ([Id_Producto])
GO
ALTER TABLE [dbo].[PROVEEDOR_PRODUCTO] CHECK CONSTRAINT [FK_PROVEEDOR_PRODUCTO_PRODUCTOS]
GO
ALTER TABLE [dbo].[PROVEEDOR_PRODUCTO]  WITH CHECK ADD  CONSTRAINT [FK_PROVEEDOR_PRODUCTO_PROVEEDORES] FOREIGN KEY([Id_Proveedor])
REFERENCES [dbo].[PROVEEDORES] ([Id_Proveedor])
GO
ALTER TABLE [dbo].[PROVEEDOR_PRODUCTO] CHECK CONSTRAINT [FK_PROVEEDOR_PRODUCTO_PROVEEDORES]
GO
ALTER TABLE [dbo].[VENTAS]  WITH CHECK ADD  CONSTRAINT [FK_VENTAS_PROMOCIONES] FOREIGN KEY([Id_Promociones])
REFERENCES [dbo].[PROMOCIONES] ([Id_Promociones])
GO
ALTER TABLE [dbo].[VENTAS] CHECK CONSTRAINT [FK_VENTAS_PROMOCIONES]
GO
ALTER TABLE [dbo].[VENTAS]  WITH CHECK ADD  CONSTRAINT [FK_VENTAS_TIPOPAGO] FOREIGN KEY([Id_TipoPago])
REFERENCES [dbo].[TIPOPAGO] ([Id_Pago])
GO
ALTER TABLE [dbo].[VENTAS] CHECK CONSTRAINT [FK_VENTAS_TIPOPAGO]
GO
/****** Object:  StoredProcedure [dbo].[AdministrarClientes]    Script Date: 24/05/2019 3:21:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AdministrarClientes]
@Correo varchar (50),
@Password varchar (50),
@Perfil_Id int,
@Imagen nvarchar(MAX),
@Id_Cliente int,
@Primer_Nombre varchar (50),
@Segundo_Nombre varchar (50),
@Primer_Apellido varchar (50),
@Segundo_Apellido varchar (50),
@Direccion varchar (20),
@Telefono varchar (10),
@Fecha_Nacimiento varchar (50),
@Opcion int,
@Mensaje varchar (10) output

as
--insertar--

if @Opcion = 1
begin
if exists ( select * from USUARIOS where [Login] = @Correo and  [Password] = @Password )
begin
set @Mensaje = 'Ya existe un Cliente con ese correo'
end
else
begin

declare @inCodigo int 
		select * from USUARIOS,CLIENTES,PERFILES
		set @inCodigo = (select coalesce (max ([Id]),0)+1 from [dbo].[USUARIOS])
		insert into [dbo].[USUARIOS]
		([Id],
		[Login],
		[Password],
		[Perfil_Id],
		Imagen)
		values( @inCodigo,@Correo, @password ,@Perfil_Id,@Imagen);

		insert into CLIENTES (
		[Id_Cliente],
		[Usuario_Id],
		[Primer_Nombre],
		[Segundo_Nombre],
		[Primer_Apellido],
		[Segundo_Apellido],
		[Direccion],
		[Telefono],
		[Correo],
		[Fecha_Nacimiento])
		values (
		@Id_Cliente,
		@inCodigo,
		@Primer_Nombre,
		@Segundo_Nombre,
		@Primer_Apellido ,
		@Segundo_Apellido,
		@Direccion ,
		@Telefono,
		@Correo,
		@Fecha_Nacimiento);


		set @Mensaje = 'Se realizo el proceso con exito'
end
end

--modificar--

if @Opcion = 2
begin
if exists (select 1 from CLIENTES where Id_Cliente = @Id_Cliente)
begin
update CLIENTES
set
Primer_Nombre=@Primer_Nombre,
Segundo_Nombre=@Segundo_Nombre,
Primer_Apellido=@Primer_Apellido ,
Segundo_Apellido=@Segundo_Apellido,
Direccion=@Direccion ,
Telefono=@Telefono,
Correo=@Correo,
Fecha_Nacimiento=@Fecha_Nacimiento
where Id_Cliente = @Id_Cliente
set @Mensaje = 'se realizo el proceso correctamente'
end 
else
begin
set @Mensaje = 'el cliente no existe'
end
end
--eliminar--

if @Opcion = 3
begin
if exists (select 1 from CLIENTES where Id_Cliente = @Id_Cliente)
begin
delete from CLIENTES where Id_Cliente = @Id_Cliente
set @Mensaje = 'el cliente ha sido eliminado'
end
else
begin
set @Mensaje = 'el cliente no existe'
end 
end

if @@ERROR != 0
begin
		set @Mensaje = 'Se produjo un error durante el procedimiento'
		end





GO
/****** Object:  StoredProcedure [dbo].[AdministrarUsuarios]    Script Date: 24/05/2019 3:21:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  procedure [dbo].[AdministrarUsuarios]
@login nvarchar(50),
@password nvarchar(10),
@Imagen nvarchar(MAX),
@Opcion int,
@Mensaje  nvarchar(50) output
as
--crear cuenta
if @Opcion = 1
begin
if exists ( select 1 from USUARIOS where [Login] = @login and  [Password] = @password)
begin
set @Mensaje = 'Ya existe un usuario con ese correo'
end
else
begin
declare @inCodigo int 
		set @inCodigo = (select coalesce (max ([Id]),0)+1 from [dbo].[USUARIOS])
		insert into [dbo].[USUARIOS] ([Id],[Login],[Password],Imagen) values( @inCodigo, @login ,  @password , @Imagen);
		set @Mensaje = 'Se realizo el proceso con exito'
end
end

if @@ERROR != 0
begin
		set @Mensaje = 'Se produjo un error durante el procedimiento'
		end
GO
/****** Object:  StoredProcedure [dbo].[ConsultarClientes]    Script Date: 24/05/2019 3:21:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarClientes]
as
select 
[Id_Cliente],
[Primer_Nombre],
[Segundo_Nombre],
[Primer_Apellido],
[Segundo_Apellido],
[Direccion],
[Telefono],
[Correo],
[Fecha_Nacimiento]
 from CLIENTES
GO
/****** Object:  StoredProcedure [dbo].[ConsultarPassword]    Script Date: 24/05/2019 3:21:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  procedure [dbo].[ConsultarPassword]
@login nvarchar(50)
as
select * from USUARIOS where [Login] = @login
GO
/****** Object:  StoredProcedure [dbo].[ConsultarUsuarios]    Script Date: 24/05/2019 3:21:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  procedure [dbo].[ConsultarUsuarios]
@login nvarchar(50),
@password nvarchar(10)
as
select * from USUARIOS where [Login] = @login and  [Password] = @password
GO
USE [master]
GO
ALTER DATABASE [MAXI-PEZ] SET  READ_WRITE 
GO
