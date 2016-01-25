require 'sinatra'
require_relative 'lib/tower_of_hanoi'

enable :sessions

get '/' do
    session[:error] = ""
  session[:tower] = TowerOfHanoi.new
  erb :game, :locals => {:tower => session[:tower], :error_msg => session[:error]}
  
end

post '/' do

  error = ""
  from = params[:from].to_i
  to = params[:to].to_i

  if session[:tower].valid_move(from, to)
    session[:tower].move(from, to)
  else
    error = "Illegal Move"
  end

  erb :game, :locals => {:tower => session[:tower], :error_msg => session[:error]}

end