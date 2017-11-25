require 'rails_helper'

describe "get companies routes", type: :request do
  describe "index", type: :request do
    let!(:companies) { FactoryBot.create_list(:company, 20)}
  
    before { get '/companies' }
  
    it 'returns all companies' do
      expect(JSON.parse(response.body).size).to eq(20)
    end
  end

  describe "alphabetical", type: :request do
    let!(:companyZ) { FactoryBot.create(:company, name: "Zeta Test")}
    let!(:companyB) { FactoryBot.create(:company, name: "Beta Test")}
    let!(:companyA) { FactoryBot.create(:company, name: "Alpha Test")}
  
    it 'returns all companies without order' do
      get '/companies'
      first_company_id = JSON.parse(response.body).dig(0, "id")
      expect(first_company_id).to eq companyZ.id
    end
  
    it 'returns all companies alphabetically' do
      get '/companies/alphabetically'
      first_company_id = JSON.parse(response.body).dig(0, "id")
      expect(first_company_id).to eq companyA.id
    end
  end
end
