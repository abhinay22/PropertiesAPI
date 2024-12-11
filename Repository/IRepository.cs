

using Models;

namespace Repository
{
    public interface IRepository
    {
        public Task<List<Property>> GetAllProperties();
        public Task<Property> GetProperyById(int propertyId);

        public Task<int> AddProperty(Property prop);

        public Task DeleteProperty(int propertyId);
       public Task UpdateProperty(int id, Property updateProperty);
    }
}
