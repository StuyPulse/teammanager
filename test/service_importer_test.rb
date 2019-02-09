require 'test_helper'
require 'service_importer'

class ServiceImporterTest < ActiveSupport::TestCase

  test "create a single service" do 
    #Run the method here: Params --> 213300452 4
    #Check to see if a service exists containing the same student ID and hours.
    si = ServiceImporter.new
    govIsland = Event.first
    si.add_services_to_event(govIsland, "123456783 4")
    assert govIsland.services.where(student_id: Student.find_by(osis: 123456783).id, hours: 4).exists?
  end

  #test "create multiple services" do
  #  #Run the method here: Params -->  213300452 100
  #  refute @event.where(:service_params.where(student_id: 213300452 and hours: 100) 
  #end
end
