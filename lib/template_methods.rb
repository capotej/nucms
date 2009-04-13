module NuCMS

  class TemplateMethods
    def initialize(path)
      @path = path
    end


    def active_if(path)
      if @path == path
        "active"
      else
        ""
      end
    end
  end
  
end
