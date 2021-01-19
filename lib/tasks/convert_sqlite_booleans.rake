# represent_boolean_as_integer deprecated in 6.0, removed in 6.1
# https://api.rubyonrails.org/v5.2/classes/ActiveRecord/ConnectionAdapters/SQLite3Adapter.html#method-c-represent_boolean_as_integer
desc "Convert all sqlite booleans from t/f to 1/0"
task :convert_sqlite_booleans => :environment do
  Payment.where("excused = 't'").update_all(excused: 1)
  Payment.where("excused = 'f'").update_all(excused: 0)

  SafetyTest.where("is_passed = 't'").update_all(is_passed: 1)
  SafetyTest.where("is_passed = 'f'").update_all(is_passed: 0)
  SafetyTest.where("is_signed = 't'").update_all(is_signed: 1)
  SafetyTest.where("is_signed = 'f'").update_all(is_signed: 0)

  Stim.where("has_media_consent = 't'").update_all(has_media_consent: 1)
  Stim.where("has_media_consent = 'f'").update_all(has_media_consent: 0)
  Stim.where("has_guardian = 't'").update_all(has_guardian: 1)
  Stim.where("has_guardian = 'f'").update_all(has_guardian: 0)

  Student.where("is_newbie = 't'").update_all(is_newbie: 1)
  Student.where("is_newbie = 'f'").update_all(is_newbie: 0)
  Student.where("is_active = 't'").update_all(is_active: 1)
  Student.where("is_active = 'f'").update_all(is_active: 0)

  TeamDue.where("excused = 't'").update_all(excused: 1)
  TeamDue.where("excused = 'f'").update_all(excused: 0)

  Trip.where("requires_teacher_permission = 't'").update_all(requires_teacher_permission: 1)
  Trip.where("requires_teacher_permission = 'f'").update_all(requires_teacher_permission: 0)

  User.where("is_admin = 't'").update_all(is_admin: 1)
  User.where("is_admin = 'f'").update_all(is_admin: 0)
end
