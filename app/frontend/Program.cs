using System;
using System.Net;
using System.Web.Http;

namespace HelloWorld
{
    public class HelloWorldController : ApiController
    {
        [HttpGet]
        public string Get()
        {
            return "Hello, World!";
        }
    }
}
