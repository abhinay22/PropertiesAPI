IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
CREATE TABLE [property] (
    [PropertyId] int NOT NULL IDENTITY,
    [GroupId] int NOT NULL,
    [RefreshedOn] datetime2 NOT NULL,
    [Address] nvarchar(max) NOT NULL,
    [GroupPhoneNumber] nvarchar(max) NOT NULL,
    [GroupEmail] nvarchar(max) NOT NULL,
    [GroupName] nvarchar(max) NOT NULL,
    [GroupAddress] nvarchar(max) NOT NULL,
    [GroupUrlSlugIdentifier] nvarchar(max) NOT NULL,
    [CreatedOnDate] datetime2 NOT NULL,
    [ActivatedOn] datetime2 NOT NULL,
    [IsNew] bit NOT NULL,
    [IsSaleAgreed] bit NOT NULL,
    [GroupLogoBgColor] nvarchar(max) NOT NULL,
    [GroupPremiumHeadTextColour] nvarchar(max) NOT NULL,
    [GroupLogoUrl] nvarchar(max) NOT NULL,
    [GroupPremiumLogoUrl] nvarchar(max) NOT NULL,
    [GroupPremiumJointLogoUrl] nvarchar(max) NOT NULL,
    [GroupRectangularLogoUrl] nvarchar(max) NOT NULL,
    [JointGroupRectangularLogoUrl] nvarchar(max) NOT NULL,
    [JointGroupPremiumJointLogo] nvarchar(max) NOT NULL,
    [GroupUrl] nvarchar(max) NOT NULL,
    [IsPremiumAd] bit NOT NULL,
    [IsBuildToRent] bit NOT NULL,
    [IsBuildToRentDevelopment] bit NOT NULL,
    [IsPrivateLandlord] bit NOT NULL,
    [IsBrandBooster] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [SaleTypeId] int NOT NULL,
    [IsFavourite] bit NOT NULL,
    [HasVideos] bit NOT NULL,
    [HasWebP] bit NOT NULL,
    [IsMappedAccurately] bit NOT NULL,
    [IsTopSpot] bit NOT NULL,
    [BedsString] nvarchar(max) NOT NULL,
    [PriceAsString] nvarchar(max) NOT NULL,
    [id] int NOT NULL,
    [SizeStringMeters] int NOT NULL,
    [PriceChangeIsIncrease] bit NOT NULL,
    [DisplayAddress] nvarchar(max) NOT NULL,
    [PropertyClassId] int NOT NULL,
    [PropertyClass] nvarchar(max) NOT NULL,
    [PropertyClassUrlSlug] nvarchar(max) NOT NULL,
    [PropertyStatus] nvarchar(max) NOT NULL,
    [PropertyType] nvarchar(max) NOT NULL,
    [BathString] nvarchar(max) NOT NULL,
    [BerRating] nvarchar(max) NOT NULL,
    [EnergyRatingMediaPath] nvarchar(max) NOT NULL,
    [OrderedDisplayAddress] nvarchar(max) NOT NULL,
    [SeoDisplayAddress] nvarchar(max) NOT NULL,
    [BrochureUrl] nvarchar(max) NOT NULL,
    [SeoUrl] nvarchar(max) NOT NULL,
    [PhotoCount] int NOT NULL,
    [MainPhoto] nvarchar(max) NOT NULL,
    [MainPhotoWeb] nvarchar(max) NOT NULL,
    [RelatedPropertiesTotal] int NOT NULL,
    CONSTRAINT [PK_property] PRIMARY KEY ([PropertyId])
);

CREATE TABLE [AdditionalLogoUrls] (
    [id] int NOT NULL IDENTITY,
    [additionalLogoUrls] nvarchar(max) NOT NULL,
    [PropertyId] int NOT NULL,
    CONSTRAINT [PK_AdditionalLogoUrls] PRIMARY KEY ([id]),
    CONSTRAINT [FK_AdditionalLogoUrls_property_PropertyId] FOREIGN KEY ([PropertyId]) REFERENCES [property] ([PropertyId]) ON DELETE CASCADE
);

