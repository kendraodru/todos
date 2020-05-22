class Quote < ApplicationRecord
    validates :user_id, :body, :author, presence:true

    belongs_to :user,
    foreign_key: :user_id,
    clas_name: :User
end
