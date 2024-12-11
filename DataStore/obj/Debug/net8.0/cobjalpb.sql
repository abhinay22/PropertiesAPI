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
CREATE TABLE [Property] (
    [PropertyId] int NOT NULL IDENTITY,
    [GroupId] int NOT NULL,
    [RefreshedOn] datetime2 NOT NULL,
    [Address] nvarchar(max) NOT NULL,
    [GroupPhoneNumber] nvarchar(max) NULL,
    [GroupEmail] nvarchar(max) NULL,
    [GroupName] nvarchar(max) NULL,
    [GroupAddress] nvarchar(max) NULL,
    [GroupUrlSlugIdentifier] nvarchar(max) NULL,
    [CreatedOnDate] datetime2 NOT NULL,
    [ActivatedOn] datetime2 NOT NULL,
    [IsNew] bit NOT NULL,
    [IsSaleAgreed] bit NOT NULL,
    [GroupLogoBgColor] nvarchar(max) NULL,
    [GroupPremiumHeadTextColour] nvarchar(max) NULL,
    [GroupLogoUrl] nvarchar(max) NULL,
    [GroupPremiumLogoUrl] nvarchar(max) NULL,
    [GroupPremiumJointLogoUrl] nvarchar(max) NULL,
    [GroupRectangularLogoUrl] nvarchar(max) NULL,
    [JointGroupRectangularLogoUrl] nvarchar(max) NULL,
    [JointGroupPremiumJointLogo] nvarchar(max) NULL,
    [GroupUrl] nvarchar(max) NULL,
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
    [BedsString] nvarchar(max) NULL,
    [PriceAsString] nvarchar(max) NULL,
    [id] int NOT NULL,
    [SizeStringMeters] int NULL,
    [PriceChangeIsIncrease] bit NOT NULL,
    [DisplayAddress] nvarchar(max) NOT NULL,
    [PropertyClassId] int NULL,
    [PropertyClass] nvarchar(max) NULL,
    [PropertyClassUrlSlug] nvarchar(max) NULL,
    [PropertyStatus] nvarchar(max) NULL,
    [PropertyType] nvarchar(max) NULL,
    [BathString] nvarchar(max) NULL,
    [BerRating] nvarchar(max) NULL,
    [EnergyRatingMediaPath] nvarchar(max) NULL,
    [OrderedDisplayAddress] nvarchar(max) NULL,
    [SeoDisplayAddress] nvarchar(max) NULL,
    [BrochureUrl] nvarchar(max) NULL,
    [SeoUrl] nvarchar(max) NULL,
    [PhotoCount] int NULL,
    [MainPhoto] nvarchar(max) NULL,
    [MainPhotoWeb] nvarchar(max) NULL,
    [RelatedPropertiesTotal] int NULL,
    CONSTRAINT [PK_Property] PRIMARY KEY ([PropertyId])
);

CREATE TABLE [AdditionalLogoUrls] (
    [id] int NOT NULL IDENTITY,
    [additionalLogoUrls] nvarchar(max) NOT NULL,
    [PropertyId] int NOT NULL,
    CONSTRAINT [PK_AdditionalLogoUrls] PRIMARY KEY ([id]),
    CONSTRAINT [FK_AdditionalLogoUrls_Property_PropertyId] FOREIGN KEY ([PropertyId]) REFERENCES [Property] ([PropertyId]) ON DELETE CASCADE
);

CREATE TABLE [AuctionList] (
    [id] int NOT NULL IDENTITY,
    [auctionName] nvarchar(max) NOT NULL,
    [PropertyId] int NOT NULL,
    CONSTRAINT [PK_AuctionList] PRIMARY KEY ([id]),
    CONSTRAINT [FK_AuctionList_Property_PropertyId] FOREIGN KEY ([PropertyId]) REFERENCES [Property] ([PropertyId]) ON DELETE CASCADE
);

CREATE TABLE [BrochureMap] (
    [Id] int NOT NULL IDENTITY,
    [longitude] float NOT NULL,
    [latitude] float NOT NULL,
    [PropertyId] int NOT NULL,
    CONSTRAINT [PK_BrochureMap] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_BrochureMap_Property_PropertyId] FOREIGN KEY ([PropertyId]) REFERENCES [Property] ([PropertyId]) ON DELETE CASCADE
);

CREATE TABLE [CustomData] (
    [Id] int NOT NULL IDENTITY,
    [IsMyHomePassport] bit NOT NULL,
    [PropertyId] int NOT NULL,
    CONSTRAINT [PK_CustomData] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_CustomData_Property_PropertyId] FOREIGN KEY ([PropertyId]) REFERENCES [Property] ([PropertyId]) ON DELETE CASCADE
);

CREATE TABLE [Locations] (
    [Id] int NOT NULL IDENTITY,
    [lat] float NOT NULL,
    [lon] float NOT NULL,
    [PropertyId] int NOT NULL,
    CONSTRAINT [PK_Locations] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Locations_Property_PropertyId] FOREIGN KEY ([PropertyId]) REFERENCES [Property] ([PropertyId]) ON DELETE CASCADE
);

