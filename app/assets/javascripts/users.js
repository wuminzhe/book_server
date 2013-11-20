//= require jquery
//= require jquery_ujs

$(document).ready(function() {

  $("#operations > a.list-group-item").click(function(){
    $("#operations > a.list-group-item").removeClass("active");
    $(this).addClass("active");
  })

});