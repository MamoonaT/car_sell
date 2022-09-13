select_to_select2 = ->
  $('#ad_color, #ad_car_make, #ad_city').select2( { tags: true } )

$(document).on 'turbolinks:load', ->
  select_to_select2()
