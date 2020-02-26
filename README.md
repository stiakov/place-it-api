# PLACE IT - Rails API

This API is intended to publish Movies and its showtime projections
 and make reservations
 
 ## Setup
 
 - Clone your repo in your machine:
 
 `git clone https://github.com/stiakov/place-it-api.git`
 
 - On the project's root directory run:
 
 `bundle i`
 
 - Create DB, run migrations and seeds
 
 ```
 rails db:create
 rails db:migrate
 rails db:seed
 ```
 
 - Run the server
 
 `rails server`
 
## Available endpoints
 
Example: localhost:3000/path

```
GET /movies
POST /movies
GET /movies/1
UPDATE /movies/1
DELETE /movies/1

GET /users
POST /users
GET /users/1
UPDATE /users/1
DELETE /users/1

GET /reservations
POST /reservations
GET /reservations/1
UPDATE /reservations/1
DELETE /reservations/1

GET /projections
POST /projections
GET /projections/1
UPDATE /projections/1
DELETE /projections/1
```