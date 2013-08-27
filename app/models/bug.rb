class Bug < ActiveRecord::Base
  validates :twitter_handle, :short_description, presence: true
end
