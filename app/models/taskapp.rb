class Taskapp < ApplicationRecord
    belongs_to :category
    validates :category_id, presence: true

end
