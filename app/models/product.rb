# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  price      :decimal(8, 2)    not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Product < ApplicationRecord
  has_many :product_tags
  has_many :tags, through: :product_tags

  validates :name, presence: true, length: { maximum: 255 }
  validates :price, presence: true

  def to_proto
    Ec::Product.new(
      id: id,
      name: name,
      price: price.to_f,
      created_at: created_at.to_s,
      updated_at: updated_at.to_s,
      tags: tags.map(&:to_proto)
    )
  end
end
