class Training < ApplicationRecord
  #belongs_to :user

    validates :name, presence: true, length: {minimum:3, maximum:20}
    validates :activity, presence: true, length: {in: 5..40}
    validates :user_id, presence: true, numericality: { only_integer: true }
end
