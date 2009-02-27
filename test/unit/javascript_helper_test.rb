require File.dirname(__FILE__) + '/../test_helper'

class JavascriptHelperTest < ActiveSupport::TestCase
  include JavascriptHelper
  
  test 'remove all new lines and replace with spaces' do
    escape_for_document_write("<hello>\nWorld\n</hello>").should == "<hello> World </hello>"
  end
  
  test 'espacpes ticks and double ticks' do
    javascript = <<JS
      <a onclick='alert("hi")'>asdf</a>
JS
    # escape_for_document_write(javascript).
  end
  
end
