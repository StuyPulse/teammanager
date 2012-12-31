# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  $(".delete-ajax").live "ajax:beforeSend", (evt, data, status, xhr) ->
    $(this).find("button")[0].disabled = "disabled"

  $(".delete-ajax").live "ajax:success", (evt, data, status, xhr) -> 
    $(this).closest("tr").removeClass("success").addClass("error")
    $(this).siblings(".add-ajax").removeClass "hidden disabled"
    $(this).remove()
  
  $(".delete-ajax").live "ajax:error", (evt, data, status, xhr) -> 
    alert "ERROR. Item was not deleted successfully."
  
  $(".add-ajax").click ->
    $(this).addClass "disabled"
  
  $(".load-more").click ->
    subject = $(this).data("subject")
    $("table[data-subject=" + subject + "]").find("tr").removeClass("hidden")
    $(this).closest("tr").remove()
