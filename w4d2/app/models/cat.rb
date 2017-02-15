# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  sex         :string(1)        not null
#  birth_date  :date             not null
#  color       :string
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Cat < ActiveRecord::Base
  validates :name, :sex, :birth_date, presence: true
  validates :sex, inclusion: { in: %w(M F X), message: "not a valid sex" }
  validates :color, inclusion: { in: %w(black white brown ginger hairless), message: "cats can't be that color}" }
  validates_length_of :sex, maximum: 1

  has_many :cat_cuddle_requests, dependent: :destroy

  def age
    Date.today.year - birth_date.year
  end

end
