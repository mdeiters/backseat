class InterviewsController < ApplicationController
  
  before_filter :load_interview, :excep => [:index]
  
  def edit
    render :action => :new
  end
  alias :new :edit
  
  def show
  end
  
  def update
    @interview.update_attributes(params[:interview])
    if @interview.save
      redirect_to interviews_url
    else
      render :edit
    end    
  end
  alias :create :update 
  

  def index
    @interviews = Interview.all
  end
  
  private
  def load_interview
    @interview = params[:id] ? Interview.find(params[:id] ) : Interview.new
  end
  
end
