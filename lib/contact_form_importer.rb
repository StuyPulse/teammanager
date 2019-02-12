require 'csv'

class ContactFormImporter
  def import_from_file(filename)
    lines = load_from_file(filename)
    for i in 0..lines.length() - 1
      begin
        import_row(lines[i])
        print "."
      rescue ActiveRecord::RecordInvalid
        puts "Failed to add student at CSV file row: " + (i + 2).to_s
        next
      rescue ActiveRecord::RecordNotUnique
        puts "Student is not unique (at CSV file row " + (i + 2).to_s + ")"
        next
      end
    end
  end

  private

  # Return a CSV::Table from a CSV file
  def load_from_file(filename)
    CSV.read(filename, {headers: true})
  end

  # Given a CSV::Row from the contact form return an instance of the first
  # parent
  def generate_parent_one(row)
    parent_one = Parent.new(first_name: row.fetch("Parent 1's First Name:"),
                            last_name: row.fetch("Parent 1's Last Name:"),
                            phone: row.fetch("Parent 1's Phone Number:"),
                            email: row.fetch("Parent 1's Email:"))
  end

  # Given a CSV::Row from the contact form return an instance of the second
  # parent
  def generate_parent_two(row)
    parent_two = Parent.new(first_name: row.fetch("Parent 2's First Name:"),
                            last_name: row.fetch("Parent 2's Last Name:"),
                            phone: row.fetch("Parent 2's Phone Number:"),
                            email: row.fetch("Parent 2's Email:"))
  end

  # Given a CSV::Row from the contact form return an instance of the student
  def generate_student(row)
    student = Student.new(first_name: row.fetch("First Name:"),
                          last_name: row.fetch("Last Name:"),
                          preferred_name: row.fetch("Preferred Name: (If different from your first name)"),
                          osis: row.fetch("OSIS:"),
                          grad_year: row.fetch("Graduation Year:"),
                          email: row.fetch("Personal Email: (not your stuy.edu email)"),
                          phone: row.fetch("Phone:"))
    begin
      student.team = find_team(row.fetch("Which team are you in?"))
    rescue KeyError
    end
    return student
  end

  def import_row(row)
    parent_one = generate_parent_one(row)
    parent_two = generate_parent_two(row)
    student = generate_student(row)
    ActiveRecord::Base.transaction do
      if parent_one.save
        student.parents << parent_one
        if parent_two.save
          student.parents << parent_two
        end
        if !student.save
          puts "Student invalid: "
          puts student.errors.full_messages
          raise ActiveRecord::RecordInvalid
        end
      else
        puts "Parent one invalid: "
        puts parent_one.errors.full_messages
        raise ActiveRecord::RecordInvalid
      end
    end
  end

  def find_team (team)
    case team
    when 'FRC 694 StuyPulse'
      Team.find_by name: 'StuyPulse'
    when 'FTC 310 Fission'
      Team.find_by name: 'Fission'
    when 'FTC 479 Fusion'
      Team.find_by name: 'Fusion'
    when "Don't know"
      nil
    end
  end
end
