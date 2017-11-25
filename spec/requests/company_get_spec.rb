require 'rails_helper'

describe "get all companies route", type: :request do
  let!(:companies) { FactoryBot.create_list(:company, 20)}

  before { get '/companies' }

  it 'returns all companies' do
    expect(JSON.parse(response.body).size).to eq(20)
  end
end