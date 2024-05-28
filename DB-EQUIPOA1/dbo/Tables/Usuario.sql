CREATE TABLE [dbo].[Usuario] (
    [ID]            INT           IDENTITY (1, 1) NOT NULL,
    [NombreUsuario] NVARCHAR (50) NOT NULL,
    [Pass]          NVARCHAR (50) NOT NULL,
    [TipoUsuario]   INT           NOT NULL,
    CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED ([ID] ASC)
);

