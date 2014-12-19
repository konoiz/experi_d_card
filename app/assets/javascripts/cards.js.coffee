$(document).on 'ready page:load', -> # turbolinks対策
  ### 郵便番号入力フォーム：数値のみの入力 ###
  $('#card_postalcode').keydown ->
    presskey = String.fromCharCode(event.keyCode);
    event.returnValue = /[0-9\b\t\n]/.test(presskey) # 入力受付キーを正規表現で指定

  ### 住所取得ボタン：Ajaxで住所取得 ###
  $('#getarea-button').click ->
    postalcode = $('#card_postalcode').val()
    if postalcode.length != 7
      $("#postalcode-result").css("color","#ff0000").html("郵便番号は７桁です。")
      return false
    $.ajax
      async:    true                             # true:非同期通信
      url:      "/cards/get_area/"
      type:     "GET"
      data:     {search_code: postalcode}
      dataType: "json"
      context:  this
      error: (jqXHR, textStatus, errorThrown) -> # 通信/サーバエラーなど
        $("#postalcode-result").css("color","#ff0000").html(errorThrown)
      success:  (data, textStatus, jqXHR) ->
        if data?                                 # 対象あり
          $("#card_address_prefectural").val(data.prefectural_id) # 県名index更新
          $("#card_address_city").val(data.city)                  # 市区町村名更新
          $("#card_address_street").val(data.street)              # 通り名更新
          $("#postalcode-result").css("color","#00dd00").html("入力が完了しました。")
        else                                     # 対象なし
          $("#postalcode-result").css("color","#ff0000").html("未登録の郵便番号です。")

  ### MSGのリセット ###
  $('.address').change -> $("#postalcode-result").html("")

$ ->
  $(document).on 'change', '#card_department', (evt) ->
    $.ajax 'update_courses',
       type: 'GET'
       dataType: 'script'
       data: {
         department: $("#card_department option:selected").val()
       }
       error: (jqXHR, textStatus, errorThrown) ->
         console.log("AJAX Error: #{textStatus}")
       success: (data, textStatus, jqXHR) ->
         console.log("Dynamic country select OK!")
    $.ajax 'update_laboratories',
       type: 'GET'
       dataType: 'script'
       data: {
         department: $("#card_department option:selected").val()
       }
       error: (jqXHR, textStatus, errorThrown) ->
         console.log("AJAX Error: #{textStatus}")
       success: (data, textStatus, jqXHR) ->
         console.log("Dynamic country select OK!")

