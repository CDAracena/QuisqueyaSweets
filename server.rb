require 'sinatra'
require 'sendgrid-ruby'
require 'mailgun'


class Cookie
  attr_accessor :name, :price, :image
  def initialize(name, price, image)
    @name = name
    @price = price
    @image = image
  end
end

class Cake
  attr_accessor :name, :price, :image
  def initialize(name, price, image)
    @name = name
    @price = price
    @image = image
  end
end

class Muffin
  attr_accessor :name, :price, :image
  def initialize(name, price, image)
    @name = name
    @price = price
    @image = image
  end
end

get('/') do

  erb(:index)
end


post('/') do
  first_muffin = Muffin.new('Tres Leches', '$200', 'treslechesCC.jpeg')
  second_muffin = Muffin.new('Chocolate', '$900', 'chocolateCC.jpg')
  third_muffin = Muffin.new('Almond', '$1000', 'almondCC.jpg')

  first_cake = Cake.new('Tres Leches', '$500', 'tresleches1.jpg')
  second_cake = Cake.new('Fudge Brownie', '$800', 'fudgebrowniecake.JPG')
  third_cake = Cake.new('Red Velvet', '$300', 'redvelvetcake.jpg')

  first_cookie = Cookie.new('Supa Chocolate Chip', "$100", "chocolatechip1.jpg")
  second_cookie = Cookie.new('Raisin Cookie', "$170", "raisincookie.jpg")
  third_cookie = Cookie.new('Peanut Butter Cookie', "$240", "peanutbuttercookie.jpg")

  @catalog = [first_muffin, second_muffin, third_muffin, first_cake, second_cake, third_cake,
  first_cookie, second_cookie, third_cookie]

  mg_client = Mailgun::Client.new(ENV['MAIL_GUN_API_KEY'])

# Define your message parameters
message_params =  { from: 'crebelz174@gmail.com',
                  to:   params[:inputParams],
                  subject: 'Quisqueya Sweets Newsletter!',
                  html:    erb(:email_template, layout: false)
                }

# Send your message through the client
mg_client.send_message(ENV['MAIL_GUN_API_DOMAIN'], message_params)

  redirect '/'
end

get('/cookies') do
  first_cookie = Cookie.new('Supa Chocolate Chip', "$100", "chocolatechip1.jpg")
  second_cookie = Cookie.new('Raisin Cookie', "$170", "raisincookie.jpg")
  third_cookie = Cookie.new('Peanut Butter Cookie', "$240", "peanutbuttercookie.jpg")

  @cookies = [first_cookie, second_cookie, third_cookie]

  erb(:only_cookies)
end

get('/cakes') do
  first_cake = Cake.new('Tres Leches', '$500', 'tresleches1.jpg')
  second_cake = Cake.new('Fudge Brownie', '$800', 'fudgebrowniecake.JPG')
  third_cake = Cake.new('Red Velvet', '$300', 'redvelvetcake.jpg')

  @cakes = [first_cake, second_cake, third_cake]
  erb(:only_cakes)
end

get('/muffins') do

  first_muffin = Muffin.new('Tres Leches', '$200', 'treslechesCC.jpeg')
  second_muffin = Muffin.new('Chocolate', '$900', 'chocolateCC.jpg')
  third_muffin = Muffin.new('Almond', '$1000', 'almondCC.jpg')

  @muffins = [first_muffin, second_muffin, third_muffin]
  erb(:only_muffins)
end

get('/about') do
  erb(:about)
end

get('/email') do

  first_muffin = Muffin.new('Tres Leches', '$200', 'treslechesCC.jpeg')
  second_muffin = Muffin.new('Chocolate', '$900', 'chocolateCC.jpg')
  third_muffin = Muffin.new('Almond', '$1000', 'almondCC.jpg')

  first_cake = Cake.new('Tres Leches', '$500', 'tresleches1.jpg')
  second_cake = Cake.new('Fudge Brownie', '$800', 'fudgebrowniecake.JPG')
  third_cake = Cake.new('Red Velvet', '$300', 'redvelvetcake.jpg')

  first_cookie = Cookie.new('Supa Chocolate Chip', "$100", "chocolatechip1.jpg")
  second_cookie = Cookie.new('Raisin Cookie', "$170", "raisincookie.jpg")
  third_cookie = Cookie.new('Peanut Butter Cookie', "$240", "peanutbuttercookie.jpg")

  @catalog = [first_muffin, second_muffin, third_muffin, first_cake, second_cake, third_cake,
  first_cookie, second_cookie, third_cookie]

  erb(:email_template)
end
