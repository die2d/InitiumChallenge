using Microsoft.Extensions.Logging;
using Initium.WebApi.ChallengeDP.Interfaces;
using Initium.WebApi.ChallengeDP.Models;
using Initium.WebApi.ChallengeDP.DTOs;

using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Initium.WebApi.ChallengeDP.Custom;
using Microsoft.Extensions.Options;
namespace Initium.WebApi.ChallengeDP.Services
{
    public class UserService : IUserService
    {
        private readonly IRepository<User> _userRepository;
        private readonly IRepository<Book> _bookRepository;
        private readonly ILogger<UserService> _logger;
        private readonly LibrarySettings _librarySettings;

        public UserService(IRepository<User> userRepository, IRepository<Book> bookRepository, ILogger<UserService> logger, IOptions<LibrarySettings> librarySettings)
        {
            _userRepository = userRepository;
            _bookRepository = bookRepository;
            _logger = logger;
            _librarySettings = librarySettings.Value;

        }

        public async Task<User?> GetUserByIdAsync(int id)
        {
            return await _userRepository.GetByIdAsync(id);
        }

        public async Task<bool> AddBookToUserAsync(int userId, int bookId)
        {
            var user = await _userRepository.GetByIdAsync(userId, u => u.Books);
            if (user == null)
            {
                _logger.LogWarning("User with ID: {Id} not found", userId);
                return false;
            }



            if (user.Books.Count >= _librarySettings.MaxBooksPerUser)
            {
                _logger.LogWarning($"User with ID: {userId} has reached the maximum book limit {_librarySettings.MaxBooksPerUser}");
                return false;
            }

            if (user.Books.Any(b => b.Id == bookId))
            {
                _logger.LogWarning("User with ID: {Id} already has book with ID: {BookId}", userId, bookId);
                return false;
            }

            var book = await _bookRepository.GetByIdAsync(bookId);
            if (book == null)
            {
                _logger.LogWarning("Book with ID: {Id} not found", bookId);
                return false;
            }

            user.Books.Add(book);
            await _userRepository.UpdateAsync(user);

            _logger.LogInformation("Book with ID: {BookId} added to user with ID: {UserId}", bookId, userId);
            return true;
        }

        public async Task<IEnumerable<BookDTO>> GetUserBooksAsync(int userId, string? genre, int pageNumber, int pageSize)
        {
            var user = await _userRepository.GetByIdAsync(userId, u => u.Books);
            if (user == null)
            {
                _logger.LogWarning("User with ID: {Id} not found", userId);
                return new List<BookDTO>();
            }

            var books = user.Books.AsQueryable();

            if (!string.IsNullOrEmpty(genre))
                books = books.Where(b => b.Genre.Contains(genre));


            var paginatedBooks = books
                .Skip((pageNumber - 1) * pageSize)
                .Take(pageSize)
                .Select(b => new BookDTO
                {
                    Id = b.Id,
                    Title = b.Title,
                    Author = b.Author,
                    PublishedYear = b.PublishedYear,
                    Genre = b.Genre
                })
                .ToList();

            return paginatedBooks;
        }
    }
}
