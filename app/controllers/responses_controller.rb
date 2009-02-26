class ResponsesController < ApplicationController
  
  before_filter :load_interview, :except => [:index]

  def index
    respond_to do |format|
      format.csv { raise 'NOT IMPLEMENTED '}
    end
  end
  
  def new
  end
  
  def create
    @response = @interview.responses.build(params[:response])
    if @response.save
      flash[:notice] = 'Thank you for participating.'
      redirect_to interview_url(@interview)
    else
      render :action => :new
    end
  end
  
  private
  def load_interview
    @interview = Interview.find(params[:interview_id])
  end  
  
end