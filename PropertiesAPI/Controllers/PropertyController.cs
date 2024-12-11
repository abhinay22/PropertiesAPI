using Microsoft.AspNetCore.DataProtection.Repositories;
using Microsoft.AspNetCore.Mvc;
using Repository;
using PropertiesAPI.DTO;
using AutoMapper;
using Models;

namespace PropertiesAPI.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class PropertyController : ControllerBase
    {
      

        private readonly ILogger<PropertyController> _logger;
        private readonly IRepository _repo;
        private readonly IMapper _mapper;

        public PropertyController(IRepository repo, IMapper mapper)
        {
            this._repo = repo;
            _mapper = mapper;
        }

        [HttpGet(Name = "GetProperties")]
        public async Task<IActionResult> Get()
        {
            //repository call
            List<Property> result=await _repo.GetAllProperties();
            List<PropertyDTO> dto = _mapper.Map<List<Property>,List<PropertyDTO>>(result);

            return Ok(dto);
        }

        [HttpGet]
        public async Task<OkObjectResult> GetById(int id)
        {
            PropertyDTO dto=new PropertyDTO();
            return Ok(dto);
        }
    }
}
