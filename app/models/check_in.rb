class CheckIn < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :campus, presence: true

end
