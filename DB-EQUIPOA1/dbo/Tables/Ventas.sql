CREATE TABLE [dbo].[Ventas] (
    [ID]         INT          IDENTITY (1, 1) NOT NULL,
    [IdProducto] INT          NOT NULL,
    [Cantidad]   INT          NOT NULL,
    [Precio]     DECIMAL (18) NOT NULL,
    [IdCliente]  INT          NOT NULL,
    CONSTRAINT [PK_Ventas] PRIMARY KEY CLUSTERED ([ID] ASC)
);

