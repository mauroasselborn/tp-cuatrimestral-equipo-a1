CREATE TABLE [dbo].[Marcas] (
    [ID]          INT           IDENTITY (1, 1) NOT NULL,
    [Descripcion] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_Marca] PRIMARY KEY CLUSTERED ([ID] ASC)
);

