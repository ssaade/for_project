class User < ApplicationRecord
  # Direct associations

  has_many   :inviter_overlaps,
             :class_name => "Overlap",
             :foreign_key => "inviter_id",
             :dependent => :destroy

  has_many   :availabilities,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
