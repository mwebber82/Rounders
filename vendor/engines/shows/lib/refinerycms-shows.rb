require 'refinerycms-base'

module Refinery
  module Shows
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "shows"
          plugin.activity = {
            :class => Show,
            :title => 'Title'
          }
        end
      end
    end
  end
end
