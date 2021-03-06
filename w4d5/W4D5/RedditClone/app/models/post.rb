class Post < ActiveRecord::Base
  validates :title, :author_id, presence: true

  belongs_to :author,
    class_name: :User

  has_many :post_subs, dependent: :destroy, inverse_of: :post
  has_many :subs, through: :post_subs
end
