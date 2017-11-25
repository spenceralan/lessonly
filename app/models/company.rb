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
end
