using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataStore.Entities;
using DataStore;
using Microsoft.EntityFrameworkCore;
using AutoMapper;
using Models;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using Microsoft.EntityFrameworkCore.Metadata.Internal;

namespace Repository
{
    public class Repository:IRepository
    {
        private readonly PropertyDBContext _dbcontext;

        private readonly IMapper _mapper;
        public Repository(PropertyDBContext dbcontext, IMapper mapper)
        {
              this._dbcontext = dbcontext;
               this._mapper = mapper;
        }

        public async Task<int> AddProperty(Models.Property prop)
        {
            try
            {
                DataStore.Entities.Property propEnt =_mapper.Map<DataStore.Entities.Property>(prop);
               // propEnt = EntityMapper(ref propEnt,prop);
                _dbcontext.Property.Add(propEnt);
                await _dbcontext.SaveChangesAsync();
                int id = propEnt.PropertyId;
                return id;

            }
            catch (Exception)
            {

                throw;
            }
        }

        public async Task DeleteProperty(int propertyId)
        {
            try
            {
                 DataStore.Entities.Property ent = _dbcontext.Property.Where(x=>x.PropertyId == propertyId).FirstOrDefault();
                _dbcontext.Property.Remove(ent);
                await _dbcontext.SaveChangesAsync();
            }
            catch (Exception ex)
            {

                throw;
            }

        }

        public async Task<Models.Property> GetProperyById(int propertyId)
        {
            try
            {

                DataStore.Entities.Property prop= _dbcontext.Property.Where(x => x.PropertyId == propertyId).
                    Include(x => x.CustomData).
                   ThenInclude(x => x.RelatedPropertyIDs).
                    Include(x => x.Negotiator).
                   Include(x => x.Location).
                   Include(x => x.BrochureMap).
                   Include(x => x.AuctionList).
                   Include(x => x.AdditionalLogoUrls).
                   Include(x => x.OpenViewings).
                   Include(x => x.TravelTimes).
                   Include(x => x.VirtualViewings)
                   .Include(x=>x.Photos)
                   .SingleOrDefault();
                Models.Property property= _mapper.Map<Models.Property>(prop);
                return property;
            }
            catch (Exception ex)
            {

                throw ;
            }
        }

        public async Task UpdateProperty(int id, Models.Property updateProperty)
        {
            try
            {
                DataStore.Entities.Property ent = _dbcontext.Property.Where(x => x.PropertyId == id).FirstOrDefault();
                ent=_mapper.Map(updateProperty,ent );
                _dbcontext.Update(ent);
                await _dbcontext.SaveChangesAsync();
            }
            catch (Exception)
            {

                throw;
            }
        }

        async Task<List<Models.Property>> IRepository.GetAllProperties()
        {

            try
            {
                List<DataStore.Entities.Property> propertiesEnt = _dbcontext.Property.
                    Include(x => x.CustomData).
                    ThenInclude(x=>x.RelatedPropertyIDs).
                     Include(x=>x.Negotiator).
                    Include(x=>x.Location).
                    Include(x=>x.BrochureMap).
                    Include(x=>x.AuctionList).
                    Include(x=>x.AdditionalLogoUrls).
                    Include(x=>x.OpenViewings).
                    Include(x=>x.TravelTimes).
                    Include(x=>x.VirtualViewings).
                    ToList();

               List <Models.Property> properties= _mapper.Map<List<Models.Property>>(propertiesEnt);
               return properties;
            }
            catch (Exception ex)
            {

                throw;
            }
            
        }
    }
}
