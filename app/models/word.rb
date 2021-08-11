class Word < ApplicationRecord
  belongs_to :user

  validates :word, presence: true, length: { in: 1..30 }
  validates :memo, length: { maximum: 240 }
end
