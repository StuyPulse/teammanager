# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  $(".delete_ajax").live "ajax:success", (evt, data, status, xhr) -> 
    $(this).closest("tr").removeClass("success").addClass("error")
    $(this).siblings(".add_ajax").removeClass "hidden"
    $(this).remove()
  
  $(".delete_ajax").live "ajax:error", (evt, data, status, xhr) -> 
    alert "ERROR. Safety Test was not deleted successfully."
  
  $(".submit_children").click ->
    button_children = $(this).find "button:visible"
    if button_children.length > 0
      button_children[0].click()
    
    link_children = $(this).find "a:visible"
    if link_children.length > 0
      link_children[0].click()
