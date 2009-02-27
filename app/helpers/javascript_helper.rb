module JavascriptHelper
  
  def escape_for_document_write(html)
    html.gsub("\n", ' ').gsub(/'/, '\\\\\'\1')
  end
  
end