namespace Dominio
{
    public class Marca
    {
        public int id { get; set; }
        public string Descripcion { get; set; }

        public Marca(int id, string Descripcion)
        {
            this.id = id;
            this.Descripcion = Descripcion;
        }

        public Marca()
        {
        }
    }
}