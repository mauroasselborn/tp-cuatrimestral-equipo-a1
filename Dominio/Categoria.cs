namespace Dominio
{
    public class Categoria
    {
        public int Id { get; set; }
        public string Descripcion { get; set; }

        public Categoria(int id, string Descripcion)
        {
            this.Id = id;
            this.Descripcion = Descripcion;
        }

        public Categoria()
        {
        }
    }
}
