# A monthly budget application that tracks bills, categories or expenses,
# and provides totals by month or year.

require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

configure do
  enable :sessions
  set :session_secret, 'secret'
  set :erb, :escape_html => true
end

helpers do
  def total_expenses(expenses)
    expenses.values.reduce(:+)
  end
  def budget_calculator(income, expenses)
    income - total_expenses(expenses)
  end
end

before do
  session[:expenses] ||= {rent: 1700, food: 600}
  session[:income] ||= 3000

end

get "/" do
  @expenses = session[:expenses]
  @income = session[:income]
  puts "hola"
  erb :home
end

get "/expenses/new" do
  erb :add_expense
end

post "/expenses" do
  @expense_name = params[:name].to_sym
  @cost = params[:cost].to_i
  session[:expenses][@expense_name] = @cost
  session[:message] = "New expense added"
  redirect "/"
end
