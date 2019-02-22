require 'test_helper'
require 'service_importer'

class ServiceImporterTest < ActiveSupport::TestCase

  #The student id is NOT the OSIS.
  #Instances of importers and events.
    si = ServiceImporter.new
    govIsland = Event.first

  test "create a single service" do
    #Check to see if a service exists containing the same student ID and hours.
    si.add_services_to_event(govIsland, "123456783 4")
    assert govIsland.services.where(student_id: Student.find_by(osis: 123456783).id, hours: 4).exists?
  end

  test "create a service with a non-existing student" do
    si.add_services_to_event(govIsland, "211231223 100")
    refute govIsland.services.where(student_id: 211231223, hours: 100).exists?
  end

  test "create multiple services" do
    si.add_services_to_event(govIsland, "123456783 100\n123456781 4")
    assert govIsland.services.where(student_id: Student.find_by(osis: 123456783).id, hours: 100).exists? && govIsland.services.where(student_id: Student.find_by(osis: 123456781).id, hours: 4).exists?
  end

  test "create a service with a student already on the service." do
    si.add_services_to_event(govIsland, "123456782 100")
    refute govIsland.services.where(student_id: Student.find_by(osis: 123456782).id, hours: 100).exists?
  end
end
