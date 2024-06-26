namespace Dominio
{
    public class Marca
    {
        public int ID { get; set; }
        public string Descripcion { get; set; }

        public Marca(int id, string Descripcion)
        {
            this.ID = id;
            this.Descripcion = Descripcion;
        }

        public Marca()
        {
        }
    }
}