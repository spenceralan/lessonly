class Lesson < ApplicationRecord
  belongs_to :company

  validates :name,
    presence: true,
    format: {
      with: /\A[[:alnum:]]+\z/
    }
end
