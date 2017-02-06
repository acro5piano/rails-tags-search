class ApplicantsTag < ApplicationRecord
  belongs_to :applicant
  belongs_to :tag
end
