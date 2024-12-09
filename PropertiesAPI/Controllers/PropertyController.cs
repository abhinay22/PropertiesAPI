using Microsoft.AspNetCore.DataProtection.Repositories;
using Microsoft.AspNetCore.Mvc;
using Repository;
using PropertiesAPI.DTO;

namespace PropertiesAPI.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class PropertyController : ControllerBase
    {
      

        private readonly ILogger<PropertyController> _logger;
        private readonly IRepository _repo;

        public PropertyController(IRepository repo)
        {
            this._repo = repo;
        }

        [HttpGet(Name = "GetProperties")]
        public async Task<IActionResult> Get()
        {
            //repository call
            var result=_repo.GetAllProperties();
            List<PropertyDTO> dto = new List<PropertyDTO>();


            return Ok(dto);
        }
    }
}
