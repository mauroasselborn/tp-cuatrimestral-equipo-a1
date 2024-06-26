namespace Dominio
{
    public class Categoria
    {
        public int ID { get; set; }
        public string Descripcion { get; set; }

        public Categoria(int id, string Descripcion)
        {
            this.ID = id;
            this.Descripcion = Descripcion;
        }

        public Categoria()
        {
        }
    }
}
