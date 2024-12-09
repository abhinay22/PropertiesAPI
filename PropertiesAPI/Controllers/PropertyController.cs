using Microsoft.AspNetCore.Mvc;

namespace PropertiesAPI.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class PropertyController : ControllerBase
    {
      

        private readonly ILogger<PropertyController> _logger;

        public PropertyController()
        {
          
        }

        [HttpGet(Name = "GetProperties")]
        public async Task<IActionResult> Get()
        {

            return null;
        }
    }
}
