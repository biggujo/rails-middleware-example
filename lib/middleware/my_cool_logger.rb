require 'rainbow/refinement'
using Rainbow

module MyCoolLogger
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      puts "MyCoolLogger: New request: #{env["REQUEST_METHOD"]} at #{env["REQUEST_PATH"]} at #{Time.now.to_s}".bright.yellow
      result = @app.call(env)
      puts 'MyCoolLogger: After my middleware call'.bright.yellow
      result
    end
  end
end
