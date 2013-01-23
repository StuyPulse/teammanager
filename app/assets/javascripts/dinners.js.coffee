# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$("document").ready ->
  $(".toggle-old-dinners").click ->
    $(".old-dinners").css "visibility", "visible"
    $(".old-dinners").slideToggle 600
    $(this).find("i").toggleClass "icon-plus"
    $(this).find("i").toggleClass "icon-minus"
