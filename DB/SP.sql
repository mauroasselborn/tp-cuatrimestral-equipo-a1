-- Insertar Articulos
CREATE PROCEDURE sp_ins_articulo
(
   
    @Nombre nvarchar(50) = NULL,
    @IdMarca int,
	@IdCategoria int,
	@ProcentajeGanancia decimal,
	@StockMinimo int
)
AS
BEGIN

    SET NOCOUNT ON

	INSERT INTO Articulos (Nombre,IdMarca,IdTipo,PorcentajeGanancia,StockMinimo) 
		VALUES  ( @Nombre,@IdMarca,@IdCategoria,@ProcentajeGanancia,@StockMinimo ) 
END
GO

-- Listar Articulos
CREATE PROCEDURE sp_listar_Articulo
AS
BEGIN

    SET NOCOUNT ON
 Select A.Id 'Id',A.Nombre 'Nombre', A.IdMarca 'IdMarca',
		M.Descripcion 'Marca', A.IdTipo 'IdCategoria',C.Descripcion 'Categoria',
		A.PorcentajeGanancia 'PorcentajeGanancia', A.StockMinimo 'StockMinimo'
	 from Articulos A  
	 inner join Marcas M on M.ID = A.IdMarca
	 inner join Categorias C on C.ID = A.IdTipo
END
GO

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

-- Insertar Cliente
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
	
	INSERT INTO Clientes (Nombre, Apellido, Documento, Telefono, Direccion, Mail) 
		VALUES  ( @Nombre, @Apellido, @Documento, @Telefono, @Direccion, @Mail ) 
END
GO

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

	INSERT INTO Proveedores (Nombre,Empresa,Cuit,Telefono,Direccion,Email) 
		VALUES  ( @Nombre,@Empresa,@Cuit,@Telefono,@Direccion,@Email) 
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

	DELETE FROM Proveedores 
	WHERE ID = @id
	
END
GO
