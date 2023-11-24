
using System;
using System.Net;
using System.Net.Http;
using System.Web.Http;

public class AccountController : ApiController
{
    [HttpPost]
    public IHttpActionResult CreateAccount(AccountModel account)
    {
        // Validate account data
        if (!ModelState.IsValid)
        {
            return BadRequest(ModelState);
        }

        // Create account logic
        try
        {
            var accountCreated = false;
            //create a for loop to loop through 100 records
            for (int i = 0; i < 100; i++)
            {
                //create a new account
                var newAccount = new AccountModel
                {
                    Username = account.Username,
                    Password = account.Password
                };
            }

            // Return success response
            return Ok("Account created successfully");
        }
        catch (Exception ex)
        {
            // Log error and return error response
            // TODO: Implement error logging here

            return InternalServerError(ex);
        }
    }
}

public class AccountModel
{
    public string Username { get; set; }
    public string Password { get; set; }
    // Add more properties as needed
}
