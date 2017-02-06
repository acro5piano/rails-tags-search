200.times do
  Applicant.create(name: Gimei.kanji, age: 20 + rand(40))
end

400.times do
  ApplicantsTag.create(
    applicant_id: Applicant.pluck(:id).sample,
    tag_id: Tag.pluck(:id).sample
  )
end
