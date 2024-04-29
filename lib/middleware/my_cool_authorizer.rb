require 'rainbow/refinement'
using Rainbow

module MyCoolAuthorizer
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      request = Rack::Request.new(env)
      token = request.params["token"]

      if token != "12345"
        puts "Unauthorized access attempt at #{Time.now.to_s}!".bright.red
        return [401, {}, ['You are unauthorized']]
      end

      @app.call(env)
    end
  end
end
