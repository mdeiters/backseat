module InterviewsHelper
  
  def interview_javascript_badge(mode)
    "http://#{host}/interviews/#{params[:id]}/responses/new.js?mode=#{mode}&user=optional"
  end
  
end
