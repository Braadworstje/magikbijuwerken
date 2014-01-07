# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


  # enable chosen js
$ ->
  $('.chosen-quality-select').chosen({
    allow_single_deselect: true,
    no_results_text: 'Geen resultaten gevonden',
    placeholder_text_multiple: 'Selecteer kwaliteiten',
    width: '200px'});

$ ->
  $('.chosen-skill-select').chosen({
    allow_single_deselect: true,
    no_results_text: 'Geen resultaten gevonden',
    placeholder_text_multiple: 'Selecteer kwaliteiten',
    width: '200px'});

$ ->
  $('.chosen-vacancy-select').chosen({
    allow_single_deselect: true,
    no_results_text: 'Geen resultaten gevonden',
    placeholder_text_multiple: 'Selecteer vacature',
    width: '200px'});

