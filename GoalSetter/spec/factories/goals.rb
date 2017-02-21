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

FactoryGirl.define do
  factory :goal do
    title "MyString"
    details "MyText"
    privacy_setting "MyString"
    status false
    iser_id 1
  end
end
