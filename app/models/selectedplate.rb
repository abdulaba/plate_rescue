class Selectedplate < ApplicationRecord
  belongs_to :cart 
  belongs_to :plate
end
