CREATE TABLE [dbo].[MetodosPago] (
    [ID]          INT           IDENTITY (1, 1) NOT NULL,
    [Descripcion] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_MetodosPago] PRIMARY KEY CLUSTERED ([ID] ASC)
);

