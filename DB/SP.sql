

-- Articulos
CREATE PROCEDURE sp_ins_articulo
(
	@Nombre nvarchar(50) = NULL,
	@Codigo nvarchar(50),
    @IdMarca int,
	@IdCategoria int,
	@ProcentajeGanancia decimal(18,2),
	@StockMinimo int
)
AS
BEGIN

    SET NOCOUNT ON

	INSERT INTO Articulos (Nombre,Codigo,IdMarca,IdTipo,PorcentajeGanancia,StockMinimo,Estado) 
		VALUES  ( @Nombre,@Codigo,@IdMarca,@IdCategoria,@ProcentajeGanancia,@StockMinimo,1 ) 
END
GO
CREATE PROCEDURE sp_upd_articulo
(
	@ID int,
	@Nombre nvarchar(50),
	@Codigo nvarchar(50),
    @IdMarca int,
	@IdCategoria int,
	@ProcentajeGanancia decimal(18,2),
	@StockMinimo int
)
AS
BEGIN

    SET NOCOUNT ON

	Update Articulos SET Nombre=@Nombre ,Codigo=@Codigo,
						 IdMarca=@IdMarca,IdTipo=@IdCategoria,
						 PorcentajeGanancia=@ProcentajeGanancia,
						 StockMinimo=@StockMinimo 
	Where Id = @ID 
END
GO

CREATE PROCEDURE sp_listar_Articulo
AS
BEGIN

    SET NOCOUNT ON
 Select A.Id 'Id',A.Nombre 'Nombre',A.Codigo 'Codigo',  A.IdMarca 'IdMarca',
		M.Descripcion 'Marca', A.IdTipo 'IdCategoria',C.Descripcion 'Categoria',
		A.PorcentajeGanancia 'PorcentajeGanancia', A.StockMinimo 'StockMinimo',
		A.Estado 'Estado'
	 from Articulos A  
	 inner join Marcas M on M.ID = A.IdMarca
	 inner join Categorias C on C.ID = A.IdTipo
	 where A.Estado = 1
END
GO
CREATE PROCEDURE sp_del_articulo
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
--------------
-- Listar Articulos por ID
CREATE PROCEDURE sp_listarID_Articulo
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

-- Listar Marca
CREATE PROCEDURE sp_listar_marca
AS
BEGIN

    SET NOCOUNT ON
	Select * from Marcas
END
GO

-- Listar Marca por ID
CREATE PROCEDURE sp_listarID_marca
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

--Cliente
CREATE PROCEDURE sp_listar_clientes
AS
BEGIN

    SET NOCOUNT ON
	Select * FROM Clientes
	where Estado = 1
END
GO
CREATE PROCEDURE sp_ins_cliente
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
	INSERT INTO Clientes (Nombre, Apellido, Documento, Telefono, Direccion, Mail,Estado) 
		VALUES  ( @Nombre, @Apellido, @Documento, @Telefono, @Direccion, @Mail,1) 
END
GO
CREATE PROCEDURE sp_upd_cliente(
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
Create PROCEDURE sp_del_cliente
(
	@Id int
)
AS
BEGIN
 SET NOCOUNT ON
 Update Clientes set Estado=0 where ID = @Id
 END
GO
--------------
-------------MAURO-------------

-- Listar Categoria
CREATE PROCEDURE sp_listar_categorias
AS
BEGIN

    SET NOCOUNT ON
	Select * from Categorias
END
GO

-- Listar Categoria por ID
CREATE PROCEDURE sp_listarID_categoria
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

-- Listar Stock
CREATE PROCEDURE sp_listar_stocks
AS
BEGIN

    SET NOCOUNT ON
 Select * FROM Stock
END
GO

-- Listar Stock por ID
CREATE PROCEDURE sp_listarID_stock
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

-- Listar Proveedor
CREATE PROCEDURE sp_listar_proveedores
AS
BEGIN

    SET NOCOUNT ON
	Select * FROM Proveedores
	WHERE Estado = 1
END
GO

-- Listar Proveedores por ID
CREATE PROCEDURE sp_listarID_proveedor
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

-- Insertar Categorias
CREATE PROCEDURE sp_ins_categoria
(
    @Descripcion nvarchar(50)
)
AS
BEGIN

    SET NOCOUNT ON

	INSERT INTO Categorias (Descripcion) 
		VALUES  (@Descripcion) 
END
GO

-- Insertar Stock
CREATE PROCEDURE sp_ins_stock
(
    @idProducto int,
    @idProveedor int,
    @Cantidad int
)
AS
BEGIN

    SET NOCOUNT ON

	INSERT INTO Stock (IdProducto,IdProveedor,Cantidad) 
		VALUES  (@idProducto,@idProveedor,@Cantidad) 
END
GO

-- Insertar Proveedores
CREATE PROCEDURE sp_ins_proveedor
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

-- Update Categorias
CREATE PROCEDURE sp_upd_categoria
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

-- Update Stock
CREATE PROCEDURE sp_upd_stock
(
	@id int,
	@idProveedor int,
	@cantidad int
)
AS
BEGIN

    SET NOCOUNT ON

	UPDATE Stock 
	SET IdProveedor = @idProveedor,
		Cantidad = @cantidad
	WHERE ID = @id
	
END
GO

-- Update Proveedor
CREATE PROCEDURE sp_upd_proveedor
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

-- Eliminar Categoria
CREATE PROCEDURE sp_del_categoria
(
	@id int
)
AS
BEGIN
DELETE FROM Categorias 
	WHERE ID = @id
	
END
GO


-- Eliminar Stock
CREATE PROCEDURE sp_del_stock
(
	@id int
)
AS
BEGIN

    SET NOCOUNT ON

	DELETE FROM Stock 
	WHERE ID = @id
	
END
GO


-- Eliminar Proveedor
CREATE PROCEDURE sp_del_proveedor
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

-- Insertar Marcas
CREATE PROCEDURE sp_ins_marca
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

-- Update Marcas
CREATE PROCEDURE sp_upd_marca
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

-- Eliminar Marca
CREATE PROCEDURE sp_del_marca
(
	@id int
)
AS
BEGIN
DELETE FROM Marcas 
	WHERE ID = @id
	
END
GO

-- Insertar usuario
CREATE PROCEDURE sp_ins_usuario
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

--Editar usuario
CREATE PROCEDURE sp_upd_usuario
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

--listar usuarios
CREATE PROCEDURE sp_listar_usuario
AS
BEGIN

    SET NOCOUNT ON
 Select *
	 from Usuarios
	 WHERE Estado = 1
END
GO

--eliminar usuario
CREATE PROCEDURE sp_del_usuario(
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
--------------
-- Listar Articulos por ID
CREATE PROCEDURE sp_listarID_Usuario
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
-----VENTA-----
CREATE PROCEDURE sp_List_factura
AS
BEGIN

    SET NOCOUNT ON
	SELECT F.ID 'ID',F.NroFactura 'NroFactura',F.fecha 'Fecha' ,F.IdCliente 'IdCliente',
		   F.Total, MP.ID 'IdMetodoPago',MP.Descripcion 'DescMetodo'
	FROM FacturaVenta F
	inner join MetodosPago MP on MP.ID = F.IdMetodoPago
END
GO
CREATE PROCEDURE sp_ins_factura
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
CREATE PROCEDURE sp_ins_item_factura
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

CREATE PROCEDURE sp_ins_cuotas
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
