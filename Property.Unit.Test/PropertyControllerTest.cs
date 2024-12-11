using FluentAssertions;
using Microsoft.AspNetCore.Mvc;
using Moq;
using PropertiesAPI.Controllers;
using Repository;
using Models;
using AutoMapper;
using PropertiesAPI.DTO;
using Xunit.Sdk;
using PropertiesAPI;

namespace Property.Unit.Test
{
    public class PropertyControllerTest
    {
        private static IMapper _mapper;
        public PropertyControllerTest()
        {
            if (_mapper == null)
            {
                var mappingConfig = new MapperConfiguration(cfg =>
                {
                    cfg.AddProfile(new AutomapperProfile());
                });
                IMapper mapper = mappingConfig.CreateMapper();
                _mapper = mapper;
            }
        }

        [Fact]
        public async void Get_OnSucess_Returns_200()
        {
            //arrange

            var mockRepository = new Mock<IRepository>();
            mockRepository.Setup(service => service.GetAllProperties()).ReturnsAsync(new List<Models.Property>());
            var controller = new PropertyController(mockRepository.Object, _mapper);

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
            var controller = new PropertyController(mockRepository.Object, _mapper);

            await controller.Get();
            mockRepository.Verify(x=>x.GetAllProperties(), Times.Once);
        }

        [Fact]
        public async void Get_OnSuccess_Returns_List_Of_Properties()
        {
            var mockRepository = new Mock<IRepository>();
            mockRepository.Setup(service => service.GetAllProperties()).ReturnsAsync(new List<Models.Property>());
            var controller = new PropertyController(mockRepository.Object, _mapper);

            var resultTask = (OkObjectResult)await controller.Get();
            resultTask.Should().BeOfType<OkObjectResult>();
            resultTask.Value.Should().BeOfType<List<PropertiesAPI.DTO.PropertyDTO>>();


        }


        [Fact]
        public async void GetById_OnSucess_Returns_200()
        {
            //arrange
            int propertyId = 1;
            var mockRepository = new Mock<IRepository>();
            mockRepository.Setup(service => service.GetProperyById(propertyId)).ReturnsAsync(new Models.Property());
            var controller = new PropertyController(mockRepository.Object, _mapper);

            //act

            var resultTask = (OkObjectResult)await controller.GetById(propertyId);


            //assert


            resultTask.StatusCode.Should().Be(200);

        }

        [Fact]
        public async void GetByid_OnSuccess_Returns_Single_Property()
        {
            int id = 1;
            var mockRepository = new Mock<IRepository>();
            mockRepository.Setup(service => service.GetProperyById(1)).ReturnsAsync(new Models.Property());
            var controller = new PropertyController(mockRepository.Object, _mapper);

            var resultTask = (OkObjectResult)await controller.GetById(id);
            resultTask.Should().BeOfType<OkObjectResult>();
            resultTask.Value.Should().BeOfType<PropertiesAPI.DTO.PropertyDTO>();


        }
        [Fact]
        public async void CreatePropertyAsync_WithProperty_ReturnsNewProperty()
        {
            var mockRepository = new Mock<IRepository>();
            mockRepository.Setup(service => service.GetProperyById(1)).ReturnsAsync(new Models.Property());
            var controller = new PropertyController(mockRepository.Object, _mapper);
            var createPropDTO= new CreatePropertyDTO();
            var resultTask = await controller.CreatePropertyAsync(createPropDTO);

            var createdItem= (resultTask.Result as CreatedAtActionResult).Value as PropertyDTO;
            createPropDTO.Should().BeEquivalentTo(createdItem,options=>options.ComparingByMembers<PropertyDTO>().ExcludingMissingMembers());

        }

    }
}