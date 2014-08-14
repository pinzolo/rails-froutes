require 'rails/froutes/routes_inspector_patch'
require 'rails/froutes/version'

if Rails::VERSION::MAJOR == 4
  require 'action_dispatch/routing/inspector'
  ActionDispatch::Routing::RoutesInspector.__send__(:include, Rails::Froutes::RoutesInspectorPatch)
else
  require 'rails/application/route_inspector'
  Rails::Application::RouteInspector.__send__(:include, Rails::Froutes::RoutesInspectorPatch)
end
