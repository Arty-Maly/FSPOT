# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Heroku shit I got from this site:
# configure :development do
#   set :database, "sqlite3:///db/development.sqlite3"
# end

# configure :production do
#   db = URI.parse(ENV['HEROKU_POSTGRESQL_BROWN'] || 'postgres://localhost/mydb')

#   ActiveRecord::Base.establish_connection(
#     :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
#     :host     => db.host,
#     :username => db.user,
#     :password => db.password,
#     :database => db.path[1..-1],
#     :encoding => 'utf8'
#   )
# end

# Initialize the Rails application.
Mvp::Application.initialize!
