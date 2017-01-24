class CheckIn < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :campus, presence: true

  def self.to_csv
    attributes = %w{name email address dob campus time date}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |checkin|
        csv << attributes.map{ |attr| checkin.send(attr) }
      end
    end
  end

  def name
    user.name
  end

  def email
    user.email
  end

  def address
    user.address
  end

  def dob
    user.try(:date_of_birth).try(:strftime, "%m/%d/%Y")
  end

  def time
    self.updated_at.in_time_zone('Eastern Time (US & Canada)').strftime("%I:%M %p %Z")
  end

  def date
    self.updated_at.in_time_zone('Eastern Time (US & Canada)').strftime("%m/%d/%Y")
  end

end
