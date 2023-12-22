class UsersDoc < ApplicationRecord
  belongs_to :doc

  validates :title, presence: true
end
