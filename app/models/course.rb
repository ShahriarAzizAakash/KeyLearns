class Course < ApplicationRecord
    belongs_to :user
    has_many :enrollments
    has_many :contents
    mount_uploaders :attachments, AttachmentsUploader
end
