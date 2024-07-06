USE [DB-EQUIPOA1]
GO
/****** Object:  StoredProcedure [dbo].[sp_del_articulo]    Script Date: 05/07/2024 08:22:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_del_articulo]
(
	@Id int
)
AS
BEGIN
 SET NOCOUNT ON
	Delete Stock where IdProducto = @Id  
	update Articulos set estado = 0 where ID = @Id
 END
GO
/****** Object:  StoredProcedure [dbo].[sp_del_categoria]    Script Date: 05/07/2024 08:22:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Eliminar Categoria
CREATE PROCEDURE [dbo].[sp_del_categoria]
(
	@id int
)
AS
BEGIN
DELETE FROM Categorias 
	WHERE ID = @id
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_del_cliente]    Script Date: 05/07/2024 08:22:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_del_cliente]
(
	@Id int
)
AS
BEGIN
 SET NOCOUNT ON
 Update Clientes set Estado=0 where ID = @Id
 END
GO
/****** Object:  StoredProcedure [dbo].[sp_del_compra]    Script Date: 05/07/2024 08:22:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Eliminar Marca
CREATE PROCEDURE [dbo].[sp_del_compra]
(
	@ID int
)
AS
BEGIN

DELETE FROM DetalleCompra
	WHERE IdCompra = @ID

DELETE FROM Compras 
	WHERE ID = @ID
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_del_detalle_compra]    Script Date: 05/07/2024 08:22:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--eliminar Detalle Compra
CREATE PROCEDURE [dbo].[sp_del_detalle_compra]
(
	@IdCompra int
)
AS
BEGIN
 SET NOCOUNT ON
	
    DELETE FROM DetalleCompra 

    WHERE IdCompra = @IdCompra
 END
GO
/****** Object:  StoredProcedure [dbo].[sp_del_marca]    Script Date: 05/07/2024 08:22:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Eliminar Marca
CREATE PROCEDURE [dbo].[sp_del_marca]
(
	@id int
)
AS
BEGIN
DELETE FROM Marcas 
	WHERE ID = @id
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_del_proveedor]    Script Date: 05/07/2024 08:22:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- Eliminar Proveedor
CREATE PROCEDURE [dbo].[sp_del_proveedor]
(
	@id int
)
AS
BEGIN

    SET NOCOUNT ON

	UPDATE Proveedores 
	SET Estado = 0
	WHERE ID = @id
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_del_usuario]    Script Date: 05/07/2024 08:22:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--eliminar usuario
CREATE PROCEDURE [dbo].[sp_del_usuario](
	@Id int
	)
AS
BEGIN
 SET NOCOUNT ON
	UPDATE Usuarios 
	SET Estado = 0
	where Id = @Id
 END
GO
/****** Object:  StoredProcedure [dbo].[sp_ins_cliente]    Script Date: 05/07/2024 08:22:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ins_cliente]
(
    @Nombre nvarchar(50) = NULL,
    @Apellido nvarchar(50),
	@Documento nvarchar(50),
	@Telefono nvarchar(50),
	@Direccion nvarchar(50),
	@Mail nvarchar(50)
)
AS
BEGIN

    SET NOCOUNT ON
	select * from Clientes
	INSERT INTO Clientes (Nombre, Apellido, Documento, Telefono, Direccion, Mail,Estado) 
		VALUES  ( @Nombre, @Apellido, @Documento, @Telefono, @Direccion, @Mail,1) 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ins_compra]    Script Date: 05/07/2024 08:22:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ins_compra]
    @IdProveedor INT,
    @Fecha DATE,
    @ValorTotal DECIMAL(18, 2)
AS
BEGIN
    INSERT INTO Compras (IdProveedor, Fecha, ValorTotal)
    VALUES (@IdProveedor, @Fecha, @ValorTotal)

    SELECT SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ins_cuotas]    Script Date: 05/07/2024 08:22:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ins_cuotas]
(
    @IdFactura int,
	@Cantidad int,
	@Precio decimal(18,2),
	@Total decimal(18,2)
)
AS
BEGIN

    SET NOCOUNT ON

	insert into Cuotas (IdFactura,Cantidad,Precio,Total)
		VALUES  ( @IdFactura,@Cantidad,@Precio,@Total) 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ins_detalle_compra]    Script Date: 05/07/2024 08:22:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--eliminar usuario
CREATE PROCEDURE [dbo].[sp_ins_detalle_compra]
(
	@IdCompra int,
    @IdArticulo int,
    @Cantidad int,
    @PrecioUnitario decimal(18,2)
)
AS
BEGIN
 SET NOCOUNT ON
	INSERT INTO DetalleCompra (IdCompra, IdArticulo, Cantidad, PrecioUnitario)
	VALUES (@IdCompra, @IdArticulo, @Cantidad, @PrecioUnitario)
 END
GO
/****** Object:  StoredProcedure [dbo].[sp_ins_factura]    Script Date: 05/07/2024 08:22:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ins_factura]
(
	@nroFactura nvarchar(11),
	@Fecha Date,
    @IdCliente int,
	@IdMetodoPago int,
	@Total decimal(18,2)
)
AS
BEGIN

    SET NOCOUNT ON

	insert into FacturaVenta (NroFactura,Fecha,IdCliente,IdMetodoPago,Total)
		VALUES  (@nroFactura,@Fecha,@IdCliente,@IdMetodoPago,@Total) 

	SELECT @@IDENTITY AS ID
		
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ins_item_factura]    Script Date: 05/07/2024 08:22:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ins_item_factura]
(
    @IdFactura int,
	@IdArticulo int,
	@Cantidad int,
	@Precio decimal(18,2),
	@Subtotal decimal(18,2)
)
AS
BEGIN

    SET NOCOUNT ON

	insert into ItemFactura (IdFactura,IdArticulo,Cantidad,Precio,Subtotal)
		VALUES  ( @IdFactura,@IdArticulo,@Cantidad,@Precio,@Subtotal) 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ins_marca]    Script Date: 05/07/2024 08:22:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Insertar Marcas
CREATE PROCEDURE [dbo].[sp_ins_marca]
(
    @Descripcion nvarchar(50)
)
AS
BEGIN

    SET NOCOUNT ON

	INSERT INTO Marcas (Descripcion) 
		VALUES  (@Descripcion) 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ins_proveedor]    Script Date: 05/07/2024 08:22:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Insertar Proveedores
CREATE PROCEDURE [dbo].[sp_ins_proveedor]
(
    @Nombre nvarchar(50),
    @Empresa nvarchar(50),
	@Cuit nvarchar(50),
	@Telefono nvarchar(50),
	@Direccion nvarchar(50),
	@Email nvarchar(50)
)
AS
BEGIN

    SET NOCOUNT ON

	INSERT INTO Proveedores (Nombre,Empresa,Cuit,Telefono,Direccion,Email, Estado) 
		VALUES  ( @Nombre,@Empresa,@Cuit,@Telefono,@Direccion,@Email, 1) 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ins_stock]    Script Date: 05/07/2024 08:22:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Insertar Stock
CREATE PROCEDURE [dbo].[sp_ins_stock]
(
    @idProducto int,
    @Cantidad int
)
AS
BEGIN

    SET NOCOUNT ON

	INSERT INTO Stock (IdProducto,Cantidad) 
		VALUES  (@idProducto,@Cantidad) 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ins_usuario]    Script Date: 05/07/2024 08:22:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Insertar usuario
CREATE PROCEDURE [dbo].[sp_ins_usuario]
(
	@Nombre nvarchar(50) = NULL,
	@Pass nvarchar(50),
    @Tipo nvarchar(50)
)
AS
BEGIN

    SET NOCOUNT ON

	INSERT INTO Usuarios (NombreUsuario,Pass,TipoUsuario,Estado) 
		VALUES  ( @Nombre,@Pass,@Tipo,1) 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_List_factura]    Script Date: 05/07/2024 08:22:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----VENTA-----
CREATE PROCEDURE [dbo].[sp_List_factura]
AS
BEGIN

    SET NOCOUNT ON
	SELECT F.ID 'ID',F.NroFactura 'NroFactura',F.fecha 'Fecha' ,F.IdCliente 'IdCliente',
		   F.Total, MP.ID 'IdMetodoPago',MP.Descripcion 'DescMetodo'
	FROM FacturaVenta F
	inner join MetodosPago MP on MP.ID = F.IdMetodoPago
END
GO
/****** Object:  StoredProcedure [dbo].[sp_listar_Articulo]    Script Date: 05/07/2024 08:22:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_listar_Articulo]
AS
BEGIN

    SET NOCOUNT ON
 Select A.Id 'Id',A.Nombre 'Nombre',A.Codigo 'Codigo',  A.IdMarca 'IdMarca',
		M.Descripcion 'Marca', A.IdCategoria 'IdCategoria',C.Descripcion 'Categoria',
		A.PorcentajeGanancia 'PorcentajeGanancia', A.StockMinimo 'StockMinimo',
		A.Estado 'Estado'
	 from Articulos A  
	 inner join Marcas M on M.ID = A.IdMarca
	 inner join Categorias C on C.ID = A.IdCategoria
	 where A.Estado = 1
END
GO
/****** Object:  StoredProcedure [dbo].[sp_listar_categorias]    Script Date: 05/07/2024 08:22:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------
-------------MAURO-------------

-- Listar Categoria
CREATE PROCEDURE [dbo].[sp_listar_categorias]
AS
BEGIN

    SET NOCOUNT ON
	Select * from Categorias
END
GO
/****** Object:  StoredProcedure [dbo].[sp_listar_clientes]    Script Date: 05/07/2024 08:22:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Cliente
CREATE PROCEDURE [dbo].[sp_listar_clientes]
AS
BEGIN

    SET NOCOUNT ON
	Select * FROM Clientes
	where Estado = 1
END
GO
/****** Object:  StoredProcedure [dbo].[sp_listar_compras]    Script Date: 05/07/2024 08:22:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_listar_compras]
AS
BEGIN
    SELECT 
        ID,
        IdProveedor,
        Fecha
    FROM 
        Compras
END

GO
/****** Object:  StoredProcedure [dbo].[sp_listar_detalle_compra]    Script Date: 05/07/2024 08:22:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_listar_detalle_compra](
    @IdCompra int
)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM 
        DetalleCompra
    WHERE IdCompra = @IdCompra
END
GO
/****** Object:  StoredProcedure [dbo].[sp_listar_marca]    Script Date: 05/07/2024 08:22:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Listar Marca
CREATE PROCEDURE [dbo].[sp_listar_marca]
AS
BEGIN

    SET NOCOUNT ON
	Select * from Marcas
END
GO
/****** Object:  StoredProcedure [dbo].[sp_listar_proveedores]    Script Date: 05/07/2024 08:22:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Listar Proveedor
CREATE PROCEDURE [dbo].[sp_listar_proveedores]
AS
BEGIN

    SET NOCOUNT ON
	Select * FROM Proveedores
	WHERE Estado = 1
END
GO
/****** Object:  StoredProcedure [dbo].[sp_listar_stocks]    Script Date: 05/07/2024 08:22:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Listar Stock
CREATE PROCEDURE [dbo].[sp_listar_stocks]
AS
BEGIN

    SET NOCOUNT ON
 Select * FROM Stock
END
GO
/****** Object:  StoredProcedure [dbo].[sp_listar_usuario]    Script Date: 05/07/2024 08:22:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--listar usuarios
CREATE PROCEDURE [dbo].[sp_listar_usuario]
AS
BEGIN

    SET NOCOUNT ON
 Select *
	 from Usuarios
	 WHERE Estado = 1
END
GO
/****** Object:  StoredProcedure [dbo].[sp_listarID_Articulo]    Script Date: 05/07/2024 08:22:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------
-- Listar Articulos por ID
CREATE PROCEDURE [dbo].[sp_listarID_Articulo]
(
	@id int
)
AS
BEGIN

    SET NOCOUNT ON
 Select  * from Articulos
	 WHERE Id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_listarID_categoria]    Script Date: 05/07/2024 08:22:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Listar Categoria por ID
CREATE PROCEDURE [dbo].[sp_listarID_categoria]
(
	@id int
)
AS
BEGIN

    SET NOCOUNT ON
	Select * from Categorias
	WHERE ID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_listarID_compra]    Script Date: 05/07/2024 08:22:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_listarID_compra]
(
    @ID int
)
AS
BEGIN
    SELECT 
        ID,
        IdProveedor,
        Fecha
    FROM 
        Compras
    WHERE ID = @ID
END

GO
/****** Object:  StoredProcedure [dbo].[sp_listarID_marca]    Script Date: 05/07/2024 08:22:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Listar Marca por ID
CREATE PROCEDURE [dbo].[sp_listarID_marca]
(
	@id int
)
AS
BEGIN

    SET NOCOUNT ON
	Select * from Marcas
	WHERE ID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_listarID_proveedor]    Script Date: 05/07/2024 08:22:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Listar Proveedores por ID
CREATE PROCEDURE [dbo].[sp_listarID_proveedor]
(
	@id int
)
AS
BEGIN

    SET NOCOUNT ON
 SELECT * FROM Proveedores
 WHERE ID = @id

END
GO
/****** Object:  StoredProcedure [dbo].[sp_listarID_stock]    Script Date: 05/07/2024 08:22:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Listar Stock por ID
CREATE PROCEDURE [dbo].[sp_listarID_stock]
(
	@id int
)
AS
BEGIN

    SET NOCOUNT ON
  Select * FROM Stock
	 WHERE ID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_listarID_Usuario]    Script Date: 05/07/2024 08:22:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------
-- Listar Articulos por ID
CREATE PROCEDURE [dbo].[sp_listarID_Usuario]
(
	@id int
)
AS
BEGIN

    SET NOCOUNT ON
 Select  * from Usuarios
	 WHERE Id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_upd_categoria]    Script Date: 05/07/2024 08:22:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Update Categorias
CREATE PROCEDURE [dbo].[sp_upd_categoria]
(
	@id int,
    @Descripcion nvarchar(50)
)
AS
BEGIN

    SET NOCOUNT ON

	UPDATE Categorias 
	SET Descripcion = @Descripcion 
	WHERE ID = @id
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_upd_cliente]    Script Date: 05/07/2024 08:22:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_upd_cliente](
	@Id int,
    @Nombre nvarchar(50) = NULL,
    @Apellido nvarchar(50),
	@Telefono nvarchar(50),
	@Direccion nvarchar(50),
	@Mail nvarchar(50)
)
AS
BEGIN

    SET NOCOUNT ON
	
	UPDATE Clientes 
	SET 
		Nombre = @Nombre, 
		Apellido = @Apellido, 
		Telefono = @Telefono, 
		Direccion = @Direccion,
		Mail = @Mail
	WHERE id = @Id 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_upd_detalle_compra]    Script Date: 05/07/2024 08:22:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--eliminar usuario
CREATE PROCEDURE [dbo].[sp_upd_detalle_compra]
(
	@IdCompra int,
    @IdArticulo int,
    @Cantidad int,
    @PrecioUnitario decimal(18,2)
)
AS
BEGIN
 SET NOCOUNT ON
	
    UPDATE DetalleCompra 
	
    SET IdArticulo = @IdArticulo,
        Cantidad = @Cantidad,
        PrecioUnitario = @PrecioUnitario
    
    WHERE IdCompra = @IdCompra
 END
GO
/****** Object:  StoredProcedure [dbo].[sp_upd_marca]    Script Date: 05/07/2024 08:22:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Update Marcas
CREATE PROCEDURE [dbo].[sp_upd_marca]
(
	@id int,
    @Descripcion nvarchar(50)
)
AS
BEGIN

    SET NOCOUNT ON

	UPDATE Marcas 
	SET Descripcion = @Descripcion 
	WHERE ID = @id
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_upd_proveedor]    Script Date: 05/07/2024 08:22:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Update Proveedor
CREATE PROCEDURE [dbo].[sp_upd_proveedor]
(
    @id int,
    @Nombre nvarchar(50),
    @Empresa nvarchar(50),
    @Cuit nvarchar(50),
    @Telefono nvarchar(50),
    @Direccion nvarchar(50),
    @Email nvarchar(50)
)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Proveedores
    SET Nombre = @Nombre,
        Empresa = @Empresa,
        Cuit = @Cuit,
        Telefono = @Telefono,
        Direccion = @Direccion,
        Email = @Email
    WHERE ID = @id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_upd_stock]    Script Date: 05/07/2024 08:22:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Update Stock
CREATE PROCEDURE [dbo].[sp_upd_stock]
(
	@IdArticulo int,
	@Cantidad int
)
AS
BEGIN

    SET NOCOUNT ON

	UPDATE Stock 
	SET Cantidad = @Cantidad
	WHERE IdProducto = @IdArticulo
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_upd_usuario]    Script Date: 05/07/2024 08:22:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Editar usuario
CREATE PROCEDURE [dbo].[sp_upd_usuario]
(
	@Id int,
	@Nombre nvarchar(50),
	@Pass nvarchar(50),
    @Tipo nvarchar(50)
)
AS
BEGIN

    SET NOCOUNT ON

	Update Usuarios SET NombreUsuario=@Nombre, Pass=@Pass,
						 TipoUsuario=@Tipo 
	Where Id = @Id
END
GO


CREATE PROCEDURE [dbo].[sp_list_art_venta]
AS
BEGIN
SET NOCOUNT ON
	Select A.Id 'Id',A.Nombre 'Nombre',A.Codigo 'Codigo',  A.IdMarca 'IdMarca',
			M.Descripcion 'Marca', A.IdCategoria 'IdCategoria',C.Descripcion 'Categoria',
			A.PorcentajeGanancia 'PorcentajeGanancia', A.StockMinimo 'StockMinimo',S.Cantidad 'StockMaximo',  dbo.FncUltimoPrecio(A.ID) 'Precio'
		 from Articulos A  
		 inner join Marcas M on M.ID = A.IdMarca
		 inner join Categorias C on C.ID = A.IdCategoria
		 inner join Stock S on S.IdProducto = A.Id
		 where A.Estado = 1 and S.Cantidad > 0 and dbo.FncUltimoPrecio(A.ID) is not null
END
GO
CREATE PROCEDURE [dbo].[sp_List_ItemFactura]
(
	@Id int
)
AS
BEGIN
SET NOCOUNT ON
	Select A.Nombre,M.Descripcion 'Marca', I.Cantidad,I.Precio,I.Subtotal
		 from ItemFactura I
		 inner join Articulos A on A.Id = I.IdArticulo
		 inner join Marcas M on M.ID = A.IdMarca
END
GO

---------Funcion----
CREATE FUNCTION FncUltimoPrecio
 (
 @ID int
 )
RETURNS decimal (18,2)
AS
BEGIN
	RETURN(
	select top 1 PrecioUnitario
	   from Articulos a
	inner join detalleCompra dc on dc.idArticulo = @ID
	where a.id = @ID 
	order by IdCompra desc
 )
END

