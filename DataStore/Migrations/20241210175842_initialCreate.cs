using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DataStore.Migrations
{
    /// <inheritdoc />
    public partial class initialCreate : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Property",
                columns: table => new
                {
                    PropertyId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    GroupId = table.Column<int>(type: "int", nullable: false),
                    RefreshedOn = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Address = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    GroupPhoneNumber = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    GroupEmail = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    GroupName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    GroupAddress = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    GroupUrlSlugIdentifier = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CreatedOnDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    ActivatedOn = table.Column<DateTime>(type: "datetime2", nullable: false),
                    IsNew = table.Column<bool>(type: "bit", nullable: false),
                    IsSaleAgreed = table.Column<bool>(type: "bit", nullable: false),
                    GroupLogoBgColor = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    GroupPremiumHeadTextColour = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    GroupLogoUrl = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    GroupPremiumLogoUrl = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    GroupPremiumJointLogoUrl = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    GroupRectangularLogoUrl = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    JointGroupRectangularLogoUrl = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    JointGroupPremiumJointLogo = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    GroupUrl = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IsPremiumAd = table.Column<bool>(type: "bit", nullable: false),
                    IsBuildToRent = table.Column<bool>(type: "bit", nullable: false),
                    IsBuildToRentDevelopment = table.Column<bool>(type: "bit", nullable: false),
                    IsPrivateLandlord = table.Column<bool>(type: "bit", nullable: false),
                    IsBrandBooster = table.Column<bool>(type: "bit", nullable: false),
                    IsActive = table.Column<bool>(type: "bit", nullable: false),
                    SaleTypeId = table.Column<int>(type: "int", nullable: false),
                    IsFavourite = table.Column<bool>(type: "bit", nullable: false),
                    HasVideos = table.Column<bool>(type: "bit", nullable: false),
                    HasWebP = table.Column<bool>(type: "bit", nullable: false),
                    IsMappedAccurately = table.Column<bool>(type: "bit", nullable: false),
                    IsTopSpot = table.Column<bool>(type: "bit", nullable: false),
                    BedsString = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PriceAsString = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    id = table.Column<int>(type: "int", nullable: false),
                    SizeStringMeters = table.Column<int>(type: "int", nullable: true),
                    PriceChangeIsIncrease = table.Column<bool>(type: "bit", nullable: false),
                    DisplayAddress = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    PropertyClassId = table.Column<int>(type: "int", nullable: true),
                    PropertyClass = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PropertyClassUrlSlug = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PropertyStatus = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PropertyType = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    BathString = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    BerRating = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    EnergyRatingMediaPath = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    OrderedDisplayAddress = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    SeoDisplayAddress = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    BrochureUrl = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    SeoUrl = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PhotoCount = table.Column<int>(type: "int", nullable: true),
                    MainPhoto = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    MainPhotoWeb = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    RelatedPropertiesTotal = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Property", x => x.PropertyId);
                });

            migrationBuilder.CreateTable(
                name: "AdditionalLogoUrls",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    additionalLogoUrls = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    PropertyId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AdditionalLogoUrls", x => x.id);
                    table.ForeignKey(
                        name: "FK_AdditionalLogoUrls_Property_PropertyId",
                        column: x => x.PropertyId,
                        principalTable: "Property",
                        principalColumn: "PropertyId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AuctionList",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    auctionName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    PropertyId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AuctionList", x => x.id);
                    table.ForeignKey(
                        name: "FK_AuctionList_Property_PropertyId",
                        column: x => x.PropertyId,
                        principalTable: "Property",
                        principalColumn: "PropertyId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "BrochureMap",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    longitude = table.Column<double>(type: "float", nullable: false),
                    latitude = table.Column<double>(type: "float", nullable: false),
                    PropertyId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_BrochureMap", x => x.Id);
                    table.ForeignKey(
                        name: "FK_BrochureMap_Property_PropertyId",
                        column: x => x.PropertyId,
                        principalTable: "Property",
                        principalColumn: "PropertyId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "CustomData",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    IsMyHomePassport = table.Column<bool>(type: "bit", nullable: false),
                    PropertyId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CustomData", x => x.Id);
                    table.ForeignKey(
                        name: "FK_CustomData_Property_PropertyId",
                        column: x => x.PropertyId,
                        principalTable: "Property",
                        principalColumn: "PropertyId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Locations",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    lat = table.Column<double>(type: "float", nullable: false),
                    lon = table.Column<double>(type: "float", nullable: false),
                    PropertyId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Locations", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Locations_Property_PropertyId",
                        column: x => x.PropertyId,
                        principalTable: "Property",
                        principalColumn: "PropertyId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Negotiator",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    NegotiatorId = table.Column<int>(type: "int", nullable: false),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Email = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    WebSite = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    PropertyId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Negotiator", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Negotiator_Property_PropertyId",
                        column: x => x.PropertyId,
                        principalTable: "Property",
                        principalColumn: "PropertyId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "OpenViewings",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    _openViewings = table.Column<DateTime>(type: "datetime2", nullable: false),
                    PropertyId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_OpenViewings", x => x.Id);
                    table.ForeignKey(
                        name: "FK_OpenViewings_Property_PropertyId",
                        column: x => x.PropertyId,
                        principalTable: "Property",
                        principalColumn: "PropertyId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Photos",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    _photo = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    PropertyId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Photos", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Photos_Property_PropertyId",
                        column: x => x.PropertyId,
                        principalTable: "Property",
                        principalColumn: "PropertyId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "TravelTimes",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    _travelTimes = table.Column<DateTime>(type: "datetime2", nullable: false),
                    PropertyId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TravelTimes", x => x.id);
                    table.ForeignKey(
                        name: "FK_TravelTimes_Property_PropertyId",
                        column: x => x.PropertyId,
                        principalTable: "Property",
                        principalColumn: "PropertyId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "VirtualViewings",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    _virtualViewings = table.Column<DateTime>(type: "datetime2", nullable: false),
                    PropertyId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_VirtualViewings", x => x.id);
                    table.ForeignKey(
                        name: "FK_VirtualViewings_Property_PropertyId",
                        column: x => x.PropertyId,
                        principalTable: "Property",
                        principalColumn: "PropertyId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Relations",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    RelationId = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    CustomDataId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Relations", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Relations_CustomData_CustomDataId",
                        column: x => x.CustomDataId,
                        principalTable: "CustomData",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_AdditionalLogoUrls_PropertyId",
                table: "AdditionalLogoUrls",
                column: "PropertyId");

            migrationBuilder.CreateIndex(
                name: "IX_AuctionList_PropertyId",
                table: "AuctionList",
                column: "PropertyId");

            migrationBuilder.CreateIndex(
                name: "IX_BrochureMap_PropertyId",
                table: "BrochureMap",
                column: "PropertyId",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_CustomData_PropertyId",
                table: "CustomData",
                column: "PropertyId",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Locations_PropertyId",
                table: "Locations",
                column: "PropertyId",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Negotiator_PropertyId",
                table: "Negotiator",
                column: "PropertyId",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_OpenViewings_PropertyId",
                table: "OpenViewings",
                column: "PropertyId");

            migrationBuilder.CreateIndex(
                name: "IX_Photos_PropertyId",
                table: "Photos",
                column: "PropertyId");

            migrationBuilder.CreateIndex(
                name: "IX_Relations_CustomDataId",
                table: "Relations",
                column: "CustomDataId",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_TravelTimes_PropertyId",
                table: "TravelTimes",
                column: "PropertyId");

            migrationBuilder.CreateIndex(
                name: "IX_VirtualViewings_PropertyId",
                table: "VirtualViewings",
                column: "PropertyId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "AdditionalLogoUrls");

            migrationBuilder.DropTable(
                name: "AuctionList");

            migrationBuilder.DropTable(
                name: "BrochureMap");

            migrationBuilder.DropTable(
                name: "Locations");

            migrationBuilder.DropTable(
                name: "Negotiator");

            migrationBuilder.DropTable(
                name: "OpenViewings");

            migrationBuilder.DropTable(
                name: "Photos");

            migrationBuilder.DropTable(
                name: "Relations");

            migrationBuilder.DropTable(
                name: "TravelTimes");

            migrationBuilder.DropTable(
                name: "VirtualViewings");

            migrationBuilder.DropTable(
                name: "CustomData");

            migrationBuilder.DropTable(
                name: "Property");
        }
    }
}
