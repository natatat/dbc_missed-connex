# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'httparty'
require 'json'

response = HTTParty.get('https://api.devbootcamp.com/v1/users.json', { headers: {'Authorization' => 'DBC-API 40628129ce1ed5c90440f54ba23810f8'} })

users = {}
users[:name] = []
users[:email] = []

response["users"].each do |user|
  users[:email] << user["email"]
end

response["users"].each do |user|
  users[:name] << user["name"]
end

# create user object - name and email, save to db
