using Models;

namespace IDataStore
{
    public interface IDataStore
    {
       public Task<List<Property>> ReadAllProperties();

    }
}
