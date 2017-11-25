require 'rails_helper'

describe "get companies routes", type: :request do
  let!(:companyZ) { FactoryBot.create(:company, name: "Zeta Test", plan_level: "basic")}
  let!(:companyB) { FactoryBot.create(:company, name: "Beta Test", plan_level: "legacy")}
  let!(:companyA) { FactoryBot.create(:company, name: "Alpha Test", plan_level: "custom")}

  describe "index" do
    it "returns all companies" do
      get "/companies"
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end

  describe "alphabetical" do
    it "returns all companies without order" do
      get "/companies"
      first_company_id = JSON.parse(response.body).dig(0, "id")
      expect(first_company_id).to eq companyZ.id
    end

    it "returns all companies alphabetically" do
      get "/companies/alphabetically"
      first_company_id = JSON.parse(response.body).dig(0, "id")
      expect(first_company_id).to eq companyA.id
    end
  end

  describe "with modern plan" do
    it "returns only companies with modern plans" do
      get "/companies/with_modern_plan"
      first_company_id = JSON.parse(response.body).dig(0, "id")
      expect(first_company_id).to eq companyZ.id
      expect(JSON.parse(response.body).size).to eq(1)
    end
  end
end
