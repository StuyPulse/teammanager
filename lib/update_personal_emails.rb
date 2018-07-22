require 'csv'

def update_personal_emails(filename)
  CSV.foreach(filename) do |row|
    osis = row[3]
    first_name = row[1]
    last_name = row[2]
    personal_email = row[4]
    gender = row[5]

    student = Student.find_by(osis: osis)
    next if student.nil?

    student.email = personal_email
    student.gender = gender
    student.save!

    if student.first_name != first_name || student.last_name != last_name
      puts "Student name differs."
      puts "Original: #{student.first_name} #{student.last_name}"
      puts "New: #{first_name} #{last_name}"
    end
  end
end
