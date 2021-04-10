#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>!!!"			
end

get '/about' do
	erb :about
end

get '/visit' do
	erb :visit
end

post '/visit' do
	@barbers	= params[:barbers]
	@user_name	= params[:user_name]
	@phone		= params[:phone]	
	@time_visit	= params[:time_visit]
	@color		= params[:color]
	f = File.open "./public/user.txt", "a"
	f.write "Barber: #{@barbers}\nName: #{@user_name}. Number phone: #{@phone}.Date and time visit #{@time_visit} color hair #{@color}\n"
	f.close
	erb "Здравствуйте #{@user_name}! Вы записаны к #{@barbers} на #{@time_visit} Выбранный Вами цвет окраски: #{@color}"
end

get '/contacts' do
	erb :contacts
end

post '/contacts' do
	@email 			= params[:email]
	@text_message 	= params[:text_message]
	m = File.open "./public/contacts.txt", "a"
	m.write "Email: #{@email}\n. Message: #{@text_message}\n"
	m.close
end
