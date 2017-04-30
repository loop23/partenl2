class Section < ApplicationRecord
  belongs_to :document
  validates :title, :content, presence: true
  validates :order, uniqueness: { scope: :document }
end
