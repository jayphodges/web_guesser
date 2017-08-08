require 'sinatra'
require 'sinatra/reloader'


set :number, rand(0..100)

get '/' do
  guess = params["guess"].to_i
  message = number_guesser(guess)
  background = background(message)
  erb :index, :locals => {:number => settings.number,
                          :message => message,
                          :background => background}
end

def number_guesser(guess)
  if guess > (settings.number + 5)
    "Way too high!"
  elsif guess < (settings.number - 5)
    "Way too low!"
  elsif guess > settings.number
    "Too high!"
  elsif guess < settings.number
    "Too low!"
  else
    "You got it right! You guessed the secret number #{settings.number}"
  end
end

def background(message)
  if message == "Way too High!" || message == "Way too low!"
    "red"
  elsif message == "Too high!" || message == "Too low!"
    "#FFF4F3"
  elsif message == "You got it right! You guessed the secret number #{settings.number}"
    "#0FAD00"
  else
    "white"
  end
end
