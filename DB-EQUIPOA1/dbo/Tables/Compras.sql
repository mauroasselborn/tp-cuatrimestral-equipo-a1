CREATE TABLE [dbo].[Compras] (
    [ID]          INT          IDENTITY (1, 1) NOT NULL,
    [IdProducto]  INT          NOT NULL,
    [Cantidad]    INT          NOT NULL,
    [Precio]      DECIMAL (18) NOT NULL,
    [IdProveedor] INT          NOT NULL,
    CONSTRAINT [PK_Compras] PRIMARY KEY CLUSTERED ([ID] ASC)
);

