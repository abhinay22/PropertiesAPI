using AutoMapper;
using DataStore.Entities;
using PropertiesAPI.DTO;
using System.Linq.Expressions;
using static PropertiesAPI.TranslationConverter;

namespace PropertiesAPI
{
    public class AutomapperProfile : Profile
    {
        public AutomapperProfile()
        {

            CreateMap<PropertyDTO, Models.Property>().ReverseMap();
            CreateMap<CreatePropertyDTO, Models.Property>().ReverseMap();

            CreateMap<Models.Property, DataStore.Entities.Property>();

            CreateMap<DataStore.Entities.Property, Models.Property>().
            ForMember(x => x.AuctionList, y => y.MapFrom(s => s.AuctionList.Select(n => n.auctionName).ToList())).
            ForMember(n => n.AdditionalLogoUrls, y => y.MapFrom(r => r.AdditionalLogoUrls.Select(n => n.additionalLogoUrls).ToList())).
            ForMember(n => n.TravelTimes, y => y.MapFrom(r => r.TravelTimes.Select(n => n._travelTimes).ToList())).
             ForMember(n => n.OpenViewings, y => y.MapFrom(r => r.OpenViewings.Select(n => n._openViewings).ToList())).
             ForMember(n => n.VirtualViewings, y => y.MapFrom(r => r.VirtualViewings.Select(n => n._virtualViewings).ToList())).
             ForMember(n => n.Photos, y => y.MapFrom(r => r.Photos.Select(n => n._photo).ToList()));

            CreateMap<DataStore.Entities.CustomData, Models.CustomData>().ConvertUsing(new TranslationConverter2());

            CreateMap<Models.CustomData, DataStore.Entities.CustomData>().ConvertUsing(new TranslationConverter());
            CreateMap<string, AuctionList>().ConvertUsing(x => new AuctionList() { auctionName = x });
            CreateMap<string, AdditionalLogoUrls>().ConvertUsing(x => new AdditionalLogoUrls() { additionalLogoUrls = x });
            CreateMap<DateTime, TravelTimes>().ConvertUsing(x => new TravelTimes() { _travelTimes = x });
            CreateMap<DateTime, OpenViewings>().ConvertUsing(x => new OpenViewings() { _openViewings = x });
            CreateMap<DateTime, VirtualViewings>().ConvertUsing(x => new VirtualViewings() { _virtualViewings = x });
            CreateMap<string, Photos>().ConvertUsing(x => new Photos() { _photo = x });

            CreateMap<DTO.Location, Models.Location>().ReverseMap();
            CreateMap<DTO.Negotiator, Models.Negotiator>().ReverseMap();
            CreateMap<DTO.BrochureMap, Models.BrochureMap>().ReverseMap();

            CreateMap<Models.Location, DataStore.Entities.Location>().ReverseMap();
            CreateMap<Models.Negotiator, DataStore.Entities.Negotiator>().ReverseMap(); ;
            CreateMap<DataStore.Entities.BrochureMap, Models.BrochureMap>().ReverseMap();
            CreateMap<Models.CustomData, DTO.CustomData>().ReverseMap();


        }





    }
    public class TranslationConverter : ITypeConverter<Models.CustomData, DataStore.Entities.CustomData>
    {

        public DataStore.Entities.CustomData Convert(Models.CustomData source, DataStore.Entities.CustomData destination, ResolutionContext context)
        {
            if (source == null)
            {
                return null;
            }

            else
            {
                ICollection<Relation> relationIds = new List<Relation>();
                foreach (string item in source.RelatedPropertyIDs)
                {
                    relationIds.Add(new Relation() { RelationId = item });
                }
                return new DataStore.Entities.CustomData() { RelatedPropertyIDs = relationIds, IsMyHomePassport = source.IsMyHomePassport };
            }
        }
        public class TranslationConverter2 : ITypeConverter<DataStore.Entities.CustomData, Models.CustomData>
        {


            public Models.CustomData Convert(DataStore.Entities.CustomData source, Models.CustomData destination, ResolutionContext context)
            {
                if (source == null)
                {
                    return null;
                }

                else
                {
                    List<String> realtionids = new List<String>();

                    foreach (Relation item in source.RelatedPropertyIDs)
                    {
                        realtionids.Add(item.RelationId);
                    }
                    return new Models.CustomData() { RelatedPropertyIDs = realtionids, IsMyHomePassport = source.IsMyHomePassport };
                }
            }
        }
    }
}

