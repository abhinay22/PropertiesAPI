using DataStore;
using DataStore.Entities;
using Microsoft.EntityFrameworkCore;
using Models;
using PropertiesAPI;
using PropertiesAPI.DTO;
using Repository;
using System.Reflection;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers().AddJsonOptions(x=>x.JsonSerializerOptions.PropertyNamingPolicy=null);
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
var mapperProfile = new AutomapperProfile();
builder.Services.AddAutoMapper(config =>
{
    config.AddProfile(mapperProfile);
}
);
builder.Services.AddScoped<IRepository, Repository.Repository>();
String connectionString = builder.Configuration.GetConnectionString("SqlConnectionString");
builder.Services.AddDbContext<PropertyDBContext>(config =>
config.UseSqlServer(connectionString)
);

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
