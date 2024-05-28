CREATE TABLE [dbo].[Productos] (
    [Id]                 INT          IDENTITY (1, 1) NOT NULL,
    [Nombre]             NCHAR (10)   NOT NULL,
    [IdMarca]            INT          NOT NULL,
    [IdTipo]             INT          NOT NULL,
    [StockMinimo]        INT          NULL,
    [PorcentajeGanancia] DECIMAL (18) NULL,
    CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED ([Id] ASC)
);

