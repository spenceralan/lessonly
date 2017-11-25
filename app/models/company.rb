class Company < ApplicationRecord
  has_many :lessons

  PLAN_LEVELS = {
    legacy: 0,
    custom: 1,
    basic: 2,
    plus: 3,
    growth: 4,
    enterprise: 5,
  }

  VALID_QUERIES = [
    "alphabetically",
    "with_modern_plan",
    "not_trialing",
    "created_last_month"
  ]

  enum plan_level: PLAN_LEVELS

  validates :name,
    presence: true,
    length: {
      minimum: 2,
      maximum: 255,
    }

  validates :trial_status,
    presence: true
  
  validates :plan_level,
    presence: true,
    inclusion: {
      in: PLAN_LEVELS.keys.map(&:to_s)
    }

  scope :alphabetically, -> { order :name }
  scope :with_modern_plan, -> { where.not(plan_level: "legacy").where.not(plan_level: "custom") }
  scope :not_trialing, -> { where("trial_status < ?", Date.today) }
  scope :created_last_month, -> { where("created_at between ? and ?", previous_month.at_beginning_of_month, previous_month.at_end_of_month) }

  def self.query(input: nil)
    return { object: all } if input.nil?
    if VALID_QUERIES.include?(input)
      { object: send(input) }
    else
      { object: nil, status: :not_found }
    end
  end

  def self.previous_month(date: Date.today)
    date - 1.month
  end

  private_class_method :previous_month
end
