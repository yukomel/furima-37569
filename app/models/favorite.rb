class Favorite < ApplicationRecord
  belongs_to :product, counter_cache: :favorites_count
  belongs_to :user
end
