$(document).ready(function() {
  add_history_support();
});


function add_history_support() {
  $("a[data-remote=true]").click(function(){
    $.getScript(this.href);
    history.pushState(null, '', this.href);
    return false;
  });

  $(window).bind("popstate", function(){
    $.getScript(location.href);
  })
}
