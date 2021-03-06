class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:twitter, :facebook]

         class << self
          def find_or_create_for_oauth(auth)
           find_or_create_by!(email: auth.info.email) do |user|
            user.provider = auth.provider
            user.uid = auth.uid
            user.name = auth.info.name
            user.email = auth.info.email
            password = Devise.friendly_token[0..5]
            logger.debug password
            user.password = password
           end
          end

         def new_with_session(params, session)
          if user_attributes = session['devise.user_attributes']
           new(user_attributes) { |user| user.attributes = params }
          else
           super
          end
         end
       end
     has_many :articles, dependent: :destroy
     has_many :comments, dependent: :destroy
     has_many :bookmarks, dependent: :destroy
     has_many :likes, dependent: :destroy
end
