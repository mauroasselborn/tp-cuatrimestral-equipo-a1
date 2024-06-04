CREATE PROCEDURE sp_ins_articulo
(
    -- Add the parameters for the stored procedure here
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

CREATE PROCEDURE sp_ins_proveedores
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

CREATE PROCEDURE sp_listar_stock
AS
BEGIN

    SET NOCOUNT ON
 Select S.Id 'ID',S.IdProducto 'IdProducto', A.Nombre 'Nombre Articulo', S.IdProveedor 'IdProveedor',
		P.Nombre 'Nombre Proveedor', S.Cantidad 'Cantidad'
	 from Stock S  
	 inner join Articulos A on S.IdProducto = A.Id
	 inner join Proveedores P on S.IdProveedor = P.id
END
GO

CREATE PROCEDURE sp_listar_marca
AS
BEGIN

    SET NOCOUNT ON
	Select * from Marcas
END
GO

CREATE PROCEDURE sp_listar_categoria
AS
BEGIN

    SET NOCOUNT ON
	Select * from Categorias
END
GO

CREATE PROCEDURE sp_listar_Proveedores
AS
BEGIN

    SET NOCOUNT ON
 Select * FROM Proveedores
END
GO

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

