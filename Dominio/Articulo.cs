﻿namespace Dominio
{
    public class Articulo
    {
        public int ID { get; set; }
        public string Nombre { get; set; }
        public Marca Marca { get; set; }
        public Categoria Categoria { get; set; }
        public int StockMinimo { get; set; }
        public decimal ProcentajeGanancia { get; set; }
    }
}
