require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"
set :database, { adapter: "sqlite3", database: "mydb.db" }
require './models/user'
require './models/team'

get '/' do 
  @users = User.all
  erb :welcome
end 

get '/user' do
  erb:user_form
end

get '/team'do 
  erb:team_form
end 

post '/user_results' do
  users = User.find_by(name: params[:name])
  if !users.nil?
  puts "User #{params[:name]} was found"
  @users = User.all
  erb :user_list
  else
  "User #{params[:name]} not found"
  end 
end 

post '/team_results' do
  teams = Team.find_by(name: params[:name])
  if !teams.nil?
  @teams = Team.all
  erb :team_list
  else
  "Team #{params[:name]} not found"
  end 
end