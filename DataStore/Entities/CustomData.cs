using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataStore.Entities
{
    public class CustomData
    {
        public int Id { get; set; }
       
        public bool IsMyHomePassport { get; set; }

        public   ICollection<Relation>  RelatedPropertyIDs {  get; set; }

        public virtual Property property { get; set; }

        [ForeignKey("PropertyId")]
        public int PropertyId { get; set; }
    }
}
