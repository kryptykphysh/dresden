class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :rememberable, :trackable, :validatable,
         :omniauthable, :database_authenticatable#, :registerable, :recoverable

  has_many  :gamemastered_campaigns,
            class_name: 'Campaign',
            foreign_key: 'gamemaster_id'
  has_and_belongs_to_many :played_campaigns,
                          class_name: 'Campaign',
                          join_table: :campaigns_players

  default_scope { order(name: :asc) }

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:provider => access_token.provider,
                      :uid      => access_token.uid).first
    if user
      return user
    else
      registered_user = User.where(:email => access_token.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(
          name:     data["name"],
          provider: access_token.provider,
          email:    data["email"],
          uid:      access_token.uid,
          password: Devise.friendly_token[0,20],
        )
      end
    end
  end
end
