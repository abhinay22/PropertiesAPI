using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataStore.Entities
{
    public  class VirtualViewings
    {
        public int id {  get; set; }
        public  DateTime _virtualViewings {  get; set; }
        public virtual Property property { get; set; }


        [ForeignKey("PropertyId")]
        public int PropertyId { get; set; }
    }
}
