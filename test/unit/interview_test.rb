require File.dirname(__FILE__) + '/../test_helper'

class InterviewTest < ActiveSupport::TestCase
  test "can pass hash to options setter" do
    interview = Interview.new
    interview.option_attributes = [{:id => '', :name => 'hey'}]
    interview.options.should_not be_empty
    interview.options.first.name.should == 'hey'
  end
end
