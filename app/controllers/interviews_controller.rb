class InterviewsController < ApplicationController
  
  before_filter :load_interview, :except => [:index]
  
  def edit
    render :action => :new
  end
  alias :new :edit
  
  def show
  end
  
  def update
    @interview.update_attributes(params[:interview])
    if @interview.save
      redirect_to interview_url(@interview)
    else
      render :edit
    end    
  end
  alias :create :update 

  def index
    @interviews = current_user.interviews
  end
  
  private
  def load_interview
    @interview = params[:id] ? current_user.interviews.find(params[:id] ) : current_user.interviews.build
  end

  helper_method :render_to_string
end
