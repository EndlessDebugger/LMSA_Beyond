module LMSAApp
  class Application < Rails::Application
    config.after_initialize do
      config.points = config_for(:points)
    end
  end
end