CREATE TABLE [AuctionList] (
    [id] int NOT NULL IDENTITY,
    [auctionName] nvarchar(max) NOT NULL,
    [PropertyId] int NOT NULL,
    CONSTRAINT [PK_AuctionList] PRIMARY KEY ([id]),
    CONSTRAINT [FK_AuctionList_property_PropertyId] FOREIGN KEY ([PropertyId]) REFERENCES [property] ([PropertyId]) ON DELETE CASCADE
);

CREATE TABLE [brochureMap] (
    [Id] int NOT NULL IDENTITY,
    [longitude] float NOT NULL,
    [latitude] float NOT NULL,
    [PropertyId] int NOT NULL,
    CONSTRAINT [PK_brochureMap] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_brochureMap_property_PropertyId] FOREIGN KEY ([PropertyId]) REFERENCES [property] ([PropertyId]) ON DELETE CASCADE
);

CREATE TABLE [customData] (
    [Id] int NOT NULL IDENTITY,
    [RelatedPropertyIDs] nvarchar(max) NOT NULL,
    [IsMyHomePassport] bit NOT NULL,
    [PropertyId] int NOT NULL,
    CONSTRAINT [PK_customData] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_customData_property_PropertyId] FOREIGN KEY ([PropertyId]) REFERENCES [property] ([PropertyId]) ON DELETE CASCADE
);

CREATE TABLE [locations] (
    [Id] int NOT NULL IDENTITY,
    [lat] float NOT NULL,
    [lon] float NOT NULL,
    [PropertyId] int NOT NULL,
    CONSTRAINT [PK_locations] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_locations_property_PropertyId] FOREIGN KEY ([PropertyId]) REFERENCES [property] ([PropertyId]) ON DELETE CASCADE
);

CREATE TABLE [negotiator] (
    [NegotiatorId] int NOT NULL IDENTITY,
    [Name] nvarchar(max) NOT NULL,
    [Email] nvarchar(max) NOT NULL,
    [WebSite] nvarchar(max) NOT NULL,
    [PropertyId] int NOT NULL,
    CONSTRAINT [PK_negotiator] PRIMARY KEY ([NegotiatorId]),
    CONSTRAINT [FK_negotiator_property_PropertyId] FOREIGN KEY ([PropertyId]) REFERENCES [property] ([PropertyId]) ON DELETE CASCADE
);

CREATE TABLE [openViewings] (
    [Id] int NOT NULL IDENTITY,
    [_openViewings] datetime2 NOT NULL,
    [PropertyId] int NOT NULL,
    CONSTRAINT [PK_openViewings] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_openViewings_property_PropertyId] FOREIGN KEY ([PropertyId]) REFERENCES [property] ([PropertyId]) ON DELETE CASCADE
);

CREATE TABLE [photos] (
    [Id] int NOT NULL IDENTITY,
    [_photo] nvarchar(max) NOT NULL,
    [PropertyId] int NOT NULL,
    CONSTRAINT [PK_photos] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_photos_property_PropertyId] FOREIGN KEY ([PropertyId]) REFERENCES [property] ([PropertyId]) ON DELETE CASCADE
);

CREATE TABLE [travelTimes] (
    [id] int NOT NULL IDENTITY,
    [_travelTimes] datetime2 NOT NULL,
    [PropertyId] int NOT NULL,
    CONSTRAINT [PK_travelTimes] PRIMARY KEY ([id]),
    CONSTRAINT [FK_travelTimes_property_PropertyId] FOREIGN KEY ([PropertyId]) REFERENCES [property] ([PropertyId]) ON DELETE CASCADE
);

CREATE TABLE [virtualViewings] (
    [id] int NOT NULL IDENTITY,
    [_virtualViewings] datetime2 NOT NULL,
    [PropertyId] int NOT NULL,
    CONSTRAINT [PK_virtualViewings] PRIMARY KEY ([id]),
    CONSTRAINT [FK_virtualViewings_property_PropertyId] FOREIGN KEY ([PropertyId]) REFERENCES [property] ([PropertyId]) ON DELETE CASCADE
);

CREATE INDEX [IX_AdditionalLogoUrls_PropertyId] ON [AdditionalLogoUrls] ([PropertyId]);

