# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ApplicationRecord
  has_many :product_tags
  has_many :products, through: :product_tags

  validates :name, presence: true, length: { maximum: 255 }

  def to_proto
    Ec::Tag.new(
      id: id,
      name: name,
      created_at: created_at.to_s,
      updated_at: updated_at.to_s
    )
  end
end
