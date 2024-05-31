namespace Dominio
{
    public class Articulo
    {
        public int ID { get; set; }
        public string Nombre { get; set; }
        public Marca marca { get; set; }
        public Categoria categoria { get; set; }
        public int StockMinimo { get; set; }
        public decimal ProcentajeGanancia { get; set; }
    }
}
