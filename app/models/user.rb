class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  FURIGANA_REGEX = /\A(?=.*?[ァ-ヶー－])[ァ-ヶー－]+\z/i.freeze
  NAME_REGEX = /\A(?=.*?[ぁ-んァ-ヶ一-龥々])[ぁ-んァ-ヶ一-龥々]+\z/i.freeze
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  with_options presence: true do
    validates :nickname
    validates :birth_date
    validates :password, format: { with: PASSWORD_REGEX }
    with_options format: { with: NAME_REGEX} do
      validates :first_name
      validates :last_name
    end
    with_options format: { with: FURIGANA_REGEX} do
      validates :furigana_first_name
      validates :furigana_last_name
    end
  end

  has_many :items
end
