select_to_select2 = ->
  $('#ad_city').select2( { tags: true } )

$(document).on 'turbolinks:load', ->
  select_to_select2()
