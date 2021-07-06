class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  FURIGANA_REGEX = /\A(?=.*?[ァ-ヶー－])[ァ-ヶー－]+\z/i.freeze
  NAME_REGEX = /\A(?=.*?[ぁ-んァ-ヶ一-龥々])[ぁ-んァ-ヶ一-龥々]+\z/i.freeze
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :nickname, presence: true
  validates :first_name, presence: true, format: { with: NAME_REGEX}
  validates :last_name, presence: true, format: { with: NAME_REGEX}
  validates :furigana_first_name, presence: true, format: { with: FURIGANA_REGEX}
  validates :furigana_last_name, presence: true, format: { with: FURIGANA_REGEX}
  validates :birth_date, presence: true
  validates :password, format: { with: PASSWORD_REGEX }
end
