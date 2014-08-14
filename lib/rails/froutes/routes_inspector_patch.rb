require 'active_support/concern'
require 'active_support/core_ext'

module Rails
  module Froutes
    module RoutesInspectorPatch
      extend ActiveSupport::Concern

      included do
        alias_method_chain :collect_routes, :fill_name
      end

      def collect_routes_with_fill_name(base_routes)
        routes = allowed_to_fill_route_name? ? name_filled_routes_from(base_routes) : base_routes
        collect_routes_without_fill_name(routes)
      end

      private

      def allowed_to_fill_route_name?
        fill_env = ENV['FILL_NAME'] || ENV['fill_name']
        fill_env && %w(y yes true).include?(fill_env.downcase)
      end

      def name_filled_routes_from(routes)
        routes.dup.tap do |dup_routes|
          controller, name = nil
          dup_routes.each do |route|
            if route.name || route.defaults[:controller] != controller
              name = route.name
              controller = route.defaults[:controller]
            else
              route.instance_variable_set(:@name, name)
            end
          end
        end
      end
    end
  end
end
