ready = ->
  $("#url").keyup ->
    if $("#url").val() !=  $("#pre_url").val() && $("#url").val != ""
      $("#video-preview .loading").removeClass "none"
      $("#video-preview iframe").remove()
      $.ajax(
        url: "mains/get_video_url"
        type: "get"
        dataType: "json"
        data:
          url: $("#url").val()
      ).success (json) ->
        if json.status is true
          $("#pre_url").val $("#url").val()
          embed_url = "<iframe src='" + json.embed_url + "' frameborder='0' width='480' height='360' allowfullscreen='allowfullscreen'></iframe>"
          $("#video-preview .loading").addClass "none"
          $("#video-preview").append embed_url
          $("#video-preview").removeClass "none"
        else
          alert json.msg




$(document).ready(ready)
$(document).on('page:load', ready)
