# Rails::Froutes

This gem fills route name displayed by `rake routes` task.

## Overview

```ruby
# config/routes.rb
RailsApp::Application.routes.draw do
  resources :blogs do
    resources :posts
  end
end
```

Default outputs (by `rake routes`)

```
    blog_posts GET    /blogs/:blog_id/posts(.:format)          posts#index
               POST   /blogs/:blog_id/posts(.:format)          posts#create
 new_blog_post GET    /blogs/:blog_id/posts/new(.:format)      posts#new
edit_blog_post GET    /blogs/:blog_id/posts/:id/edit(.:format) posts#edit
     blog_post GET    /blogs/:blog_id/posts/:id(.:format)      posts#show
               PUT    /blogs/:blog_id/posts/:id(.:format)      posts#update
               DELETE /blogs/:blog_id/posts/:id(.:format)      posts#destroy
         blogs GET    /blogs(.:format)                         blogs#index
               POST   /blogs(.:format)                         blogs#create
      new_blog GET    /blogs/new(.:format)                     blogs#new
     edit_blog GET    /blogs/:id/edit(.:format)                blogs#edit
          blog GET    /blogs/:id(.:format)                     blogs#show
               PUT    /blogs/:id(.:format)                     blogs#update
               DELETE /blogs/:id(.:format)                     blogs#destroy
```

Using `rails-froutes` with `FILL_NAME`.

```
    blog_posts GET    /blogs/:blog_id/posts(.:format)          posts#index
    blog_posts POST   /blogs/:blog_id/posts(.:format)          posts#create
 new_blog_post GET    /blogs/:blog_id/posts/new(.:format)      posts#new
edit_blog_post GET    /blogs/:blog_id/posts/:id/edit(.:format) posts#edit
     blog_post GET    /blogs/:blog_id/posts/:id(.:format)      posts#show
     blog_post PUT    /blogs/:blog_id/posts/:id(.:format)      posts#update
     blog_post DELETE /blogs/:blog_id/posts/:id(.:format)      posts#destroy
         blogs GET    /blogs(.:format)                         blogs#index
         blogs POST   /blogs(.:format)                         blogs#create
      new_blog GET    /blogs/new(.:format)                     blogs#new
     edit_blog GET    /blogs/:id/edit(.:format)                blogs#edit
          blog GET    /blogs/:id(.:format)                     blogs#show
          blog PUT    /blogs/:id(.:format)                     blogs#update
          blog DELETE /blogs/:id(.:format)                     blogs#destroy
```

## Installation

Add this line to your application's Gemfile:

    gem 'rails-froutes'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails-froutes

## Usage

1. Install `rails-froutes` (See **Installation** section)
1. Run `rake routes FILL_NAME=yes`

## Contributing

1. Fork it ( https://github.com/pinzolo/rails-froutes/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
