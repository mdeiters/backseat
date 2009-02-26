module JavascriptHelper
  
  def escape_for_document_write(html)
    html.gsub("\'", "\"").gsub("\n", ' ')
  end
  
end