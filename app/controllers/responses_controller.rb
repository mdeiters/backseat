class ResponsesController < ApplicationController
  
  before_filter :load_interview
  skip_before_filter :require_login, :only => [:new, :create]

  def index
    respond_to do |format|
      format.csv { send_data ::ResponseExporter.csv(@interview), 
                            :type => 'text/csv; charset=iso-8859-1; header=present', 
                            :disposition => "attachment; filename=interview_#{@interview.id}.csv"}
    end
  end
    
  def new
  end
  
  def create
    @response = @interview.responses.build(params[:response])
    if @response.save
      respond_to do |format|
        # format.js {
        #   update_page do |page|
        #     page.alert('hi')
        #   end
        # }
        format.html {
          flash[:notice] = 'Thank you for participating.'
          redirect_to interview_url(@interview)
        }
      end      
    else
      render :action => :new
    end
  end
  
  private
  def load_interview
    @interview = Interview.find(params[:interview_id])
  end  
  
end