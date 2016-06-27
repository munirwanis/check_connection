require 'gmail'
require 'open-uri'
require 'dotenv'

Dotenv.load
@mail_user = ENV['MAIL_USERNAME']
@mail_pass = ENV['MAIL_PASSWORD']
@mail_list = ENV['MAIL_LIST'].split(',')
def is_connected?
    begin
        true if open("http://www.google.com/")
    rescue
        false
    end
end

def send_email
   Gmail.connect(@mail_user, @mail_pass) do |gmail|
       gmail.deliver do 
           to @mail_list
           from "Internet King <#{@mail_user}>"
           subject 'Is Tim Alive?'
           text_part do
               body 'Live TIM is alive!'
           end
           html_part do
               content_type 'text/html; charset=UTF-8'
               body "<h1>It's ALIVE!!!</h1>"
           end
       end
    end
end

def already_connected?
    File.read('is_alive.txt') == 'true'
end

def conneted
    File.open('is_alive.txt', 'w') { |f| f.write('true') }
end

def not_connected
    File.open('is_alive.txt', 'w') { |f| f.write('false') }
end

def main
    if is_connected? && already_connected? == false
        send_email
        conneted
    else
        not_connected if is_connected? == false
    end
end

puts @mail_user
puts @mail_pass
puts @mail_list

main