CREATE TABLE [Negotiator] (
    [Id] int NOT NULL IDENTITY,
    [NegotiatorId] int NOT NULL,
    [Name] nvarchar(max) NOT NULL,
    [Email] nvarchar(max) NOT NULL,
    [WebSite] nvarchar(max) NOT NULL,
    [PropertyId] int NOT NULL,
    CONSTRAINT [PK_Negotiator] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Negotiator_Property_PropertyId] FOREIGN KEY ([PropertyId]) REFERENCES [Property] ([PropertyId]) ON DELETE CASCADE
);

CREATE TABLE [OpenViewings] (
    [Id] int NOT NULL IDENTITY,
    [_openViewings] datetime2 NOT NULL,
    [PropertyId] int NOT NULL,
    CONSTRAINT [PK_OpenViewings] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_OpenViewings_Property_PropertyId] FOREIGN KEY ([PropertyId]) REFERENCES [Property] ([PropertyId]) ON DELETE CASCADE
);

CREATE TABLE [Photos] (
    [Id] int NOT NULL IDENTITY,
    [_photo] nvarchar(max) NOT NULL,
    [PropertyId] int NOT NULL,
    CONSTRAINT [PK_Photos] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Photos_Property_PropertyId] FOREIGN KEY ([PropertyId]) REFERENCES [Property] ([PropertyId]) ON DELETE CASCADE
);

CREATE TABLE [TravelTimes] (
    [id] int NOT NULL IDENTITY,
    [_travelTimes] datetime2 NOT NULL,
    [PropertyId] int NOT NULL,
    CONSTRAINT [PK_TravelTimes] PRIMARY KEY ([id]),
    CONSTRAINT [FK_TravelTimes_Property_PropertyId] FOREIGN KEY ([PropertyId]) REFERENCES [Property] ([PropertyId]) ON DELETE CASCADE
);

CREATE TABLE [VirtualViewings] (
    [id] int NOT NULL IDENTITY,
    [_virtualViewings] datetime2 NOT NULL,
    [PropertyId] int NOT NULL,
    CONSTRAINT [PK_VirtualViewings] PRIMARY KEY ([id]),
    CONSTRAINT [FK_VirtualViewings_Property_PropertyId] FOREIGN KEY ([PropertyId]) REFERENCES [Property] ([PropertyId]) ON DELETE CASCADE
);

CREATE TABLE [Relations] (
    [Id] int NOT NULL IDENTITY,
    [RelationId] nvarchar(max) NOT NULL,
    [CustomDataId] int NOT NULL,
    CONSTRAINT [PK_Relations] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Relations_CustomData_CustomDataId] FOREIGN KEY ([CustomDataId]) REFERENCES [CustomData] ([Id]) ON DELETE CASCADE
);

CREATE INDEX [IX_AdditionalLogoUrls_PropertyId] ON [AdditionalLogoUrls] ([PropertyId]);

CREATE INDEX [IX_AuctionList_PropertyId] ON [AuctionList] ([PropertyId]);

CREATE UNIQUE INDEX [IX_BrochureMap_PropertyId] ON [BrochureMap] ([PropertyId]);

CREATE UNIQUE INDEX [IX_CustomData_PropertyId] ON [CustomData] ([PropertyId]);

CREATE UNIQUE INDEX [IX_Locations_PropertyId] ON [Locations] ([PropertyId]);

CREATE UNIQUE INDEX [IX_Negotiator_PropertyId] ON [Negotiator] ([PropertyId]);

CREATE INDEX [IX_OpenViewings_PropertyId] ON [OpenViewings] ([PropertyId]);

CREATE INDEX [IX_Photos_PropertyId] ON [Photos] ([PropertyId]);

CREATE UNIQUE INDEX [IX_Relations_CustomDataId] ON [Relations] ([CustomDataId]);

CREATE INDEX [IX_TravelTimes_PropertyId] ON [TravelTimes] ([PropertyId]);

CREATE INDEX [IX_VirtualViewings_PropertyId] ON [VirtualViewings] ([PropertyId]);

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20241210175842_initialCreate', N'9.0.0');

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20241210181109_v2', N'9.0.0');

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20241210191654_v5', N'9.0.0');

DROP INDEX [IX_Relations_CustomDataId] ON [Relations];

CREATE INDEX [IX_Relations_CustomDataId] ON [Relations] ([CustomDataId]);

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20241210221744_v6', N'9.0.0');

DECLARE @var0 sysname;
SELECT @var0 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'SizeStringMeters');
IF @var0 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var0 + '];');
ALTER TABLE [Property] ALTER COLUMN [SizeStringMeters] float NULL;

DECLARE @var1 sysname;
SELECT @var1 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Property]') AND [c].[name] = N'RefreshedOn');
IF @var1 IS NOT NULL EXEC(N'ALTER TABLE [Property] DROP CONSTRAINT [' + @var1 + '];');
ALTER TABLE [Property] ALTER COLUMN [RefreshedOn] datetime2 NULL;

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20241211195636_v9', N'9.0.0');

COMMIT;
GO

