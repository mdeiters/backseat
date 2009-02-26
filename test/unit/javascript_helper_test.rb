require File.dirname(__FILE__) + '/../test_helper'

class JavascriptHelperTest < ActiveSupport::TestCase
  include JavascriptHelper
  
  test 'makes all single quotes to double quotes' do
    escape_for_document_write("<hello class='something'>world</hello>").should == "<hello class=\"something\">world</hello>"
  end
  
  test 'remove all new lines and replace with spaces' do
    escape_for_document_write("<hello>\nWorld\n</hello>").should == "<hello> World </hello>"
  end
  
end
