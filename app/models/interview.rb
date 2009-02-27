class Interview < ActiveRecord::Base
  belongs_to :user
  has_many :responses
  has_many :options
  
  validates_presence_of :question
  validates_length_of :question, :maximum => 200
  
  #don't allow quotes or double quotes
  
  def option_attributes=(options_hash)
    self.options.clear
    options_hash.each do |option_hash|
      option = option_hash[:id].blank? ? Option.new : Option.find(option_hash[:id])
      option.name = option_hash[:name]
      self.options << option
    end
  end
  
end
