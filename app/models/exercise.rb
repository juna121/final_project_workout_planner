class Exercise < ApplicationRecord
  # Direct associations

  has_many   :performances,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
