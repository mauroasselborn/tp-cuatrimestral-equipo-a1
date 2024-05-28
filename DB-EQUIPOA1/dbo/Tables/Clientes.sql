CREATE TABLE [dbo].[Clientes] (
    [ID]        INT           IDENTITY (1, 1) NOT NULL,
    [Nombre]    NVARCHAR (50) NOT NULL,
    [Telefono]  NVARCHAR (50) NULL,
    [Direccion] NVARCHAR (50) NULL,
    [Mail]      NVARCHAR (50) NULL,
    CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED ([ID] ASC)
);

