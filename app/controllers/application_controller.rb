class ApplicationController < ActionController::API

  rescue_from ActionController::ParameterMissing, with: :record_invalid
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
  rescue_from ActionDispatch::Http::Parameters::ParseError, with: :record_invalid

  private

  def record_not_found(exception)
    render json: ErrorSerializer.format_error(404, exception.message, "Record Not Found"), status: :not_found
  end

  def record_invalid(exception)
    clean_message = exception.record.errors.full_messages.to_sentence.gsub("Card", "")

    render json: ErrorSerializer.format_error(422, clean_message, "Unprocessable_entity"), status: :unprocessable_entity
  end

end
