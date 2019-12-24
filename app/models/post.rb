# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  content    :text
#  name       :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  default_scope -> {order(id: :desc)}
  validates :name, presence: true, length: {maximum: 10}
  validates :title, presence: true, length: {maximum: 30}
  validates :content, presence: true, length: {maximum: 1000}
  has_many :comments, dependent: :destroy
  has_many :post_tag_relations, dependent: :delete_all
  has_many :tags, through: :post_tag_relations

end
