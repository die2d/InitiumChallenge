using Initium.WebApi.ChallengeDP.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace Initium.WebApi.ChallengeDP.Controllers
{
    [Route("api/[controller]")]
    [Authorize]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly IUserService _userService;

        public UsersController(IUserService userService)
        {
            _userService = userService;
        }

        // POST: api/users/{id}/books
        [HttpPost("{bookId}/books")]
        public async Task<IActionResult> AddBookToUser(int bookId)
        {
            // Extraer el userId del token JWT
            var userIdClaim = User.FindFirst(ClaimTypes.NameIdentifier);
            if (userIdClaim == null)
            {
                return Unauthorized("No user ID found in token.");
            }

            if (!int.TryParse(userIdClaim.Value, out int userId))
            {
                return BadRequest("Invalid user ID in token.");
            }

            var result = await _userService.AddBookToUserAsync(userId, bookId);
            if (result)
                return Ok(new { Message = "Book added successfully." });

            return BadRequest(new { Message = "Unable to add book to user." });
        }

        // GET: api/users/me/books
        [HttpGet("me/books")]
        [Authorize]
        public async Task<IActionResult> GetUserBooks([FromQuery] string? genre, [FromQuery] int pageNumber = 1, [FromQuery] int pageSize = 10)
        {
            var userIdClaim = User.FindFirst(ClaimTypes.NameIdentifier);
            if (userIdClaim == null)
            {
                return Unauthorized("No user ID found in token.");
            }

            if (!int.TryParse(userIdClaim.Value, out int userId))
            {
                return BadRequest("Invalid user ID in token.");
            }

            var books = await _userService.GetUserBooksAsync(userId, genre, pageNumber, pageSize);

            if (books.Any())
                return Ok(books);

            return NotFound(new { Message = "No books found for the user." });
        }
    }
}
