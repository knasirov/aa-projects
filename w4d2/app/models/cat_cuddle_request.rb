# == Schema Information
#
# Table name: cat_cuddle_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime
#  updated_at :datetime
#

class CatCuddleRequest < ActiveRecord::Base
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: %w(PENDING APPROVED DENIED), message: "Not a valid status" }
  validate :start_before_end
  validate :overlapping_requests

  belongs_to :cat

  def overlapping_approved_requests?
    return false unless self.status == "APPROVED"

    approved_requests = CatCuddleRequest.all.select do |request|
      request.status == "APPROVED"
    end

    approved_requests.each do |request|
      next if request.id == id
      return true if request.cat_id == cat_id &&
        (start_date.between?(request.start_date, request.end_date - 1) ||
        end_date.between?(request.start_date + 1, request.end_date))
    end
    false
  end

  def overlapping_requests
    if overlapping_approved_requests?
      errors[:overlap] << "Start and end date conflict with other approved request"
    end
  end

  def start_before_end
    if end_date <= start_date
      errors[:start] << "start date cannot be before end date"
    end
  end

end
