CREATE TABLE [dbo].[Factura] (
    [ID]           INT           IDENTITY (1, 1) NOT NULL,
    [Fecha]        DATETIME      NOT NULL,
    [Numero]       NVARCHAR (50) NOT NULL,
    [IdProveedor]  INT           NULL,
    [IdCliente]    INT           NULL,
    [IdVenta]      INT           NULL,
    [IdCompra]     INT           NULL,
    [IdMetodoPago] INT           NULL,
    CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Factura_Factura] FOREIGN KEY ([ID]) REFERENCES [dbo].[Factura] ([ID])
);

