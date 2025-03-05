require 'rails_helper'

RSpec.describe ErrorSerializer, type: :serializer do
  describe ".format_error" do
    let(:status) { 400 }
    let(:message) { "Bad Request" }
    let(:title) { "Error" }
    let(:detail) { "Invalid request parameters" }

    it 'formats the error correctly' do
      formatted_error = ErrorSerializer.format_error(status, message, title, detail)
      aggregate_failures do

        expect(formatted_error[:error]).to be_a(Hash)
        expect(formatted_error[:error][:status]).to eq("400")
        expect(formatted_error[:error][:title]).to eq("Error")
        expect(formatted_error[:error][:message]).to eq("Bad Request")
        expect(formatted_error[:error][:detail]).to eq("Invalid request parameters")
      end
    end
  end

  describe ".format_errors" do
    it "formats the error messages and status correctly" do
      errors = [
        {
          status: 400,
          title: "Bad Request",
          message: "Invalid request format",
          detail: "The request body is malformed."
        },
        {
          status: 422,
          title: "Unprocessable Entity",
          message: "Validation failed",
          detail: "Name can't be blank."
        }
      ]
      
      formatted_errors = ErrorSerializer.format_errors(errors)

      expect(formatted_errors[:message]).to eq("There was errors processing your request")
      expect(formatted_errors[:errors].length).to eq(2)
      expect(formatted_errors[:errors][0][:status]).to eq("400")
      expect(formatted_errors[:errors][0][:message]).to eq("Invalid request format")
      expect(formatted_errors[:errors][1][:status]).to eq("422")
      expect(formatted_errors[:errors][1][:message]).to eq("Validation failed")
    end
  end
end

