# technicalTest
Technical Test for Showoff
This rails application wraps API expossed by Showoff and allows users to manage and view widgets.

## Architecture
As this application wraps existing API, it does not need a database connection. Accessed API through a standard OAuth2 process. rest-client gem has been used to call existing API. bootstrap 4.0 gem used for some ui compenents.

## Development
1. Requires Ruby 2.2.0 or above 
2. clone this repository in your local directory
2. goto respository and run 'bundle install' command
3. then run 'rails s'
4. access 'http://localhost:3000/' url in browser
