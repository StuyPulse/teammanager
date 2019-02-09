class ServiceImporter

  # input is a string that has student osises and hours like so:
  # Each line has an OSIS, space, and # of hours per line.
  # (osis)  (hrs)
  # 213300452 3
  # 324324321 5
  def add_services_to_event(event, input)
    @wrong_ids = []
    @arr = input.split("\n").map(&:to_s)

    for i in @arr
      sub_arr = i.split(" ").map(&:to_i)
      student = Student.find_by(osis: sub_arr[0])
      hours = sub_arr[1]
      if !student
        @wrong_ids << sub_arr[0]
      elsif !event.students.find_by(osis: sub_arr[0]) && student
        event.services.create(:student_id => student.id, :event_id => event.id, :hours => hours).save!
      end
    end
  end
end
