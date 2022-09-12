select_to_select2 = ->
  $('#ad_transmission_type').select2( { tags: true } )

$(document).on 'turbolinks:load', ->
  select_to_select2()
