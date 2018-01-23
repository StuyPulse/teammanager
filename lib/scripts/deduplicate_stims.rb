# This script is run before the migration to add a uniqueness constraint on
# Stims. It doesn't necessarily remove all duplicates, but should remove many
# of the ones we're seeing.

# Get pairs of [year, student_id] for which there are duplicate Stims.
duplicate_pairs = Stim.group(:year, :student_id).having('count(*) > 1').count.keys

duplicate_pairs.each do |year, student_id|
  # Get the Stims corresponding to each pair of [year, student_id]
  stims = Stim.where(year: year, student_id: student_id)

  # If any of these stims has_media_consent and has_guardian, then destroy the
  # others
  good = stims.where(has_guardian: true, has_media_consent: true)

  # If all the stims are good, destroy all but the earliest one
  if good.count == stims.count
    dupes = stims.order(created_by: :desc).take(good.count - 1)
    dupes.destroy_all
    next
  end

  # If any stim is good, destroy the ones that are not good
  if good.count != stims.count
    bad = stims.where.not(has_guardian: true, has_media_consent: true)
    bad.destroy_all
  end
end
