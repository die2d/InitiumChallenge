using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Initium.WebApi.ChallengeDP.Custom;
using Initium.WebApi.ChallengeDP.Models;
using Initium.WebApi.ChallengeDP.Models.DTOs;
using Microsoft.AspNetCore.Authorization;
using Initium.WebApi.ChallengeDP.Interfaces;

namespace Initium.WebApi.ChallengeDP.Controllers
{
    [Route("api/[controller]")]
    [Authorize]
    [ApiController]
    public class BooksController : ControllerBase
    {
        private readonly IBookService _bookService;

        public BooksController(IBookService bookService)
        {
            _bookService = bookService;
        }

        // GET: api/books
        [HttpGet]
        public async Task<IActionResult> GetBooks([FromQuery] string? author, [FromQuery] int? publishedYear, [FromQuery] string? genre, [FromQuery] int pageNumber = 1, [FromQuery] int pageSize = 10)
        {

            var books = await _bookService.GetBooksAsync(author, publishedYear, genre, pageNumber, pageSize);
            if (!books.Any())
                return NotFound(new { Message = "No books found." });

            return Ok(books);

        }


    }
}

