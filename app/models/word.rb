class Word < ApplicationRecord
  belongs_to :user

  validates :word, presence: true, length: { in: 1..30 }
  validates :memo, length: { maximum: 240 }

  scope :active, -> { where(archive: false) }
  scope :archive, -> { where(archive: true) }

  scope :sorted, -> { order(updated_at: :desc) }
end
