module NuCMS

  class Content

    def initialize(app)
      @app = app
    end

    def call(env)
      if env["PATH_INFO"].to_s == "/foo"
        [200, {"Content-Length" => "5", "Content-Type" => "text/plain" }, "Hello"]
      else
        @app.call(env)
      end
    end
  end
end
      
