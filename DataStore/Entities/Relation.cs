using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataStore.Entities
{
    public class Relation
    {
        public int Id { get; set; }

        public string RelationId { get; set; }

        public virtual CustomData CustomData { get; set; }

        [ForeignKey("Id")]
        public virtual int  CustomDataId{ get; set; }
    }
}
