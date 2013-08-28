class Bug < ActiveRecord::Base
  validates :service_twitter, :short_description, presence: true
  validates :service_twitter, length: { maximum: 50 }
  validates :short_description, length: { maximum: 100 }
  validate :service_twitter_must_be_single_word

  def service_twitter_must_be_single_word
    if service_twitter.split(" ").length > 1
      errors.add(:service_twitter, "must be a single word")
    end
  end
end
