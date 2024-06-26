namespace Dominio
{
    public class ItemVenta
    {
        public Articulo articulo { get; set; }
        public int Cantidad { get; set; }
        public float Precio { get; set; }
        public float subtotal { get; set; }
    }
}
