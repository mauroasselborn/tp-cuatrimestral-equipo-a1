CREATE TABLE [dbo].[Stock] (
    [ID]          INT IDENTITY (1, 1) NOT NULL,
    [IdProducto]  INT NOT NULL,
    [IdProveedor] INT NOT NULL,
    [Cantidad]    INT NOT NULL,
    CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Stock_Productos] FOREIGN KEY ([ID]) REFERENCES [dbo].[Productos] ([Id]),
    CONSTRAINT [FK_Stock_Proveedores] FOREIGN KEY ([ID]) REFERENCES [dbo].[Proveedores] ([ID])
);

