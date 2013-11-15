//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require underscore
//= require backbone
//= require jquery.pjax

$(function() {
  $(document).pjax('a:not([data-remote]):not([data-behavior]):not([data-skip-pjax])', '[data-pjax-container]')
});
