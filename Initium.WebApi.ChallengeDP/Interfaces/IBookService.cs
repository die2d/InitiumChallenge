using Initium.WebApi.ChallengeDP.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Initium.WebApi.ChallengeDP.Interfaces
{
    public interface IBookService
    {
        Task<IEnumerable<Book>> GetBooksAsync(string? author, int? publishedYear, string? genre, int pageNumber, int pageSize);

    }
}
