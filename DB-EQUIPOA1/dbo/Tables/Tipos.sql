CREATE TABLE [dbo].[Tipos] (
    [ID]          INT           IDENTITY (1, 1) NOT NULL,
    [Descripcion] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_Tipos] PRIMARY KEY CLUSTERED ([ID] ASC)
);

