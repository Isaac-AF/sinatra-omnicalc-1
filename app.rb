require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end

get("/square/new") do
  erb(:new_square_calc)
end

get ("/square/results") do
  @the_num = params.fetch("users_number").to_f

  @the_result = @the_num ** 2
  erb(:square_results)
end

get("/square_root/new") do
  erb(:square_root_calc)
end

get ("/square_root/results") do
  @the_num = params.fetch("users_number").to_f

  @the_result = @the_num ** 0.5
  erb(:square_root_results)
end

get("/random/new") do
  erb(:random_calc)
end

get ("/random/results") do
  @min = params.fetch("user_minimum").to_f
  @max = params.fetch("user_maximum").to_f

  @the_result = rand(@min..@max)
  erb(:random_results)
end

get("/payment/new") do
  erb(:payment_calc)
end

get ("/payment/results") do
  @APR = params.fetch("user_APR").to_f
  @years = params.fetch("user_years").to_i
  @principal = params.fetch("user_principal").to_f

  @numerator = (@APR/100/12) * @principal
  @denominator = 1 - ((1+(@APR/100/12)) ** (-1 * @years * 12))

  @the_result = (@numerator/@denominator).to_f
  erb(:payment_results)
end
