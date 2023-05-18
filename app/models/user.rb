class User < ApplicationRecord
    authenticates_with_sorcery!
    
    has_many :user_diaries, dependent: :destroy, foreign_key: 'diary_id'
    has_many :diaries, through: :user_diaries  

    validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
    validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
    validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  
    validates :email, uniqueness: true
    validates :email, presence: true
    validates :first_name, presence: true, length: { maximum: 255 }
    validates :last_name, presence: true, length: { maximum: 255 }



end
