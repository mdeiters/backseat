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
        format.js {
          render :update do |page|
            # page << "jQuery(document).trigger('close.facebox')"
            page << "jQuery.facebox('Thanks for participating')"
          end
        }
        format.html {
          flash[:notice] = 'Thank you for participating.'
          redirect_to :back # , interview_url(@interview)
        }
      end      
    else
      raise @response.errors.inspect.to_s
      # render :action => :new
    end
  end
  
  private
  def load_interview
    @interview = Interview.find(params[:interview_id])
  end  
  
end