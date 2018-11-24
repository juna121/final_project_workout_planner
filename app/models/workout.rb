class Workout < ApplicationRecord
  # Direct associations

  has_many   :performances,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
