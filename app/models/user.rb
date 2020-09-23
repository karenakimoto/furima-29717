class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  with_options presence: true do
    validates :nickname
    validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i }
    validates :familyname, format: { with: /\A[ぁ-んァ-ンー-龥]/ }
    validates :firstname, format: { with: /\A[ぁ-んァ-ンー-龥]/ }
    validates :familyname_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :firstname_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birthday
  end
end
