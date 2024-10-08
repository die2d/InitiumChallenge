﻿using Initium.WebApi.ChallengeDP.DTOs;
using Initium.WebApi.ChallengeDP.Models;

namespace Initium.WebApi.ChallengeDP.Interfaces
{
    public interface IUserService
    {
        Task<User?> GetUserByIdAsync(int id);
        Task<bool> AddBookToUserAsync(int userId, int bookId);
        Task<IEnumerable<BookDTO>> GetUserBooksAsync(int userId, string? genre, int pageNumber, int pageSize);
    }
}
