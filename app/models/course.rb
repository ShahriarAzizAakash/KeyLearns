class Course < ApplicationRecord
    belongs_to :user
    has_many :enrollments
    has_many :contents
    mount_uploader :featuredImage, FeaturedImageUploader
end
