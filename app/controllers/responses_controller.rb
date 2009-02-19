class ResponsesController < ApplicationController

  def index
    respond_to do |format|
      format.csv { raise 'NOT IMPLEMENTED '}
    end
  end
  
  def create
    @interview = Interview.find(params[:interview_id])
    @response = @interview.responses.build(params[:response])
    if @response.save
      flash[:notice] = 'Thank you for participating.'
      redirect_to interview_url(@interview)
    else
      render :action => :new
    end
  end
  
end