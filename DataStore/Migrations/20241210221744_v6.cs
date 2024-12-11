using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DataStore.Migrations
{
    /// <inheritdoc />
    public partial class v6 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_Relations_CustomDataId",
                table: "Relations");

            migrationBuilder.CreateIndex(
                name: "IX_Relations_CustomDataId",
                table: "Relations",
                column: "CustomDataId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_Relations_CustomDataId",
                table: "Relations");

            migrationBuilder.CreateIndex(
                name: "IX_Relations_CustomDataId",
                table: "Relations",
                column: "CustomDataId",
                unique: true);
        }
    }
}
