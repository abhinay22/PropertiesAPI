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

        [HttpGet("id")]
        public async Task<IActionResult> GetById(int id)
        {
            //repositroy call
             Property result= await _repo.GetProperyById(id);
            PropertyDTO dto= _mapper.Map<Property,PropertyDTO>(result);
            return Ok(dto);
        }
        [HttpPost]
        public async Task<ActionResult<PropertyDTO>> CreatePropertyAsync(CreatePropertyDTO propoerty)
        {



        }
    }
}
