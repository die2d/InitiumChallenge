using Initium.WebApi.ChallengeDP.Interfaces;
using Initium.WebApi.ChallengeDP.Models;
using Microsoft.EntityFrameworkCore;
using System.Linq.Expressions;

namespace Initium.WebApi.ChallengeDP.Repositories
{
    public class Repository<T> : IRepository<T> where T : class
    {
        private readonly LibraryManagementDBContext _context;
        private readonly DbSet<T> _dbSet;

        public Repository(LibraryManagementDBContext context)
        {
            _context = context;
            _dbSet = _context.Set<T>();
        }

        public IQueryable<T> GetAll()
        {
            return _dbSet.AsQueryable();
        }

        public async Task<T> GetByIdAsync(int id, params Expression<Func<T, object>>[] includes)
    {
        IQueryable<T> query = _dbSet;
        if (includes != null)
        {
            foreach (var include in includes)
            {
                query = query.Include(include);
            }
        }

        return await query.FirstOrDefaultAsync(entity => EF.Property<int>(entity, "Id") == id);
    }

        public async Task AddAsync(T entity)
        {
            await _dbSet.AddAsync(entity);
            await _context.SaveChangesAsync();
        }

        public async Task UpdateAsync(T entity)
        {
            _dbSet.Update(entity);
            await _context.SaveChangesAsync();
        }

        public async Task DeleteAsync(int id)
        {
            var entity = await _dbSet.FindAsync(id);
            if (entity != null)
            {
                _dbSet.Remove(entity);
                await _context.SaveChangesAsync();
            }
        }
    }
}
