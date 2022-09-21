class Recipe < ApplicationRecord
    belongs_to :user
    has_one_attached :cover_image
    has_many :comments,  dependent: :destroy
end
