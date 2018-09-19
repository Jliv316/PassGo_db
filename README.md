# geo-points-db
[![Waffle.io - Issues in progress](https://badge.waffle.io/gavin-love/geo-points-db.png?label=in%20progress&title=In%20Progress)](http://waffle.io/gavin-love/geo-points-db)

# Endpoints

## User Endpoints
### GET '/api/v1/users'
Returns all users along with all user companies

### GET '/api/v1/users/:id'
Returns a specific user along with associated companies and points

### POST '/api/v1/users'
#### body format: {user: {name: "ray", email: "ray@ray.com", token: "KbIFV2FF6lXS6LjZSoNeXZ5sLuu1"}}
Creates and returns a user


## Company Endpoints
### GET '/api/v1/companies'
Returns all companies

### GET '/api/v1/companies/:id'
Returns specific company with corresponding id... the id is the firebase provided token

### DELETE '/api/v1/companies/:id'
Deletes specific company identified by firebase provided token


## Location Endpoint
### POST '/api/v1/users/user_id/locations'
#### body format:  {location: {lat: 39.7514038, lng: -104.9975539}}
Checks user location against all city companies
If user is within 25 meters of a company, the company is added to user companies and a point is added
Returns user with all attributes and companies that a user has points at

