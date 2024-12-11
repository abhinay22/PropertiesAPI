using DataStore.Entities;
using Microsoft.EntityFrameworkCore;

namespace DataStore
{
    public class PropertyDBContext :DbContext
    {
       public DbSet<Property> Property { get; set; }

        public DbSet<VirtualViewings> VirtualViewings { get; set; }

        public DbSet<BrochureMap> BrochureMap { get; set; }

        public DbSet<Location> Locations { get; set; }

        public DbSet<Photos> Photos { get; set; }

        public DbSet<TravelTimes> TravelTimes { get; set; }

        public DbSet<Negotiator> Negotiator { get; set; }

        public DbSet<CustomData> CustomData { get; set; }

        public DbSet<OpenViewings> OpenViewings { get; set; }

        public DbSet<Relation> Relations { get; set; }


        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer("Persist Security Info=False;User ID=sa;Password=Arora1234!;Initial Catalog=PropertyDBContext;Server=localhost;TrustServerCertificate=Yes");
        }

        public PropertyDBContext(DbContextOptions<PropertyDBContext> options):base(options)
        {
            
        }
    }
}
