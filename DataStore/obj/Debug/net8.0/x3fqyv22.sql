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

COMMIT;
GO

