# check_connection

## About

After several days without internet at my home, thanks to brazilian shitty internet providers I was very bored and made this script that verifies if the internet connection is up, and if it is sends me an email. 

Everytime I was outside at work or walking around the streets anxiety was consuming me to know if the network was back already. 

So I put this script to run every hour and I would already knew if the internet was back or not avoiding being sad every time I walk trough the door.

### How-to

First run
```
bundle install
```

Create a .env file fill those variables:

```ruby
MAIL_USERNAME='sender@email.com'
MAIL_PASSWORD='sender_password'
MAIL_LIST='receiver@email.com'
```

Optionally you can set `MAIL_LIST=` with `,` between emails like this:

```ruby
MAIL_LIST='receiver1@email.com,receiver2@email.com'
```

After that just create a Job on your computer running the following command:

```bash
ruby app.rb
```

If you're on windows just create a Task calling `run.bat` passing as argument the folder where the app.rb is:

```bash
run.bat C:\users\you_user\Documents\Git\check_connection
```
