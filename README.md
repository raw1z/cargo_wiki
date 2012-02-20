= CargoWiki

cargo_wiki allows you to install a wiki in a Rails 3 application.

== Installation

Add the following line to you gem file:

~~~ruby
gem 'cargo_wiki'
~~~

The run:

~~~bash
bundle install
~~~

You also need to update your database:

~~~bash
rails generate cargo_wiki:install
rake db:migrate
~~~

Finally mount the engine in routes.rb:

~~~ruby
mount CargoWiki::Engine => "/wiki"
~~~

You are free to mount the wiki to whatever url you want.
