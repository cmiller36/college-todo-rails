var Comment = function(attributes) {
  this.id = attributes.id;
  this.content = attributes.content;
  this.user = attributes.user;
  this.created_at = attributes.created_at;
};


Comment.prototype.renderComment = function() {
  var html = "";
  html += '<ol class="list-unstyled" id="comment-" + comment.id >';
  html += '<li><strong>' +  this.user.username + '</strong>' + " " + ':' + " " + '<p>' + this.content + " " + this.created_at + '</p></li>';
  html += '</ol>';
  return html;
};


 var attachListener = function() {
    $("form#new_comment").on("submit", function(event) {
    event.preventDefault();
    var $form = $(this);
    var action = $form.attr("action");
    var params = $form.serialize();
    $.ajax({
      url: action,
      data: params,
      dataType: "json",
      method: "POST"
    }).success(function(json) {
      $(".commentText").val("");
      var comment = new Comment(json);
      var renderComment = comment.renderComment();
      $("#commentSection").append(renderComment);
      });
    });
}
  
$(document).ready(function() {
  getComment();
  attachListener();
});