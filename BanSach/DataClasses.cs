using System.Data.Linq.Mapping;

namespace bansach
{
    partial class DataClassesDataContext
    {
        public DataClassesDataContext() : base(DatabaseConfig.ConnectionString, new AttributeMappingSource())
        {
            OnCreated();
        }
    }
}
