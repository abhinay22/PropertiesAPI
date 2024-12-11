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
            List<Property> result = await _repo.GetAllProperties();
            List<PropertyDTO> dto = _mapper.Map<List<Property>, List<PropertyDTO>>(result);

            return Ok(dto);
        }

        [HttpGet("id")]
        public async Task<IActionResult> GetById(int id)
        {
            //repositroy call
            Property result = await _repo.GetProperyById(id);
            PropertyDTO dto = _mapper.Map<Property, PropertyDTO>(result);
            return Ok(dto);
        }
        [HttpPost]
        public async Task<ActionResult<PropertyDTO>> CreatePropertyAsync([FromBody] CreatePropertyDTO propoerty)
        {
            Property prop = _mapper.Map<Property>(propoerty);
            int id = await _repo.AddProperty(prop);
            var properyCreated = await _repo.GetProperyById(id);
            var propDTO = _mapper.Map<PropertyDTO>(properyCreated);
            return CreatedAtAction(nameof(GetById), new { id = id }, propDTO);

        }
        [HttpDelete("id")]
        public async Task<ActionResult> DeletePropertyAsync(int id)
        {
            var existingPropety = await _repo.GetProperyById(id);
            if (existingPropety == null)
                return NotFound();

            await _repo.DeleteProperty(id);
            return NoContent();


        }

        [HttpPut("id")]
        public async Task<ActionResult> UpdatePropertyAsync(int id,[FromBody]PropertyDTO toUpdateProperty)
        {
            var existingPropety = await _repo.GetProperyById(id);
           Property updateProperty= _mapper.Map<Property>(toUpdateProperty);
            await _repo.UpdateProperty(id, updateProperty);
            return NoContent();
        }
    }
}

