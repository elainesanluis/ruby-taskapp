class Taskapp < ApplicationRecord
    belongs_to :category
    scope :completed, -> { where(status: 'Completed') }

end
