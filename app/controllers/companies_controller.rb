class CompaniesController < ApplicationController
  def index
    @companies = Company.all
    json_response(@companies)
  end

  def alphabetically
    @companies = Company.alphabetically
    json_response(@companies)
  end

  def with_modern_plan
    @companies = Company.with_modern_plan
    json_response(@companies)
  end
end
