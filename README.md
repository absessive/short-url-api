# README

Sample Rails API for a URL shortener.

## Pre-requirements

Install heroku tools using `brew install heroku`

## Steps to run

### Locally

    cd short-url-api
    heroku local -f Procfile.dev

Short URL's are of form `localhost:3000/go/to/abcd1234`.

## Shortening Strategy.

### Random number generator

From a possible set 62 characters, a short URL identifier of 8 characters is generated. This should account for 62 ^ 8 combinations or 218,340,105,584,896 or rought over 200 Trillion possible values. I chose this strategy for ease of implementation.

### Others

#### Use a one directional hashing functiion

Could use a MD5 hash representation of the original URL.

#### Use some kind of encryption algorithm

Most likely AES or something similar, the issue would be the encrypted scripts would be long. An alternative cryptographic cipher like `bcrypt` would be a better solution, and using a salt would ensure uniqueness.

#### Use an external counter

External service that auto-increments whenver a new DB entry is created. Base62 encode the counter value to create a ShortURL.

## TODOs/Improvements

1. Add unit tests for API endpoints and models.
2. Better UI styling.
