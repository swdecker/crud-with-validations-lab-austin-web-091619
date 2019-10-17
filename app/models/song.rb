class Song < ApplicationRecord
    validates :title, presence: true
    validates :released, inclusion: { in: [true, false]}
    validates :artist_name, presence: true
    validates :release_year, numericality: { less_than_or_equal_to: 2019}, if: :released?
    validates :title, uniqueness: {scope: [:release_year, :artist_name]}
    def released?
        released == true
    end
end
