class Journey < ApplicationRecord
  belongs_to :user
  belongs_to :path
end
