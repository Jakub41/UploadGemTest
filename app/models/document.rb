class Document < ActiveRecord::Base
  include UploadDocumentsTool
  validate :document_file_format
  before_save :upload_local
  validates_uniqueness_of :filename, message: "File exist"
end
