# Erebe

This server is an API server with ruby & rails and mongoid, used to build website.  
Will work with a client like [Nyxl](https://github.com/szorfein/Nyx) write with `ionic`.

## Install

You have to install rails 5 and mongodb v3.6.

    $ git clone https://github.com/szorfein/Erebe.git
    $ cd Erebe
    $ rails s

Server start at `http://localhost:3000`.

## API 



### Build from scratch

+ Rails

```
$ mkdir project && cd project/
$ rails new ./ --api -T --skip-active-record
$ echo "gem 'mongoid', '~> 6.1.0'" >> Gemfile
$ echo "gem 'rack-cors'" >> Gemfile
$ bundle install
```

+ Mongoid, use [x509 auth](https://szorfein.github.io/mongodb/secure-mongodb/)

```
$ rails g mongoid:config
```

And look `config/mongoid.yml`, it take 2 var from env, you can set in `.bashrc` or other shell:

+ `export SHAKEN_C="<path to mongo-client.pem"`
+ `export MONGO_CA="<path to mongo-ca.pem>"`

And generate database with rails:

    $ rails db:create
    $ rails generate scaffold book name:string
    $ rails db:migrate
    $ mkdir db
    $ vim db/seeds.rb

Create somes datas:

```
Book.create!([
  { name: 'Copying and Pasting from Stack Overflow' },
  { name: 'Trying Stuff Until it Works' }
])
```

And populate database with this.

    $ rails db:seed
    $ rails s

Look at `http://localhost:3000/book.json` must have our books.

### Links: 

[Rails & Angular 1](https://blogstephenarifin.wordpress.com/2017/01/09/angular-2-and-ruby-on-rails-on-heroku/) 
[Rails & Angular 2](https://www.codewithjason.com/getting-started-with-angular-and-rails/)  
[Mongoid](https://docs.mongodb.com/mongoid/master/tutorials/mongoid-installation/)  
[Mongo Sec](https://docs.mongodb.com/manual/administration/security-checklist/)  
[Rails](http://guides.rubyonrails.org/getting_started.html)  
