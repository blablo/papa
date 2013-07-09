$(document).on "nested:fieldAdded", (event) ->
  field = event.field
  dateField = field.find(".product_id")
  console.log dateField

getTotal = ->
  sum = 0
  $(".f_valor").each ->
    sum += Number($(this).val())
  return sum


$(document).ready ->
  $("#search").keyup ->
    searchTable $(this).val()
  $("#menu_list .main_menu li").click ->
    $(".pc" + $(this).attr('rel')).show()
    $(".main_menu").hide()
  $(".back_main").click ->
    $(".main_menu").show()
    $(".submenu").hide()

  $(".submenu .thumbnail").click ->
    $(".add_nested_fields").click()
    $("#sale_list .fields :last").parent().parent().find(".precio").html($(this).attr('price'))
    $("#sale_list .fields :last").parent().parent().find(".precio").formatCurrency()
    $("#sale_list .fields :last").parent().parent().find(".p_name").html($(this).attr('name'))
    $("#sale_list .fields :last").parent().parent().find(".f_precio").val($(this).attr('price'))
    $("#sale_list .fields :last").parent().parent().find(".f_product").val($(this).attr('product_id'))
    cantidad = parseInt($("#display").val())
    cantidad = 1  if isNaN(cantidad)
    valor = cantidad * parseFloat($(this).attr('price'))
    console.log valor
    $("#sale_list .fields :last").parent().parent().find(".cantidad").html(cantidad)
    $("#sale_list .fields :last").parent().parent().find(".f_cantidad").val(cantidad)
    $("#sale_list .fields :last").parent().parent().find(".valor").html(valor)
    $("#sale_list .fields :last").parent().parent().find(".valor").formatCurrency()
    $("#sale_list .fields :last").parent().parent().find(".f_valor").val(valor)
    $("#display").val("")
    $(".total span").html(getTotal())
    $("#moneypad .dado span").html(getTotal())
    $(".total span").formatCurrency()
    $("#moneypad .dado span").formatCurrency()
    $(".main_menu").show()
    $(".submenu").hide()

  $("#numpad .number").click ->
    $("#display").val(parseFloat($("#display").val()+$(this).html()))
  $(".empty_display").click ->
    $("#display").val("")
  $(".punto").click ->
    $("#display").val($("#display").val()+".")

  $("#numpad .minus").click ->
    dinero = parseFloat($("#display").val())*-1
    if isNaN(dinero) == false
      $(".add_nested_fields").click()
      $("#sale_list .fields :last").parent().parent().find(".p_name").html('-')
      $("#sale_list .fields :last").parent().parent().find(".f_product").val('')
      $("#sale_list .fields :last").parent().parent().find(".precio").html(dinero)
      $("#sale_list .fields :last").parent().parent().find(".precio").formatCurrency()
      $("#sale_list .fields :last").parent().parent().find(".f_precio").val(dinero)
      $("#sale_list .fields :last").parent().parent().find(".cantidad").html("1")
      $("#sale_list .fields :last").parent().parent().find(".f_cantidad").val("1")
      $("#sale_list .fields :last").parent().parent().find(".valor").html(dinero)
      $("#sale_list .fields :last").parent().parent().find(".valor").formatCurrency()
      $("#sale_list .fields :last").parent().parent().find(".f_valor").val(dinero)
      $("#display").val("")
      $(".total span").html(getTotal())
      $("#moneypad .dado span").html(getTotal())
      $(".total span").formatCurrency()
      $("#moneypad .dado span").formatCurrency()


  $("#numpad .plus").click ->
    dinero = parseFloat($("#display").val())
    if isNaN(dinero) == false
      $(".add_nested_fields").click()
      $("#sale_list .fields :last").parent().parent().find(".p_name").html('+')
      $("#sale_list .fields :last").parent().parent().find(".f_product").val('')
      $("#sale_list .fields :last").parent().parent().find(".precio").html(dinero)
      $("#sale_list .fields :last").parent().parent().find(".precio").formatCurrency()
      $("#sale_list .fields :last").parent().parent().find(".f_precio").val(dinero)
      $("#sale_list .fields :last").parent().parent().find(".cantidad").html("1")
      $("#sale_list .fields :last").parent().parent().find(".f_cantidad").val("1")
      $("#sale_list .fields :last").parent().parent().find(".valor").html(dinero)
      $("#sale_list .fields :last").parent().parent().find(".valor").formatCurrency()
      $("#sale_list .fields :last").parent().parent().find(".f_valor").val(dinero)
      $("#display").val("")
      $(".total span").html(getTotal())
      $("#moneypad .dado span").html(getTotal())
      $(".total span").formatCurrency()
      $("#moneypad .dado span").formatCurrency()


  $("#moneypad .number").click ->
    number = $('#moneypad .dado span').asNumber()
    number2 = $(this).asNumber()
    number = 0 if number == getTotal()
    $("#moneypad .dado span").html(number2+number)
    $("#moneypad .cambio span").html(number2+number-getTotal())
    console.log number2 + " + " + number + " - " + getTotal()
    $("#moneypad .dado span").formatCurrency()
    $("#moneypad .cambio span").formatCurrency()

  $("#moneypad .empty_money").click ->
    $("#moneypad .dado span").html("0")
    $("#moneypad .cambio span").html("0")
    $("#moneypad .dado span").formatCurrency()
    $("#moneypad .cambio span").formatCurrency()
