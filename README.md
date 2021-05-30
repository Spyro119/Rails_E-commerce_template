# WebServer Template

This is a ruby on Rails e-Commerce Template to get started faster.
This website currently only supports one language at a time, and uses IL8N for translations. Only english and french is available at the moment, but feel free to contribute by adding translations files in locales/#{lang_local}.yml

Not that changing local will only change Rails exception messages, Models, and Devise flash messages at the moment. 

You can change language of the site in config/application.rb by changing the locale value: 

```ruby
I18n.default_locale = :en # :fr is available at the moment
```

## Getting Started

Simply install the dependencies at root of App
```bash 
bundle
```

For a quick Set-up, simply rename config/local_env_template.yml to config/local_env_template.yml and set your Credentials.

```bash
sudo mv config/local_env_template.yml config/_local_env.yml
```

```yml
WEB_APP_NAME: "Your Website name"

# DB settings
DB_NAME: "Your DB name" #used for developpement
DB_USER_NAME: "Your DB User Name"
DB_PASSWORD: "Your DB user password"
DB_HOSTNAME: "Your DB HOSTNAME"
DB_PRODUCTION_NAME: "Your DB for production name"

# TrueMail settings

TRUE_MAIL_VERIFIER: 'Your E-mail' # Can use your own personnal e-mail, but is recommended to use the same mailer as the one used for this website if setup.
VERIFIER_DOMAIN: "Your E-Mail verifier Domain" #Ex: gmail.com
```

Truemail gem is used to verify that e-mails domain exist upon sign-in. Feel free to change settings in initialisers/Truemail.rb and whitelist/blacklist domains if needed.

And run the web application and go to localhost:3000/ 
```bash 
rails s
```

### Prerequisites

```
- ruby 2.7 ~> 5.0
- Rails
- Redis
```

## Deployment

<!-- Add additional notes about how to deploy this on a live system -->
Change the module name in config.application.rb to your WebSite domain. 

```ruby
module "#{Your web_app_name}" #by default, module's name is Template
```
Change your hostname for your website domain in config/production.rb

```ruby 
host = "Your website Domain"
```
By default, since this is an E-commerce template, it uses SSL. Before deploying, make sure you either have an SSL certificate and set your configurations to use HTTPS OR set SSL configs to off in config/environnements/production.rb (Altough, not recommended).

Feel free to change environnement in config/puma.rb if needed. 
```ruby
environment ENV.fetch("RAILS_ENV") { "production" }
 ```

## Built With

```
Ruby 2.7.1
Rails 6.0.3.4
Javascript
jQuery
HTML5
Css/Bootstrap
Redis
```

## Contributing

Open an issue, fork this repo, create a branch and commit your changes and open a pull request. Code will be reviewed before merge.

## Authors

* **Samuel Jubinville-Baril** - *Spyro119* - [gitlab/github link]()

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE) file for details


### Note
This repo is far from being finished. 
