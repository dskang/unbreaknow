class Bug < ActiveRecord::Base
  validates :service_twitter, :short_description, presence: true
end
