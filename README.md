# alexa-rails-pusher

## Setup

### Pusher

// Coming soon.

### Alexa

// Coming soon.

### Rails

Before starting this, make sure you have the required Ruby version and Rails versions installed as specfied in the `Gemfile`.

 - 1. `$ bundle install` install required gems
 - 2. `$ cp application.yml.example application.yml`
 - 3. Replace the placeholder values in `application.yml` with your Pusher app keys.
 - 4. `$ mkdir -p shared/pids shared/sockets shared/log` - add dirs for Puma
 - 4. `$ cp database.yml.example database.yml`
 - 5. `$ rake db:create`

