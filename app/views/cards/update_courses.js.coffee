$("#card_course").empty()
  .append("<%= escape_javascript(render(:partial => @course)) %>")
