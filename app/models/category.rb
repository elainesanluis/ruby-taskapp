class Category < ApplicationRecord
    belongs_to :user
    has_many :taskapps, dependent: :destroy
    accepts_nested_attributes_for :taskapps
  
end
