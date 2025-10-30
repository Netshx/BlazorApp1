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
IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20251029221259_InitialCreate'
)
BEGIN
    CREATE TABLE [People] (
        [Id] int NOT NULL IDENTITY,
        [Cedula] nvarchar(50) NOT NULL,
        [Nombre] nvarchar(100) NOT NULL,
        [Apellidos] nvarchar(100) NOT NULL,
        [Edad] int NOT NULL,
        CONSTRAINT [PK_People] PRIMARY KEY ([Id])
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20251029221259_InitialCreate'
)
BEGIN
    CREATE INDEX [IX_People_Cedula] ON [People] ([Cedula]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20251029221259_InitialCreate'
)
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20251029221259_InitialCreate', N'9.0.10');
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20251029223548_creacion1'
)
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20251029223548_creacion1', N'9.0.10');
END;

COMMIT;
GO

