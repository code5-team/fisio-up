$(function() {
  $.rails.allowAction = function(link) {
    if (!link.attr("data-confirm")) {
      return true;
    }

    $.rails.showConfirmDialog(link);
    return false;
  };

  $.rails.confirmed = function(link) {
    link.removeAttr("data-confirm");
    return link.trigger("click.rails");
  };

  return $.rails.showConfirmDialog = function(link) {
    var html, message;
    html = void 0;
    message = void 0;
    message = link.attr("data-confirm");
    html = "<div id=\"modal1\" class=\"modal\" style=\"z-index: 1003; display: block; opacity: 1; transform: scaleX(1); top: 10%;\"> <div class=\"modal-content\"><h4>" + message + "</h4></div><div class=\"modal-footer\"><a class=\"modal-action modal-close waves-effect waves btn-flat close\">Cancel</a><a class=\"modal-action modal-close waves-effect waves btn-flat confirm\">OK</a></div></div>";
    $("body").append(html);    

    $("#modal1").modal({
      complete: function() {
        return $("#modal1").remove();
      }
    });

    $('#modal1').modal('open');

    $("#modal1 .close").on("click", function() {
      return $("#modal1").modal('close');
    });

    return $("#modal1 .confirm").on("click", function() {
      return $.rails.confirmed(link);
    });
  };
});
