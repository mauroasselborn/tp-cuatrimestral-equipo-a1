namespace Dominio
{
    public class Producto
    {
        public int ID { get; set; }
        public string Nombre { get; set; }
        public Marca marca { get; set; }
        public Tipo tipo { get; set; }
        public int StockMinimo { get; set; }
        public decimal ProcentajeGanancia { get; set; }
    }
}
