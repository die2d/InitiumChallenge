using Initium.WebApi.ChallengeDP.Interfaces;
using Initium.WebApi.ChallengeDP.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Initium.WebApi.ChallengeDP.Services
{
    public class BookService : IBookService
    {
        private readonly IRepository<Book> _bookRepository;

        public BookService(IRepository<Book> bookRepository)
        {
            _bookRepository = bookRepository;
        }

        public async Task<IEnumerable<Book>> GetBooksAsync(string author = null, int? publishedYear = null, string genre = null, int pageNumber = 1, int pageSize = 10)
        {
            var query = _bookRepository.GetAll();

            // Filtrar libros sin usuario asignado
            query = query.Where(b => b.UserId == null || b.UserId == 0);

            // Filtrar por autor si se proporciona
            if (!string.IsNullOrEmpty(author))
            {
                query = query.Where(b => EF.Functions.Like(b.Author, $"%{author}%"));
            }

            // Filtrar por año de publicación si se proporciona
            if (publishedYear.HasValue)
            {
                query = query.Where(b => b.PublishedYear == publishedYear.Value);
            }

            // Filtrar por género si se proporciona
            if (!string.IsNullOrEmpty(genre))
            {
                query = query.Where(b => EF.Functions.Like(b.Genre, $"%{genre}%"));
            }

            // Paginación
            return await query
                .Skip((pageNumber - 1) * pageSize)
                .Take(pageSize)
                .ToListAsync();

        }

        public async Task<Book> GetBookByIdAsync(int id)
        {
            return await _bookRepository.GetByIdAsync(id);
        }

        public async Task AddBookAsync(Book book)
        {
            if (book == null)
            {
                throw new ArgumentNullException(nameof(book));
            }

            await _bookRepository.AddAsync(book);
        }

        public async Task UpdateBookAsync(Book book)
        {
            if (book == null)
            {
                throw new ArgumentNullException(nameof(book));
            }

            await _bookRepository.UpdateAsync(book);
        }

        public async Task DeleteBookAsync(int id)
        {
            await _bookRepository.DeleteAsync(id);
        }
    }
}
