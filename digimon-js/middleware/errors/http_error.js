HTTPError = class HTTPError extends Error {
  constructor(statusCode, message) {
    super(message);
    this.name = "HTTPError"
    this.statusCode = statusCode;

    if (Error.captureStackTrace) {
      Error.captureStackTrace(this, HTTPError);
    }
  }
}

module.exports = {
  HTTPError
}