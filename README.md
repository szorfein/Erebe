### Shaken-web

This project has been generate with command:

    $ mkdir project && cd project/
    $ rails new ./ --skip-active-record
    $ npm install -g angular-cli
    $ ng new client
    $ cd client
    $ ng build --prod
    $ cd ..
    $ rm -rf public
    $ ln -s client/dist public

Launch rails:

    $ rails s

And go to http://localhost:3000.

### Links: 

[Rails & Angular](https://blogstephenarifin.wordpress.com/2017/01/09/angular-2-and-ruby-on-rails-on-heroku/)  
[Mongoid](https://docs.mongodb.com/mongoid/master/tutorials/mongoid-installation/)  
[Mongo Sec](https://docs.mongodb.com/manual/administration/security-checklist/)  
[Rails](http://guides.rubyonrails.org/getting_started.html)  
