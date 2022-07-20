using System;
using System.Net;
using System.Runtime.Serialization;

namespace Schulungstool.PJ.Controllers
{
    [Serializable]
    internal class HttpResponseException : Exception
    {
        private HttpStatusCode unsupportedMediaType;

        public HttpResponseException()
        {
        }

        public HttpResponseException(HttpStatusCode unsupportedMediaType)
        {
            this.unsupportedMediaType = unsupportedMediaType;
        }

        public HttpResponseException(string message) : base(message)
        {
        }

        public HttpResponseException(string message, Exception innerException) : base(message, innerException)
        {
        }

        protected HttpResponseException(SerializationInfo info, StreamingContext context) : base(info, context)
        {
        }
    }
}