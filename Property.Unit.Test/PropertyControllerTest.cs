using FluentAssertions;
using Microsoft.AspNetCore.Mvc;
using PropertiesAPI.Controllers;

namespace Property.Unit.Test
{
    public class PropertyControllerTest
    {
        [Fact]
        public async void Get_OnSucess_Returns_200()
        {
            //arrange

            var controller = new PropertyController();

            //act

            var resultTask =(OkObjectResult) await controller.Get();


            //assert


            resultTask.StatusCode.Should().Equals(200);

        }
    }
}