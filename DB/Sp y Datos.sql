use [DB-EQUIPOA1]

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

	INSERT INTO Marcas(Descripcion) VALUES('Samsung') 
	INSERT INTO Marcas(Descripcion) VALUES('LG') 
	INSERT INTO Marcas(Descripcion) VALUES('Dell') 
	INSERT INTO Marcas(Descripcion) VALUES('Motorola') 

	INSERT INTO Categorias(Descripcion) VALUES('Celular') 
	INSERT INTO Categorias(Descripcion) VALUES('Parlante') 
	INSERT INTO Categorias(Descripcion) VALUES('Monitor') 
	INSERT INTO Categorias(Descripcion) VALUES('Notebook') 



