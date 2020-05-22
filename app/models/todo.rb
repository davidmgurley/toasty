class Todo < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true
    validates :position, presence: true
end
