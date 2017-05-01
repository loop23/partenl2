class Paragraph < ApplicationRecord
  belongs_to :section
  has_one :document, through: :section
  belongs_to :parent,
             class_name: 'Paragraph',
             optional: true,
             foreign_key: :paragraph_id
  has_many :children, class_name: 'Paragraph', foreign_key: :paragraph_id
  validates :content, :order, presence: true
  validates :order, uniqueness: { scope: [:section_id, :paragraph_id] }
  before_validation :set_order, on: :create

  scope :root, -> { where(parent: nil) }

  def is_root?
    parent.nil?
  end
  def set_order
    return if order
    if parent
      pp = parent.children.pluck(:order)
    else
      pp = section.paragraphs.pluck(:order)
    end
    self.order = pp.empty? ? 1 : pp.max + 1
  end

  def full_order
    [order, parent ? parent.order : ''].compact.reverse.join('.')
  end

end
