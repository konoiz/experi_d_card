$("#card_course").empty()
  .append("<option value=\"0\">" + I18n.t("js.please_select") + "</option>")
  .append("<%= escape_javascript(render(:partial => @course)) %>")
