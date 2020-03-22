$(document).on 'turbolinks:load', ->
  $('.render_form input').keyup (e) ->
    $('.edit_request').submit()

  $('.edit_request').on 'submit', (e) ->
	$.ajax e.target.action,
	    type: 'PUT'
	    dataType: 'json',
	    data: $(".edit_request").serialize()
	return false