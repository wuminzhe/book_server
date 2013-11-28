// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
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
  });

});
