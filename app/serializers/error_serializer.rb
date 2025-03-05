class ErrorSerializer
  def self.format_errors(errors)
    {
      message: "There was errors processing your request",
      errors: errors.map do |error|
        {
          status: error[:status].to_s,
          title: error [:title],
          message: error[:message],
          detail: error[:detail]
        }
      end
    }
  end

  def self.format_error(status, message, title = "Error", detail )
    {
      error: {
        status: status.to_s,
        title: title,
        message: message,
        detail: detail
      }
    }
  end
end