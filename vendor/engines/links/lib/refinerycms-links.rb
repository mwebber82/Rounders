require 'refinerycms-base'

module Refinery
  module Links
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "links"
          plugin.activity = {
            :class => Link,
            :title => 'Title'
          }
        end
      end
    end
  end
end
