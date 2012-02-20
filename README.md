# CargoWiki

cargo_wiki allows you to install a wiki in a Rails 3 application.

## Installation

Add cargo_wiki to your Gemfile:

~~~ruby
gem 'cargo_wiki'
~~~

cargo_wiki uses compass, and you must add compass support in the assets group of your Gemfile:

~~~ruby
group :assets do
  gem 'compass-rails'
end
~~~

Then run:

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
