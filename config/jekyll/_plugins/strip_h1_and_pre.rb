module Liquid
  module StandardFilters

    def strip_h1_and_pre(html)
      remove_tag(remove_tag(html,"h1"),"pre")
    end

    private

    def remove_tag(html,tag)
      new_html = html.gsub(/<#{tag}>.*?<\/#{tag}>/m,"")
      while html != new_html
        html = new_html
        new_html = html.gsub(/<#{tag}>.*?<\/#{tag}>/m,"")
      end

      new_html
    end
  end
end
