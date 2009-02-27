module ApplicationHelper
  
  def host
    request.env['HTTP_HOST']
  end
  
end
