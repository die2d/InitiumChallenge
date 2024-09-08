using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Initium.WebApi.ChallengeDP.Custom;
using Initium.WebApi.ChallengeDP.Models;
using Initium.WebApi.ChallengeDP.Models.DTOs;
using Microsoft.AspNetCore.Authorization;

namespace Initium.WebApi.ChallengeDP.Controllers
{
    [Route("api/[controller]")]
    [AllowAnonymous]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly LibraryManagementDBContext _LibraryManagementDbContext;
        private readonly Utilities _utilities;
        public AuthController(LibraryManagementDBContext libraryManagementDbContext, Utilities utilities)
        {
            _LibraryManagementDbContext = libraryManagementDbContext;
            _utilities = utilities;
        }

        [HttpPost]
        [Route("Register")]
        public async Task<IActionResult> Register(UserDTO userDTO)
        {

            var User = new User
            {
                Username = userDTO.Username,
                Password = _utilities.EncryptSHA256(userDTO.Password),
                FullName = userDTO.FullName,
                Email = userDTO.Email,
            };

            await _LibraryManagementDbContext.Users.AddAsync(User);
            await _LibraryManagementDbContext.SaveChangesAsync();

            if (User.Id != 0)
                return StatusCode(StatusCodes.Status200OK, new { isSuccess = true });
            else
                return StatusCode(StatusCodes.Status200OK, new { isSuccess = false });
        }

        [HttpPost]
        [Route("Login")]
        public async Task<IActionResult> Login(LoginDTO login)
        {
            var pass = _utilities.EncryptSHA256(login.Password);

                var user = await _LibraryManagementDbContext.Users
                    .Where(u => u.Username == login.Username && u.Password == pass)
                    .FirstOrDefaultAsync();

                if (user == null)
                    return StatusCode(StatusCodes.Status200OK, new { isSuccess = false, token = "" });
                else
                    return StatusCode(StatusCodes.Status200OK, new { isSuccess = true, token = _utilities.GenerateJWT(user) });


            
        }
    }
}
