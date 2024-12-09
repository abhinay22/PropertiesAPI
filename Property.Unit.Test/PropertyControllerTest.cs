using FluentAssertions;
using Microsoft.AspNetCore.Mvc;
using Moq;
using PropertiesAPI.Controllers;
using Repository;
using Models;

namespace Property.Unit.Test
{
    public class PropertyControllerTest
    {
        [Fact]
        public async void Get_OnSucess_Returns_200()
        {
            //arrange

            var mockRepository = new Mock<IRepository>();
            mockRepository.Setup(service => service.GetAllProperties()).ReturnsAsync(new List<Models.Property>());
            var controller = new PropertyController(mockRepository.Object);

            //act

            var resultTask =(OkObjectResult) await controller.Get();


            //assert


            resultTask.StatusCode.Should().Be(200);

        }

        [Fact]
        public async void Get_Onsucess_InvokesRepositoryService()
        {
            var mockRepository = new Mock<IRepository>();
            mockRepository.Setup(service => service.GetAllProperties()).ReturnsAsync(new List<Models.Property>());
            var controller = new PropertyController(mockRepository.Object);

            await controller.Get();
            mockRepository.Verify(x=>x.GetAllProperties(), Times.Once);
        }
    }
}