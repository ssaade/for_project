class Overlap < ApplicationRecord
  # Direct associations

  belongs_to :seconduser,
             :class_name => "User",
             :foreign_key => "invited_id"

  belongs_to :firstuser,
             :class_name => "User",
             :foreign_key => "inviter_id",
             :counter_cache => :inviter_overlaps_count

  # Indirect associations

  # Validations

end
