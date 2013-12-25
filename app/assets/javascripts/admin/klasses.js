if(typeof(String.prototype.trim) === "undefined")
{
  String.prototype.trim = function()
  {
    return String(this).replace(/^\s+|\s+$/g, '');
  };
}

function grade(grade_id) {
  var result = '小';
  grade_id = parseInt(grade_id);

  $.each([['小', 1], ['中', 2], ['大', 3]], function(i, grade){
    
    if(grade[1] === grade_id) {
      result = grade[0];
    }

  });
  return result;
}


