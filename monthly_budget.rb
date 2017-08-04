# A monthly budget application that tracks bills, categories or expenses,
# and provides totals by month or year.

require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"


get "/" do
  @expenses = 1000
  @income = 2000
  erb :home
end
