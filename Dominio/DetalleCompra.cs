namespace Dominio
{
    public class DetalleCompra
    {
        public int ID { get; set; }
        public Articulo Articulo { get; set; }
        public int Cantidad { get; set; }
        public decimal PrecioUnitario { get; set; }

        public DetalleCompra(Articulo articulo, int cantidad, decimal precioUnitario)
        {
            Articulo = articulo;
            Cantidad = cantidad;
            PrecioUnitario = precioUnitario;
        }

        public DetalleCompra() { }

        public decimal Subtotal => Cantidad * PrecioUnitario;
    }
}
