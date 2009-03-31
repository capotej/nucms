module NuCMS

  class Template

    def initialize
      #page.html -> /page , page.sidebar.html included in /page
      @pages = { }
      @layout = []
      #TODO LOCALE
      Dir['content/en/*.html'].each do |page|
        arr = page.split('/').last.split('.')
        if arr.length == 2 #page
          @pages[arr.first.to_sym] = Array.new
          @pages[arr.first.to_sym] << page
        else
          @pages[arr.first.to_sym] << page
        end
      end
      Dir['content/en/layout/*.html'].each do |page|
        @layout << page
      end
    end

    def render(path)
      if path == ""
        path = "home"
      end

      template = Hpricot(File.read('template/index.html'))
      if @pages.has_key?(path.to_sym) and !path.empty?
        seen_ids = []
        selection = @layout + @pages[path.to_sym]
        changes = selection.map { |c| File.read(c) }.join
        doc = Hpricot(changes)

        ids = doc.search('//div').map { |e| e.get_attribute('id') }
        ids.each do |i| 
          unless seen_ids.include?(i)
            content = doc.search("//div[@id=\'#{i}\']")
            template.search("//div[@id=\'#{i}\']").first.swap(content.to_html)
            seen_ids << i
          end
        end
        res = template.to_html
      else
        res = false
      end
      res
    end
  end

end


