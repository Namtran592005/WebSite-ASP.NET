namespace bansach
{
    public class DatabaseConfig
    {
        public static string ConnectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=WEBBANSACH;Integrated Security=True;";
        public static DataClassesDataContext GetContext()
        {
            return new DataClassesDataContext(ConnectionString);
        }
    }
}
