module NuCMS

  class Cache
    def initalize(app,path)
      @app = app
      @path = path
    end

    def call(env)
      path = @path = "/*.html"
      cached = Dir[path].map do |x| 
        name = x.split('/').last.split('.').first
      end
    end



  end

end

