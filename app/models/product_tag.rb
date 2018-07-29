# == Schema Information
#
# Table name: product_tags
#
#  id         :integer          not null, primary key
#  product_id :integer          not null
#  tag_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProductTag < ApplicationRecord
  belongs_to :product
  belongs_to :tag
end
