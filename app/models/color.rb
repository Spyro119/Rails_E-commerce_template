class Color < ApplicationRecord
    has_one :size_color
    has_one :size, through: :size_color
end
