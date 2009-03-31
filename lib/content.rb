module NuCMS

  class Content

    def initialize(app)
      @app = app
      @content_pages = Dir['content/en/*.html']
      @menu = []
    end

    def call(env)
      
      res = Template.render(env["PATH_INFO"].to_s)

      if res
         [200, {"Content-Length" => res.size.to_s, "Content-Type" => "text/html"}, res]
      else
        @app.call(env)
      end
    end
  end
end