CREATE INDEX [IX_AuctionList_PropertyId] ON [AuctionList] ([PropertyId]);

CREATE UNIQUE INDEX [IX_brochureMap_PropertyId] ON [brochureMap] ([PropertyId]);

CREATE UNIQUE INDEX [IX_customData_PropertyId] ON [customData] ([PropertyId]);

CREATE UNIQUE INDEX [IX_locations_PropertyId] ON [locations] ([PropertyId]);

CREATE UNIQUE INDEX [IX_negotiator_PropertyId] ON [negotiator] ([PropertyId]);

CREATE INDEX [IX_openViewings_PropertyId] ON [openViewings] ([PropertyId]);

CREATE INDEX [IX_photos_PropertyId] ON [photos] ([PropertyId]);

CREATE INDEX [IX_travelTimes_PropertyId] ON [travelTimes] ([PropertyId]);

CREATE INDEX [IX_virtualViewings_PropertyId] ON [virtualViewings] ([PropertyId]);

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20241210145510_InitialCreate', N'9.0.0');

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20241210150002_v2', N'9.0.0');

ALTER TABLE [AdditionalLogoUrls] DROP CONSTRAINT [FK_AdditionalLogoUrls_property_PropertyId];

ALTER TABLE [AuctionList] DROP CONSTRAINT [FK_AuctionList_property_PropertyId];

ALTER TABLE [brochureMap] DROP CONSTRAINT [FK_brochureMap_property_PropertyId];

ALTER TABLE [customData] DROP CONSTRAINT [FK_customData_property_PropertyId];

ALTER TABLE [locations] DROP CONSTRAINT [FK_locations_property_PropertyId];

ALTER TABLE [negotiator] DROP CONSTRAINT [FK_negotiator_property_PropertyId];

ALTER TABLE [openViewings] DROP CONSTRAINT [FK_openViewings_property_PropertyId];

ALTER TABLE [photos] DROP CONSTRAINT [FK_photos_property_PropertyId];

ALTER TABLE [travelTimes] DROP CONSTRAINT [FK_travelTimes_property_PropertyId];

ALTER TABLE [virtualViewings] DROP CONSTRAINT [FK_virtualViewings_property_PropertyId];

ALTER TABLE [virtualViewings] DROP CONSTRAINT [PK_virtualViewings];

ALTER TABLE [travelTimes] DROP CONSTRAINT [PK_travelTimes];

ALTER TABLE [property] DROP CONSTRAINT [PK_property];

ALTER TABLE [photos] DROP CONSTRAINT [PK_photos];

ALTER TABLE [openViewings] DROP CONSTRAINT [PK_openViewings];

ALTER TABLE [negotiator] DROP CONSTRAINT [PK_negotiator];

ALTER TABLE [locations] DROP CONSTRAINT [PK_locations];

ALTER TABLE [customData] DROP CONSTRAINT [PK_customData];

ALTER TABLE [brochureMap] DROP CONSTRAINT [PK_brochureMap];

EXEC sp_rename N'[virtualViewings]', N'VirtualViewings', 'OBJECT';

EXEC sp_rename N'[travelTimes]', N'TravelTimes', 'OBJECT';

EXEC sp_rename N'[property]', N'Property', 'OBJECT';

EXEC sp_rename N'[photos]', N'Photos', 'OBJECT';

EXEC sp_rename N'[openViewings]', N'OpenViewings', 'OBJECT';

EXEC sp_rename N'[negotiator]', N'Negotiator', 'OBJECT';

EXEC sp_rename N'[locations]', N'Locations', 'OBJECT';

EXEC sp_rename N'[customData]', N'CustomData', 'OBJECT';

EXEC sp_rename N'[brochureMap]', N'BrochureMap', 'OBJECT';

EXEC sp_rename N'[VirtualViewings].[IX_virtualViewings_PropertyId]', N'IX_VirtualViewings_PropertyId', 'INDEX';

EXEC sp_rename N'[TravelTimes].[IX_travelTimes_PropertyId]', N'IX_TravelTimes_PropertyId', 'INDEX';

