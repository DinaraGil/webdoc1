class Doc < ApplicationRecord
    has_many :users_docs

    validates :title, presence: true
    validates :body, presence: true
end
