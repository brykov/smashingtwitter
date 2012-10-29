$ ->
  decorate_twits = (context) ->
    $(context).masonry(itemSelector: "li").find("li").css(opacity: "0.7").mouseover(->
      $(this).css opacity: "1"
    ).mouseout ->
      $(this).css opacity: "0.7"


  decorate_twits $("ul.twits")
  $(".load_more_twits a").live "click", ->
    $.get @href,
      ajax: true
    , (responseText) ->
      data = $("<div>" + responseText + "</div>")
      last_ul = $("ul.twits:last")
      new_ul = $("ul.twits", data).insertAfter(last_ul)
      decorate_twits new_ul
      $.scrollTo last_ul
      $.scrollTo new_ul,
        duration: 500
        offset: -50

      $(".load_more_twits").find("img").hide().end().find("a").show().attr "href", $(".load_more_twits a", data).attr("href")

    $(".load_more_twits").find("a").hide().end().find("img").show()
    false

  change_handler = ->
    if $("input", this).val().length > 0
      $("label", this).hide()
    else
      $("label", this).show()

  $("form.coolform .input_with_placeholder").focusin(->
    $("label", this).css "opacity", 0.6
  ).focusout(->
    $("label", this).css "opacity", 1
  ).change(change_handler).keyup(change_handler).change()
  $("form.coolform .input_with_placeholder label").attr("unselectable", "on").css("user-select", "none").on "selectstart", false
