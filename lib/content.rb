module NuCMS

  class Content

    def initialize(app)
      @app = app
    end

    def call(env)
      html = RDiscount.new(File.open("content/home.md").read).to_html
      if env["PATH_INFO"].to_s == "/foo"
         [200, {"Content-Length" => html.size.to_s, "Content-Type" => "text/html"}, html]
      else
        @app.call(env)
      end
    end
  end
end

