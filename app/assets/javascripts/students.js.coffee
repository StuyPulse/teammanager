# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  $(".delete_safety_test").live "ajax:success", (evt, data, status, xhr) -> 
    $(this).closest("tr").fadeOut()
  
  $(".delete_safety_test").live "ajax:error", (evt, data, status, xhr) -> 
    alert "ERROR. Safety Test was not deleted successfully."
  
