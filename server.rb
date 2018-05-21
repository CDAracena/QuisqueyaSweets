require 'sinatra'
require 'sendgrid-ruby'


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

# post('/') do
#   # include SendGrid
#
#   from = Email.new(email: 'test@example.com')
#   to = Email.new(email: 'test@example.com')
#   subject = 'Sending with SendGrid is Fun'
#   content = Content.new(type: 'text/plain', value: 'and easy to do anywhere, even with Ruby')
#   mail = Mail.new(from, subject, to, content)
#
#   sg = SendGrid::API.new(api_key: ENV['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
# '])
#   response = sg.client.mail._('send').post(request_body: mail.to_json)
#   puts response.status_code
#   puts response.body
#   puts response.parsed_body
#   puts response.headers
#
#   redirect '/'
#   erb(:layout)
# end

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
