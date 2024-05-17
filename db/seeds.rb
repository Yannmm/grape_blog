# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# curl -X POST -d '{"post": {"email": "railssuperhero@email.com", "password": "password"}}'  "localhost:3000/api/login"

user_1 = User.create email: 'railssuperhero@email.com', password: 'password', password_confirmation: 'password'
user_2 = User.create email: 'railshero@email.com', password: 'password', password_confirmation: 'password'
user_3 = User.create email: 'railsrookie@email.com', password: 'password', password_confirmation: 'password'
APIKey.create token: '12345654321'

project_1 = Project.create name: 'Time Sheets'
project_2 = Project.create name: 'Toptal Blog'
project_3 = Project.create name: 'Hobby Project'

session_1 = PairProgrammingSession.create project: project_1, host_user: user_1, visitor_user: user_2
session_2 = PairProgrammingSession.create project: project_2, host_user: user_1, visitor_user: user_3
session_3 = PairProgrammingSession.create project: project_3, host_user: user_2, visitor_user: user_3

review_1 = session_1.reviews.create user: user_1, comment: 'Please DRY a bit your code'
review_2 = session_1.reviews.create user: user_1, comment: 'Please DRY a bit your specs'

review_3 = session_2.reviews.create user: user_1, comment: 'Please DRY your view templates'
review_4 = session_2.reviews.create user: user_1, comment: 'Please clean your N+1 queries'

review_1.code_samples.create code: 'Lorem Ipsum'
review_1.code_samples.create code: 'Do not abuse the single responsibility principle'

review_2.code_samples.create code: 'Use some shared examples'
review_2.code_samples.create code: 'Use at the beginning of specs'