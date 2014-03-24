class Link < ActiveRecord::Base
  before_create :generate_uid
  validate :is_a_url

  default_scope -> { order(count: :desc) }

  def generate_uid
    self.uid = SecureRandom.hex(2) until !self.uid.nil? && Link.where(uid: self.uid).count.zero?
  end

  def is_a_url
    errors.add(:url, 'is not a valid url') unless url =~ /http/
  end
end
