class Section < ApplicationRecord
  belongs_to :document
  has_many :paragraphs, -> { Paragraph.root.order(order: :asc) }
  has_many :all_paragraphs, class_name: 'Paragraph'
  validates :title, presence: true
  validates :order, uniqueness: { scope: :document }
end
