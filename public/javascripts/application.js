// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function(){
  $("#award_cadet_token_id").tokenInput("/cadets.json", { 
	crossDomain: false,
	prePopulate: $("#award_cadet_token_id").data("pre"),
	tokenLimit: 1,
	hintText: "Type the name of the Cadet"
  });  
  
  $('.delete_ribbon').bind('ajax:success', function() {
    $(this).closest('tr').fadeOut();
  });

  $('.delete_cadet').bind('ajax:success', function() {
    $(this).closest('tr').fadeOut();
  });
  
  $('#contactable').contactable({
    subject: 'Feedback Message from Website',
	url: 'http://jrotcmanage.heroku.com/feedback/'
  });
});