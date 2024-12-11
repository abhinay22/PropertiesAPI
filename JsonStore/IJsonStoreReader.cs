using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JsonStore
{
    interface  IJsonStoreReader
    {
        Task<List<Property>> ReadAllProperties();

        Task<List<Property>> AddProperty(string propertyId);


        Task<List<Property>> DeleteProperty(string propertyId);

        Task<List<Property>> UpdateProperty(Property propery);
    }
}
