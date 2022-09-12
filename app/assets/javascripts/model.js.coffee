select_to_select2 = ->
  $('#ad_car_make').select2( { tags: true } )

$(document).on 'turbolinks:load', ->
  select_to_select2()
