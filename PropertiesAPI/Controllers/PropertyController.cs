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

        public PropertyController(IRepository repo, IMapper mapper,ILogger<PropertyController> logger)
        {
            this._repo = repo;
            _mapper = mapper;
            this._logger = logger;
        }

        [HttpGet(Name = "GetProperties")]
        public async Task<IActionResult> Get()
        {
            try
            {
                //repository call
                List<Property> result = await _repo.GetAllProperties();
                List<PropertyDTO> dto = _mapper.Map<List<Property>, List<PropertyDTO>>(result);

                return Ok(dto);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.Message);
                return BadRequest("Error ,Please try later");
            }
         
        }

        [HttpGet("id")]
        public async Task<IActionResult> GetById(int id)
        {
            try
            {
                //repositroy call
                Property result = await _repo.GetProperyById(id);
                PropertyDTO dto = _mapper.Map<Property, PropertyDTO>(result);
                return Ok(dto);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.Message);
                return BadRequest("Error ,Please try later");
            }
          
        }
        [HttpPost]
        public async Task<ActionResult<PropertyDTO>> CreatePropertyAsync([FromBody] CreatePropertyDTO propoerty)
        {
            try
            {
                Property prop = _mapper.Map<Property>(propoerty);
                int id = await _repo.AddProperty(prop);
                var properyCreated = await _repo.GetProperyById(id);
                var propDTO = _mapper.Map<PropertyDTO>(properyCreated);
                return CreatedAtAction(nameof(GetById), new { id = id }, propDTO);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.Message);
                return BadRequest("Error ,Please try later"); ;
            }
           ;

        }
        [HttpDelete("id")]
        public async Task<ActionResult> DeletePropertyAsync(int id)
        {
            try
            {
                var existingPropety = await _repo.GetProperyById(id);
                if (existingPropety == null)
                    return NotFound();

                await _repo.DeleteProperty(id);
                return NoContent();

            }
            catch (Exception ex)
            {

                _logger.LogError(ex.Message);
                return BadRequest("Error ,Please try later"); 
            }
           


        }

        [HttpPut("id")]
        public async Task<ActionResult> UpdatePropertyAsync(int id,[FromBody]PropertyDTO toUpdateProperty)
        {
            try
            {
                var existingPropety = await _repo.GetProperyById(id);
                if (existingPropety == null)
                    return NotFound();
                Property updateProperty = _mapper.Map<Property>(toUpdateProperty);
                await _repo.UpdateProperty(id, updateProperty);
                return NoContent();
            }
            catch (Exception ex)
            {

                _logger.LogError(ex.Message);
                return BadRequest("Error ,Please try later");
            }
            
        }
    }
}