EXEC sp_rename N'[Photos].[IX_photos_PropertyId]', N'IX_Photos_PropertyId', 'INDEX';

EXEC sp_rename N'[OpenViewings].[IX_openViewings_PropertyId]', N'IX_OpenViewings_PropertyId', 'INDEX';

EXEC sp_rename N'[Negotiator].[IX_negotiator_PropertyId]', N'IX_Negotiator_PropertyId', 'INDEX';

EXEC sp_rename N'[Locations].[IX_locations_PropertyId]', N'IX_Locations_PropertyId', 'INDEX';

EXEC sp_rename N'[CustomData].[IX_customData_PropertyId]', N'IX_CustomData_PropertyId', 'INDEX';

EXEC sp_rename N'[BrochureMap].[IX_brochureMap_PropertyId]', N'IX_BrochureMap_PropertyId', 'INDEX';

ALTER TABLE [VirtualViewings] ADD CONSTRAINT [PK_VirtualViewings] PRIMARY KEY ([id]);

ALTER TABLE [TravelTimes] ADD CONSTRAINT [PK_TravelTimes] PRIMARY KEY ([id]);

ALTER TABLE [Property] ADD CONSTRAINT [PK_Property] PRIMARY KEY ([PropertyId]);

ALTER TABLE [Photos] ADD CONSTRAINT [PK_Photos] PRIMARY KEY ([Id]);

ALTER TABLE [OpenViewings] ADD CONSTRAINT [PK_OpenViewings] PRIMARY KEY ([Id]);

ALTER TABLE [Negotiator] ADD CONSTRAINT [PK_Negotiator] PRIMARY KEY ([NegotiatorId]);

ALTER TABLE [Locations] ADD CONSTRAINT [PK_Locations] PRIMARY KEY ([Id]);

ALTER TABLE [CustomData] ADD CONSTRAINT [PK_CustomData] PRIMARY KEY ([Id]);

ALTER TABLE [BrochureMap] ADD CONSTRAINT [PK_BrochureMap] PRIMARY KEY ([Id]);

ALTER TABLE [AdditionalLogoUrls] ADD CONSTRAINT [FK_AdditionalLogoUrls_Property_PropertyId] FOREIGN KEY ([PropertyId]) REFERENCES [Property] ([PropertyId]) ON DELETE CASCADE;

ALTER TABLE [AuctionList] ADD CONSTRAINT [FK_AuctionList_Property_PropertyId] FOREIGN KEY ([PropertyId]) REFERENCES [Property] ([PropertyId]) ON DELETE CASCADE;

ALTER TABLE [BrochureMap] ADD CONSTRAINT [FK_BrochureMap_Property_PropertyId] FOREIGN KEY ([PropertyId]) REFERENCES [Property] ([PropertyId]) ON DELETE CASCADE;

ALTER TABLE [CustomData] ADD CONSTRAINT [FK_CustomData_Property_PropertyId] FOREIGN KEY ([PropertyId]) REFERENCES [Property] ([PropertyId]) ON DELETE CASCADE;

ALTER TABLE [Locations] ADD CONSTRAINT [FK_Locations_Property_PropertyId] FOREIGN KEY ([PropertyId]) REFERENCES [Property] ([PropertyId]) ON DELETE CASCADE;

ALTER TABLE [Negotiator] ADD CONSTRAINT [FK_Negotiator_Property_PropertyId] FOREIGN KEY ([PropertyId]) REFERENCES [Property] ([PropertyId]) ON DELETE CASCADE;

ALTER TABLE [OpenViewings] ADD CONSTRAINT [FK_OpenViewings_Property_PropertyId] FOREIGN KEY ([PropertyId]) REFERENCES [Property] ([PropertyId]) ON DELETE CASCADE;

ALTER TABLE [Photos] ADD CONSTRAINT [FK_Photos_Property_PropertyId] FOREIGN KEY ([PropertyId]) REFERENCES [Property] ([PropertyId]) ON DELETE CASCADE;

ALTER TABLE [TravelTimes] ADD CONSTRAINT [FK_TravelTimes_Property_PropertyId] FOREIGN KEY ([PropertyId]) REFERENCES [Property] ([PropertyId]) ON DELETE CASCADE;

