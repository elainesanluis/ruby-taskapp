class Taskapp < ApplicationRecord
    belongs_to :category
    scope :completed, -> { where(status: 'Completed') }
    validates :category_id, presence: true

end
