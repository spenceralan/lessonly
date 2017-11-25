require 'rails_helper'

describe "get companies routes", type: :request do
  let!(:companyZ) { FactoryBot.create(:company,
    name: "Zeta Test",
    plan_level: "basic",
    trial_status: Date.tomorrow
  )}
  let!(:companyB) { FactoryBot.create(:company,
    name: "Beta Test",
    plan_level: "legacy",
    trial_status: Date.today
  )}
  let!(:companyA) { FactoryBot.create(:company,
    name: "Alpha Test",
    plan_level: "custom",
    trial_status: Date.yesterday,
    created_at: Date.today - 1.month
  )}

  describe "index" do
    it "returns all companies" do
      get "/companies"
      expect(JSON.parse(response.body).size).to eq(3)
    end

    it "returns not found status for invalid requests" do
      get "/companies/delete_all"
      expect(response.status).to eq 404
    end

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

    it "returns only companies with modern plans" do
      get "/companies/with_modern_plan"
      first_company_id = JSON.parse(response.body).dig(0, "id")
      expect(first_company_id).to eq companyZ.id
      expect(JSON.parse(response.body).size).to eq(1)
    end

    it "returns only companies out of trialing period" do
      get "/companies/not_trialing"
      first_company_id = JSON.parse(response.body).dig(0, "id")
      expect(first_company_id).to eq companyA.id
      expect(JSON.parse(response.body).size).to eq(1)
    end

    it "returns the companies created last month" do
      get "/companies/created_last_month"
      first_company_id = JSON.parse(response.body).dig(0, "id")
      expect(first_company_id).to eq companyA.id
      expect(JSON.parse(response.body).size).to eq(1)
    end
  end
end