ALTER TABLE [VirtualViewings] ADD CONSTRAINT [FK_VirtualViewings_Property_PropertyId] FOREIGN KEY ([PropertyId]) REFERENCES [Property] ([PropertyId]) ON DELETE CASCADE;

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20241210154926_v3', N'9.0.0');

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20241210160436_v4', N'9.0.0');

DECLARE @var0 sysname;
SELECT @var0 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'SizeStringMeters');
IF @var0 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var0 + '];');
ALTER TABLE [Property] ALTER COLUMN [SizeStringMeters] int NULL;

DECLARE @var1 sysname;
SELECT @var1 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'SeoUrl');
IF @var1 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var1 + '];');
ALTER TABLE [Property] ALTER COLUMN [SeoUrl] nvarchar(max) NULL;

DECLARE @var2 sysname;
SELECT @var2 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'SeoDisplayAddress');
IF @var2 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var2 + '];');
ALTER TABLE [Property] ALTER COLUMN [SeoDisplayAddress] nvarchar(max) NULL;

DECLARE @var3 sysname;
SELECT @var3 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'RelatedPropertiesTotal');
IF @var3 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var3 + '];');
ALTER TABLE [Property] ALTER COLUMN [RelatedPropertiesTotal] int NULL;

DECLARE @var4 sysname;
SELECT @var4 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'PropertyType');
IF @var4 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var4 + '];');
ALTER TABLE [Property] ALTER COLUMN [PropertyType] nvarchar(max) NULL;

DECLARE @var5 sysname;
SELECT @var5 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'PropertyStatus');
IF @var5 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var5 + '];');
ALTER TABLE [Property] ALTER COLUMN [PropertyStatus] nvarchar(max) NULL;

DECLARE @var6 sysname;
SELECT @var6 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'PropertyClassUrlSlug');
IF @var6 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var6 + '];');
ALTER TABLE [Property] ALTER COLUMN [PropertyClassUrlSlug] nvarchar(max) NULL;

DECLARE @var7 sysname;
SELECT @var7 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'PropertyClassId');
IF @var7 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var7 + '];');
ALTER TABLE [Property] ALTER COLUMN [PropertyClassId] int NULL;

DECLARE @var8 sysname;
SELECT @var8 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'PropertyClass');
IF @var8 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var8 + '];');
ALTER TABLE [Property] ALTER COLUMN [PropertyClass] nvarchar(max) NULL;

DECLARE @var9 sysname;
SELECT @var9 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'PriceAsString');
IF @var9 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var9 + '];');
ALTER TABLE [Property] ALTER COLUMN [PriceAsString] nvarchar(max) NULL;

DECLARE @var10 sysname;
SELECT @var10 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'PhotoCount');
IF @var10 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var10 + '];');
ALTER TABLE [Property] ALTER COLUMN [PhotoCount] int NULL;

DECLARE @var11 sysname;
SELECT @var11 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'OrderedDisplayAddress');
IF @var11 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var11 + '];');
ALTER TABLE [Property] ALTER COLUMN [OrderedDisplayAddress] nvarchar(max) NULL;

DECLARE @var12 sysname;
SELECT @var12 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'MainPhotoWeb');
IF @var12 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var12 + '];');
ALTER TABLE [Property] ALTER COLUMN [MainPhotoWeb] nvarchar(max) NULL;

DECLARE @var13 sysname;
SELECT @var13 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'MainPhoto');
IF @var13 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var13 + '];');
ALTER TABLE [Property] ALTER COLUMN [MainPhoto] nvarchar(max) NULL;

DECLARE @var14 sysname;
SELECT @var14 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'JointGroupRectangularLogoUrl');
IF @var14 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var14 + '];');
ALTER TABLE [Property] ALTER COLUMN [JointGroupRectangularLogoUrl] nvarchar(max) NULL;

DECLARE @var15 sysname;
SELECT @var15 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'JointGroupPremiumJointLogo');
IF @var15 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var15 + '];');
ALTER TABLE [Property] ALTER COLUMN [JointGroupPremiumJointLogo] nvarchar(max) NULL;

