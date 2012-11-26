require 'csv'

module StudentsHelper
  def generate_csv
    csv_string = CSV.generate do |csv|
      csv << ["Name", "Email"]
      Student.order(:last_name).each do |student|
        CSV << [student.first_name + student.last_name, student.email]
      end
    end
  end
end
