class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  storytime_user

  def roles
    storytime_roles
  end

  def admin?
    roles.pluck(:name).include? ('admin')
  end

end
