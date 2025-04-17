class CitLevelUser < ApplicationRecord
  belongs_to :cit_record
  belongs_to :user
<<<<<<< HEAD
  default_scope -> { order(created_at: :desc) }
=======

>>>>>>> f23b7e48ec63383043386d1601ad646396189564
end
