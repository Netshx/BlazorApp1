using BlazorApp1.Data;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddRazorPages();
builder.Services.AddServerSideBlazor();

// Registrar DbContextFactory (recomendado para Blazor Server)
builder.Services.AddDbContextFactory<CrudContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));


var app = builder.Build();

// Aplicar migraciones automáticamente en desarrollo (opcional)
using (var scope = app.Services.CreateScope())
{
    try
    {
        var factory = scope.ServiceProvider.GetRequiredService<IDbContextFactory<CrudContext>>();
        using var ctx = factory.CreateDbContext();
        ctx.Database.Migrate();
    }
    catch (Exception ex)
    {
        // En producción quizá quieras loggear en vez de fallar silenciosamente.
        Console.WriteLine($"Error applying migrations: {ex.Message}");
    }
}

if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();
app.UseRouting();

app.MapBlazorHub();
app.MapFallbackToPage("/_Host");

app.Run();