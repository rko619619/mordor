class Tagging < ApplicationRecord
  belongs_to :composition
  belongs_to :tag
end
