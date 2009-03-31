module NuCMS

  class Template

    def initialize
      #page.html -> /page , page.sidebar.html included in /page
      @pages = { }
      #TODO LOCALE
      Dir['content/en/*.html'].each do |page|
        arr = page.split('/').last.split('.')
        if arr.length == 2 #page
          @pages[arr.first.to_sym] = page
        end
      end
    end

    def render(path)
      template = Hpricot(File.read('template/index.html'))
      if @pages.has_key?(path.to_sym) and !path.empty?
        res = ''
        doc = Hpricot(File.read(@pages[path.to_sym]))
        ids = doc.search('//div').map { |e| e.get_attribute('id') }
        ids.each do |i| 
          content = doc.search("//div[@id=\'#{i}\']")
          template.search("//div[@id=\'#{i}\']").first.swap(content.to_html)
          res = template.to_html
        end
      else
        res = false
      end
      res
    end
  end

end


