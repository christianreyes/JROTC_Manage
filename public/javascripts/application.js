// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function(){
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