DECLARE @var16 sysname;
SELECT @var16 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'GroupUrlSlugIdentifier');
IF @var16 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var16 + '];');
ALTER TABLE [Property] ALTER COLUMN [GroupUrlSlugIdentifier] nvarchar(max) NULL;

DECLARE @var17 sysname;
SELECT @var17 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'GroupUrl');
IF @var17 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var17 + '];');
ALTER TABLE [Property] ALTER COLUMN [GroupUrl] nvarchar(max) NULL;

DECLARE @var18 sysname;
SELECT @var18 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'GroupRectangularLogoUrl');
IF @var18 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var18 + '];');
ALTER TABLE [Property] ALTER COLUMN [GroupRectangularLogoUrl] nvarchar(max) NULL;

DECLARE @var19 sysname;
SELECT @var19 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'GroupPremiumLogoUrl');
IF @var19 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var19 + '];');
ALTER TABLE [Property] ALTER COLUMN [GroupPremiumLogoUrl] nvarchar(max) NULL;

DECLARE @var20 sysname;
SELECT @var20 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'GroupPremiumJointLogoUrl');
IF @var20 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var20 + '];');
ALTER TABLE [Property] ALTER COLUMN [GroupPremiumJointLogoUrl] nvarchar(max) NULL;

DECLARE @var21 sysname;
SELECT @var21 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'GroupPremiumHeadTextColour');
IF @var21 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var21 + '];');
ALTER TABLE [Property] ALTER COLUMN [GroupPremiumHeadTextColour] nvarchar(max) NULL;

DECLARE @var22 sysname;
SELECT @var22 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'GroupPhoneNumber');
IF @var22 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var22 + '];');
ALTER TABLE [Property] ALTER COLUMN [GroupPhoneNumber] nvarchar(max) NULL;

DECLARE @var23 sysname;
SELECT @var23 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'GroupName');
IF @var23 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var23 + '];');
ALTER TABLE [Property] ALTER COLUMN [GroupName] nvarchar(max) NULL;

DECLARE @var24 sysname;
SELECT @var24 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'GroupLogoUrl');
IF @var24 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var24 + '];');
ALTER TABLE [Property] ALTER COLUMN [GroupLogoUrl] nvarchar(max) NULL;

DECLARE @var25 sysname;
SELECT @var25 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'GroupLogoBgColor');
IF @var25 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var25 + '];');
ALTER TABLE [Property] ALTER COLUMN [GroupLogoBgColor] nvarchar(max) NULL;

DECLARE @var26 sysname;
SELECT @var26 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'GroupEmail');
IF @var26 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var26 + '];');
ALTER TABLE [Property] ALTER COLUMN [GroupEmail] nvarchar(max) NULL;

DECLARE @var27 sysname;
SELECT @var27 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'GroupAddress');
IF @var27 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var27 + '];');
ALTER TABLE [Property] ALTER COLUMN [GroupAddress] nvarchar(max) NULL;

DECLARE @var28 sysname;
SELECT @var28 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'EnergyRatingMediaPath');
IF @var28 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var28 + '];');
ALTER TABLE [Property] ALTER COLUMN [EnergyRatingMediaPath] nvarchar(max) NULL;

DECLARE @var29 sysname;
SELECT @var29 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'BrochureUrl');
IF @var29 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var29 + '];');
ALTER TABLE [Property] ALTER COLUMN [BrochureUrl] nvarchar(max) NULL;

DECLARE @var30 sysname;
SELECT @var30 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'BerRating');
IF @var30 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var30 + '];');
ALTER TABLE [Property] ALTER COLUMN [BerRating] nvarchar(max) NULL;

DECLARE @var31 sysname;
SELECT @var31 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'BedsString');
IF @var31 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var31 + '];');
ALTER TABLE [Property] ALTER COLUMN [BedsString] nvarchar(max) NULL;

DECLARE @var32 sysname;
SELECT @var32 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'BathString');
IF @var32 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var32 + '];');
ALTER TABLE [Property] ALTER COLUMN [BathString] nvarchar(max) NULL;

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20241210164727_v5', N'9.0.0');

COMMIT;
GO

