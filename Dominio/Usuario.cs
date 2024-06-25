namespace Dominio
{
    public class Usuario
    {
        public int Id { get; set; }
        public string NombreUsuario { get; set; }
        public string Pass { get; set; }
        public string TipoUsuario { get; set; }
        public bool Estado { get; set; }
        //public string UrlImg { get; set; }
    }
}
