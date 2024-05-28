CREATE TABLE [dbo].[Proveedores] (
    [ID]        INT           IDENTITY (1, 1) NOT NULL,
    [Nombre]    NVARCHAR (50) NOT NULL,
    [Cuit]      NVARCHAR (30) NOT NULL,
    [Telefono]  NVARCHAR (30) NULL,
    [Direccion] NVARCHAR (50) NULL,
    [Email]     NVARCHAR (50) NULL,
    CONSTRAINT [PK_Proveedores] PRIMARY KEY CLUSTERED ([ID] ASC)
);

