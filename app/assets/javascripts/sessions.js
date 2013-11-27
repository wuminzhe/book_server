//= require jquery
//= require jquery_ujs
//= require jquery.backstretch.min

$(document).ready(function(){
  $.backstretch([
    "images/kid01.jpg",
    "images/kid02.jpg",
    "images/kid03.jpg",
    "images/kid04.jpg"
  ], {duration: 3000, fade: 750});
});
