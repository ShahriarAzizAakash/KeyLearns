class Content < ApplicationRecord
    belongs_to :course
    mount_uploaders :attachments, AttachmentsUploader
end
