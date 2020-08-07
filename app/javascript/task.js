const { ajax } = require("jquery");

$(document).ready(function () {
  $(document).on("click", "#complete", function(){
    var list_id = window.location.href.split("lists/")[1].split("/tasks")[0];
    $.ajax({
      type: "get",
      url: `/lists/${list_id}/filtered_tasks`,
      data: {
        type: "complete"
      },
    });

  })
  $(document).on("click", "#incomplete", function(){
    var list_id = window.location.href.split("lists/")[1].split("/tasks")[0];
    $.ajax({
      type: "get",
      url: `/lists/${list_id}/filtered_tasks`,
      data: {
        type: "incomplete"
      },
    });

  })
});