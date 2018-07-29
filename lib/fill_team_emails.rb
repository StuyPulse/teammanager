require 'csv'

def fill_team_emails(filename)
  CSV.foreach(filename) do |row|
    first_name = row[0]
    last_name = row[1]
    team_email = row[2]

    students = Student.where(first_name: first_name, last_name: last_name)

    if students.empty?
      puts "Warning! #{first_name} #{last_name} is not a student!"
      next
    end

    if students.length > 1
      puts "Warning! Multiple students found for #{first_name} #{last_name}"
      next
    end

    student = students.take
    student.team_email = team_email
    student.save!
    puts "Updated email for #{first_name} #{last_name}!"
  end
end

