class Tag < ApplicationRecord
  has_many :applicants_tags

  def applicant_count
    applicants = ApplicantsTag.where(tag_id: self.id).count
    return self.name + '  ' + applicants.to_s
  end
end
