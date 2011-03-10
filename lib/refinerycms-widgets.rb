require 'refinery'

module Refinery
  module Widgets
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "widgets"
          #plugin.hide_from_menu = true
          #plugin.dashboard = true
          #plugin.controller = WidgetsController
          plugin.activity = {
            :class => Widget}
        end
      end
    end
  end
end
