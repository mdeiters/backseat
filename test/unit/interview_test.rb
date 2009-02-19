require File.dirname(__FILE__) + '/../test_helper'

class InterviewTest < ActiveSupport::TestCase
  test "can pass hash to options setter" do
    interview = Interview.new
    interview.option_attributes = [{:id => '', :name => 'hey'}]
    interview.options.should_not be_empty
    interview.options.first.name.should == 'hey'
  end

  test 'it requires question' do
    interview = Interview.new
    interview.should error_on(:question, "can't be blank")
  end

  test 'it requires questions less then 200 characters' do
    interview = Interview.new(:question => ('a' * 201))
    interview.should error_on(:question, "is too long (maximum is 200 characters)")
  end
    
end
