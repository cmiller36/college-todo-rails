var Comment = function(attributes) {
  this.id = attributes.id;
  this.content = attributes.content;
  this.user = attributes.user;
  this.created_at = attributes.created_at;
};

Comment.prototype.deleteLink = function() {
  var output = '<a class="btn btn-danger btn-xs" data-confirm="Are you sure you want to delete?" rel="nofollow" data-method="delete" href="/stories/:story_id/comments/' + this.id + '">';
    output += '<span class="glyphicon glyphicon-remove"></span>';
    output += '</a>';
  return output;
}

Comment.prototype.renderComment = function() {
  var html = "";
  html += '<ol class="list-unstyled" id="comment-" + comment.id >';
  html += '<li><strong>' +  this.user.username + '</strong>' + " " + ':' + " " + this.content + " " + this.deleteLink() +'</li>';
  html += '</ol>';
  return html;
};


 var attachListener = function() {
    $(document).on('submit', 'form#new_comment', function(event){
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
  attachListener();
});