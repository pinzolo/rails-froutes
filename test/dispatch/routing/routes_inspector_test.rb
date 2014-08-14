require 'test_helper'

if Rails::VERSION::MAJOR == 4
  module ActionDispatch
    module Routing
      class RoutesInspectorTest < ActiveSupport::TestCase
        def setup
          @set = ActionDispatch::Routing::RouteSet.new
          app = ActiveSupport::OrderedOptions.new
          app.config = ActiveSupport::OrderedOptions.new
          app.config.assets = ActiveSupport::OrderedOptions.new
          app.config.assets.prefix = '/sprockets'
          Rails.stubs(:application).returns(app)
          Rails.stubs(:env).returns('development')
        end

        def draw(options = {}, &block)
          @set.draw(&block)
          inspector = ActionDispatch::Routing::RoutesInspector.new(@set.routes)
          inspector.format(ActionDispatch::Routing::ConsoleFormatter.new, options[:filter]).split("\n")
        end

        def test_default_output_without_froutes
          output = draw do
            resources :articles
          end

          assert_equal [
            '      Prefix Verb   URI Pattern                  Controller#Action',
            '    articles GET    /articles(.:format)          articles#index',
            '             POST   /articles(.:format)          articles#create',
            ' new_article GET    /articles/new(.:format)      articles#new',
            'edit_article GET    /articles/:id/edit(.:format) articles#edit',
            '     article GET    /articles/:id(.:format)      articles#show',
            '             PATCH  /articles/:id(.:format)      articles#update',
            '             PUT    /articles/:id(.:format)      articles#update',
            '             DELETE /articles/:id(.:format)      articles#destroy'
          ], output
        end

        def test_output_filled_name_with_froutes
          ENV['FILL_NAME'] = 'yes'

          output = draw do
            resources :articles
          end

          assert_output(output)
        end

        def test_output_filled_name_with_froutes_and_lower_fill_name_option
          ENV['fill_name'] = 'yes'

          output = draw do
            resources :articles
          end

          assert_output(output)
        end

        def test_output_filled_name_with_froutes_and_upper_fill_name_option_value
          ENV['FILL_NAME'] = 'YES'

          output = draw do
            resources :articles
          end
          assert_output(output)
        end

        def test_output_filled_name_with_froutes_and_fill_name_option_value_is_true
          ENV['FILL_NAME'] = 'true'

          output = draw do
            resources :articles
          end
          assert_output(output)
        end

        def test_output_filled_name_with_froutes_and_fill_name_option_value_is_y
          ENV['FILL_NAME'] = 'y'

          output = draw do
            resources :articles
          end
          assert_output(output)
        end

        def test_output_filled_name_with_froutes_on_nested_routes
          ENV['FILL_NAME'] = 'yes'

          output = draw do
            resources :blogs do
              resources :posts
            end
          end

          assert_equal [
            '        Prefix Verb   URI Pattern                              Controller#Action',
            '    blog_posts GET    /blogs/:blog_id/posts(.:format)          posts#index',
            '    blog_posts POST   /blogs/:blog_id/posts(.:format)          posts#create',
            ' new_blog_post GET    /blogs/:blog_id/posts/new(.:format)      posts#new',
            'edit_blog_post GET    /blogs/:blog_id/posts/:id/edit(.:format) posts#edit',
            '     blog_post GET    /blogs/:blog_id/posts/:id(.:format)      posts#show',
            '     blog_post PATCH  /blogs/:blog_id/posts/:id(.:format)      posts#update',
            '     blog_post PUT    /blogs/:blog_id/posts/:id(.:format)      posts#update',
            '     blog_post DELETE /blogs/:blog_id/posts/:id(.:format)      posts#destroy',
            '         blogs GET    /blogs(.:format)                         blogs#index',
            '         blogs POST   /blogs(.:format)                         blogs#create',
            '      new_blog GET    /blogs/new(.:format)                     blogs#new',
            '     edit_blog GET    /blogs/:id/edit(.:format)                blogs#edit',
            '          blog GET    /blogs/:id(.:format)                     blogs#show',
            '          blog PATCH  /blogs/:id(.:format)                     blogs#update',
            '          blog PUT    /blogs/:id(.:format)                     blogs#update',
            '          blog DELETE /blogs/:id(.:format)                     blogs#destroy'
          ], output
        end

        private

        def assert_output(output)
          assert_equal [
            '      Prefix Verb   URI Pattern                  Controller#Action',
            '    articles GET    /articles(.:format)          articles#index',
            '    articles POST   /articles(.:format)          articles#create',
            ' new_article GET    /articles/new(.:format)      articles#new',
            'edit_article GET    /articles/:id/edit(.:format) articles#edit',
            '     article GET    /articles/:id(.:format)      articles#show',
            '     article PATCH  /articles/:id(.:format)      articles#update',
            '     article PUT    /articles/:id(.:format)      articles#update',
            '     article DELETE /articles/:id(.:format)      articles#destroy'
          ], output
        end
      end
    end
  end
end

