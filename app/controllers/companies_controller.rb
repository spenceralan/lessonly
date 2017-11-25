class CompaniesController < ApplicationController
  def index
    response = Company.query(input: params[:property])
    json_response(response)
  end
end
