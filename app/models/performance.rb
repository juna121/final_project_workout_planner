class Performance < ApplicationRecord
  # Direct associations

  belongs_to :exercise

  belongs_to :workout

  # Indirect associations

  # Validations

end
