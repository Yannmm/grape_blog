# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


curl -X POST localhost:3000/api/login \
  -H "Content-Type: application/json" \
  -d '{"email": "railssuperhero@email.com", "password": "password"}'



curl -X POST localhost:3000/api/pair_programming_sessions \
  -H "Content-Type: application/json" \
  -H "Authorization: 12345654321" \
  -d '{"email": "railssuperhero@email.com", "token": "tttt999"}'
  

  curl -X GET "localhost:3000/api/pair_programming_sessions?email=railssuperhero@email.com&token=tttt999" \
  -H "Authorization: 12345654321"
