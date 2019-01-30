require 'test_helper'

class ServiceImporterTest < ActiveSupport::TestCase

  test "create a single service" do 
    #Run the method here: Params --> 213300452 4
    #Check to see if a service exists containing the same student ID and hours.
    assert govisland.services.where(student_id: 213300452 and hours: 4) 
  end

  test "create multiple services" do
    #Run the method here: Params -->  213300452 100
    refute @event.where(:service_params.where(student_id: 213300452 and hours: 100) 
  end
