class Document < ApplicationRecord
  has_many :sections, -> { order(order: :asc) }
  validates :title, presence: true
end
