require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  "Hello!"
end

get '/hello_world' do
  "Hello World!"
end

get '/hello_me' do
  @me = "Chris"
  return "Hello, #{@me}"
end

get '/hello_you/:name' do
  @name = params[:name]
  return "Hello, #{@name}"
end

#localhost:4567/names/chris/wright
get '/names/:first/:second' do
  @first = params[:first]
  @second = params[:second]
 return "You can do multiple parameters, #{@first.upcase} #{@second.upcase}!"
end

get '/calc/add/:first/:second' do
  params[:first] + params[:second]
  @first = params[:first].to_i
  @second = params[:second].to_i

  return(@first + @second).to_s
end

get '/calc/multiply/:first/:second' do
  @first = params[:first].to_i
  @second = params[:second].to_i
  return(@first * @second).to_s
end

get '/calc/subtract/:first/:second' do
  @first = params[:first].to_i
  @second = params[:second].to_i
  return(@first - @second).to_s
end

get '/calc/divide/:first/:second' do
  @first = params[:first].to_i
  @second = params[:second].to_i
  return(@first / @second).to_s
end


get '/oh_hai/:name' do
  @name = params[:name]
  @answer_to_the_universe = params[42]
  erb(:hai)
  end

get '/calc/:first/:operation/:second' do
  @first = params[:first].to_f
  @operation = params[:operation]
  @second = params[:second].to_f
  @result = case @operation
      when "sum" then @first + @second
      when "difference" then @first - @second
      when "product" then @first * @second
      when "divide" then @first / @second
    end
    erb :calc
  end

get '/calc' do
  @first = params[:first].to_f
  @operation = params[:operation]
  @second = params[:second].to_f
  @result = case @operation
      when "sum" then @first + @second
      when "difference" then @first - @second
      when "product" then @first * @second
      when "divide" then @first / @second
    end
    erb :calc
  end
