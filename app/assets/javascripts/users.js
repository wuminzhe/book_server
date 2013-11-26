//= require jquery
//= require jquery_ujs
//= require bootstrap/modal

////////////////////
// plupload
////////////////////
//= require moxie
//= require plupload.dev

// optional, only needed if you'd like to use plupload localized
//= require plupload/i18n/zh_CN

// optional, but recommended. it sets generic settings like flash url, etc.
//= require plupload.settings

// optional, only if you want to use the jquery integration
//= require jquery.plupload.queue

$(document).ready(function() {

  $("#operations > a.list-group-item").click(function(){
    $("#operations > a.list-group-item").removeClass("active");
    $(this).addClass("active");
  })

});

