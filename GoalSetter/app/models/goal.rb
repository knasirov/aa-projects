# == Schema Information
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  details    :text
#  private    :boolean          default("false")
#  completed  :boolean          default("false")
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Goal < ActiveRecord::Base
  validates :title, :user_id, presence: true
  validates :user_id, uniqueness: true

  belongs_to :user
end
