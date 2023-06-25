# Summer practice - API

---

Agilefreaks Webiste: [agilefreaks.com](https://agilefreaks.com)


## Setup

Step 1. Build docker image

> docker compose build api 

Step 2. Install dependencies

> docker compose run api bundle install

Step 3. Create development database

> docker compose run api rake db:create db:migrate db:seed db:sample_data

Step 4. Build dependencies

> docker compose build

Step 5. Generate routes

> docker compose run api rake routes:generate

NOTE: Generate routes after each definition of a new route.

### Sample data

To seed your database with sample data:

> docker compose run api rake db:sample_data

### Build docker image

For building the COP API docker image, use the following command from project root directory:

> docker compose build

### Updating gems

Update gems for the api,

> docker compose run api bundle install

Update gems for api docs, 

> docker compose run api sh -c "cd docs && bundle install"

NOTE : Run `docker compose run api bundle install`, after updating your Gemfile to update the gems within the docker context.

### Run

For running COP API, use the following command from project root directory:

> docker compose up

You should be able to see api docs and do requests on `http://localhost:4000`

## Specs

Step 1 Prepare test environment database

> docker compose run api rake db:test:prepare RACK_ENV='test'

### Run Guard

For continuously run tests while changing the code:

> docker compose run api bundle exec guard

### Run cucumber

> docker compose run api bundle exec cucumber
