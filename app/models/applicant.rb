class Applicant < ApplicationRecord
  has_many :tags, through: :applicants_tags
  has_many :applicants_tags
end
