using IDataStore;
using Models;
using Newtonsoft;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace JsonStore
{
    public class JsonStoreReader : IDataStore.IDataStore
    {
       
        public Task<List<Property>> AddProperty(string propertyId)
        {
            throw new NotImplementedException();
        }

        public Task<List<Property>> DeleteProperty(string propertyId)
        {
            throw new NotImplementedException();
        }

        public async Task<List<Property>> ReadAllProperties()
        {
           string jsonString= await File.ReadAllTextAsync("property_data.json");
            JObject jobject = JObject.Parse(jsonString);
           
         List<Property> allProperties=JsonConvert.DeserializeObject<List<Property>>(jobject.ToString());
         return allProperties;
        }

        public Task<List<Property>> UpdateProperty(Property propery)
        {
            throw new NotImplementedException();
        }
    }
}
