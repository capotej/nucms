module NuCMS

  class Content

    def initialize(app)
      @app = app
      @template = Template.new
    end

    def call(env)
      res = @template.render(env["PATH_INFO"].to_s.sub('/',''))
      if res
         [200, {"Content-Length" => res.size.to_s, "Content-Type" => "text/html"}, res]
      else
        @app.call(env)
      end
    end
  end
end

