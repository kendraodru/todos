class Todo < ApplicationRecord
    validates :title, :description, :user_id, presence:true
    validates :done, inclusion: { in: [true, false] }

    belongs_to :user,
    foreign_key: :user_id,
    class_name: :User

    
end
