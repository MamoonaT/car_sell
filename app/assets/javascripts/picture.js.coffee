bind_show_image = ->
  ad_images = document.querySelector('#ad_images')
  if ad_images
    ad_images.addEventListener 'change', ->
      if ad_images.files && ad_images.files[0]
        reader = new FileReader
        reader.onload = (e) ->
          $('#img_prev').attr('src', e.target.result).width(150).height 150
        reader.readAsDataURL ad_images.files[0]

$(document).on 'turbolinks:load', ->
  bind_show_image()