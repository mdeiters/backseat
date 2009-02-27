class ResponseExporter
  class << self
    def csv(interview)
      return FasterCSV.generate do |file|
        file << header_row = ["Question", "Participant", "Value", "Comment"]
        interview.responses.each do |response|
          file << [interview.question, response.user, response.value, response.comment.gsub(',', '...')]
        end
      end
    end
  end  
end