using BlazorApp1.Models;
using Microsoft.EntityFrameworkCore;

namespace BlazorApp1.Data
{
    public class CrudContext : DbContext
    {
        public CrudContext(DbContextOptions<CrudContext> options) : base(options) { }

        public DbSet<Person> People { get; set; } = null!;

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            // Ejemplo: índice único en Cedula para evitar duplicados
            modelBuilder.Entity<Person>()
                .HasIndex(p => p.Cedula)
                .IsUnique(false); // poner true si quieres forzar unicidad
        }
    }
}
