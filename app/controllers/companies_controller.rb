class CompaniesController < ApplicationController
  def index
    @companies = Company.all
    json_response(@companies)
  end
end
